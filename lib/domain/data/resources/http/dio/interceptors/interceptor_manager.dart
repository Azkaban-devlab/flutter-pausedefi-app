import 'dart:async';

import 'package:app/domain/data/resources/http/dio/interceptors/error.interceptor.dart';
import 'package:app/domain/data/resources/storage/dao/auth.dao.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../dio.client.dart';
import 'authorization_bearer.interceptor.dart';
import 'refresh_token.interceptor.dart';

///
/// [CanInterceptorEvent]
///
mixin CanInterceptorEvent<T> {
  ///
  void Function(InterceptorEvent<T> event)? onEmit;
}

///
/// [InterceptorEvent]
///
class InterceptorEvent<T> {
  ///
  /// Data sent through event
  ///
  final T? data;

  ///
  /// Constructor
  ///
  InterceptorEvent({this.data});
}

///
/// [InterceptorManager]
/// This class manage all Interceptors
/// used in the request lifecycle.
///
/// It can be accessed using injector as
/// it is provided to GetIt
///
/// Each Interceptor added can emi an event
/// that can be listen everywhere using the
/// getter [stream]
///
@singleton
class InterceptorManager {
  ///
  /// [AuthDAO]
  ///
  final AuthDAO authDAO;

  ///
  /// [DioClient]
  ///
  final DioClient dioClient;

  ///
  /// [Completer<Object?>]
  ///
  final Completer<Object?> _completer = Completer<Object?>();

  final Set<Object> _interceptors;

  final StreamController<InterceptorEvent<dynamic>> _controller;

  ///
  /// Constructor
  ///
  InterceptorManager({
    required this.dioClient,
    required this.authDAO,
  })  : _controller = StreamController<InterceptorEvent<dynamic>>(),
        _interceptors = <Object>{} {
    _initalizeInterceptors();
  }

  ///
  /// Stream to listen to any error event
  ///
  Stream<InterceptorEvent<dynamic>> get stream =>
      _controller.stream.asBroadcastStream();

  ///
  /// Tells the manager that he can emi events
  ///
  void canEmit() {
    if (!_completer.isCompleted) {
      _completer.complete(SynchronousFuture<Object?>(null));
    }
  }

  T _checkAndInit<T>(T interceptor) {
    if (interceptor is CanInterceptorEvent) {
      interceptor.onEmit = _emit;
    }
    return interceptor;
  }

  Future<void> _emit<T>(InterceptorEvent<T> event) async {
    // Wait until the interceptor can emit
    // It should wait that another service calls the [canEmit] method
    if (!_completer.isCompleted) {
      await _completer.future;
    }
    _controller.add(event);
  }

  void _initalizeInterceptors() {
    // AuthoriztionBearerInterceptor
    _interceptors.add(_checkAndInit<AuthorizationBearerInterceptor>(
        AuthorizationBearerInterceptor(authDAO, dioClient)));

    // RefreshTokenInterceptor
    _interceptors.add(_checkAndInit<RefreshTokenInterceptor>(
        RefreshTokenInterceptor(authDAO, dioClient)));

    // ErrorInterceptor
    // Always add it at last
    _interceptors
        .add(_checkAndInit<ErrorInterceptor>(ErrorInterceptor(dioClient)));
  }
}
