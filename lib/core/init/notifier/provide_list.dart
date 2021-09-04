import 'package:flutter/material.dart';
import 'package:flutter_onboard/core/init/navigation/navigation_service.dart';
import 'package:flutter_onboard/core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider? get instance {
    if (_instance == null) {
      _instance = ApplicationProvider._init();
    }
    return _instance;
  }

  ApplicationProvider._init();
   
   List<SingleChildWidget> singleItem = [];

  List<SingleChildWidget> dependItem = [
    ChangeNotifierProvider(create: (context) => ThemeNotifier(),),
    Provider.value(value: NavigationService.instance),
  ];
   List<SingleChildWidget> uiChangesItem = [];
}
