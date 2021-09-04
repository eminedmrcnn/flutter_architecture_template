import 'package:flutter/cupertino.dart';
import 'package:flutter_onboard/core/init/navigation/INavigationService.dart';

class NavigationService implements INavigationService {
  static NavigationService? _instance = NavigationService._init();
  static NavigationService? get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final removeAllOldRoutes = (Route<dynamic>? route) => false;

  @override
  Future<void> navigatePage({String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path!, arguments: data);
  }

  @override
  Future<void> navigatePageClear({String? path, Object? data}) async {
    await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path!, (route) => false);
  }
}
