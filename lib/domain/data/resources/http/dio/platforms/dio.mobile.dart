import 'package:app/domain/data/resources/http/dio/transformers/json_transformer.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

///
/// [DioPlatform]
///
class DioPlatform extends DioForNative {
  ///
  /// Constructor
  ///
  DioPlatform([BaseOptions? options]) : super(options) {
    transformer = JsonTransformer();
  }
}
