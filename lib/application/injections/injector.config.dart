// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../../domain/data/resources/http/dio/dio.client.dart' as _i4;
import '../../domain/data/resources/http/dio/interceptors/interceptor_manager.dart'
    as _i15;
import '../../domain/data/resources/storage/dao/auth.dao.dart' as _i13;
import '../../domain/data/resources/storage/dao/room.dao.dart' as _i9;
import '../../domain/data/resources/storage/dao/user.dao.dart' as _i12;
import '../../domain/data/resources/storage/local.storage.dart' as _i8;
import '../../domain/services/injected/authentication.service.dart' as _i14;
import '../../domain/services/injected/http_interceptor.service.dart' as _i16;
import '../../domain/services/injected/room.service.dart' as _i10;
import '../../domain/services/injected/theme.service.dart' as _i11;
import '../../domain/services/injected/ui.service.dart' as _i6;
import '../../infrastructure/interfaces/storage.interface.dart' as _i7;
import '../routing/app.router.dart' as _i3;
import 'injector.module.dart' as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injecorModule = _$InjecorModule();
  gh.factory<_i3.AppRouter>(() => injecorModule.appRouter);
  gh.singleton<_i4.DioClient>(_i4.DioClient());
  await gh.factoryAsync<_i5.SharedPreferences>(
      () => injecorModule.sharedPreferences,
      preResolve: true);
  gh.singleton<_i6.UiService>(_i6.UiService());
  gh.singleton<_i7.IStorage>(_i8.LocalStorage(get<_i5.SharedPreferences>()));
  gh.singleton<_i9.RoomDAO>(_i9.RoomDAO(get<_i7.IStorage>()));
  gh.singleton<_i10.RoomService>(_i10.RoomService(get<_i9.RoomDAO>()));
  gh.singleton<_i11.ThemeService>(_i11.ThemeService(get<_i7.IStorage>()));
  gh.singleton<_i12.UserDAO>(_i12.UserDAO(get<_i7.IStorage>()));
  gh.singleton<_i13.AuthDAO>(
      _i13.AuthDAO(get<_i7.IStorage>(), get<_i12.UserDAO>()));
  gh.singleton<_i14.AuthenticationService>(
      _i14.AuthenticationService(get<_i13.AuthDAO>()));
  gh.singleton<_i15.InterceptorManager>(_i15.InterceptorManager(
      dioClient: get<_i4.DioClient>(), authDAO: get<_i13.AuthDAO>()));
  gh.singleton<_i16.HttpInterceptorService>(
      _i16.HttpInterceptorService(get<_i15.InterceptorManager>()));
  return get;
}

class _$InjecorModule extends _i17.InjecorModule {}
