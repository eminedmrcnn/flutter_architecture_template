import 'package:dio/dio.dart';
import 'package:flutter_onboard/core/constants/enums/preferences_keys_enum.dart';
import 'package:flutter_onboard/core/init/cache/locale_manager.dart';
import 'package:flutter_onboard/core/init/network/ICoreDio.dart';

import 'core_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  ICoreDioNullSafety? coreDio;

  NetworkManager._init() {
    final baseOptions =
        BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/', headers: {'val': LocaleManager.instance!.getStringValue(PreferencesKeys.TOKEN)});
    // _dio = Dio(baseOptions);

    coreDio = CoreDio(baseOptions);

    // _dio.interceptors.add(InterceptorsWrapper(
    //   onRequest: (options) {
    //     options.path += "veli";
    //   },
    //   onError: (e) {
    //     return BaseError(e.message);
    //   },
    // ));
  }
}