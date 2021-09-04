import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_onboard/core/base/model/base_error.dart';
import 'package:flutter_onboard/core/base/model/base_model.dart';
import 'package:flutter_onboard/core/constants/enums/preferences_keys_enum.dart';
import 'package:flutter_onboard/core/init/cache/locale_manager.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    if (_instance == null) {
      _instance = NetworkManager._init();
    }
    return _instance;
  }

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      headers: {
        'val': LocaleManager.instance!.getStringValue(PreferencesKeys.TOKEN)
      },
    );

    _dio = Dio(baseOptions);

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options) {
        options.path += 'veli';
      },
      onError: (e) {
        return BaseError(e.message);
      },
    ));
  }

  Dio _dio;

  Future<dynamic> dioGet<T extends BaseModel>(String? path, T? model) async {
    final response = await _dio.get(path!);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;
        if (responseBody is List) {
          return responseBody.map((e) => model!.fromJson(e)).toList();
        } else if (responseBody is Map) {
          return model!.fromJson(responseBody);
        }
        return responseBody;
        break;
      default:
    }
  }
}
