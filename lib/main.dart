
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/cache/locale_manager.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/provide_list.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'view/authenticate/test/view/test_view.dart';

void main() {
  LocaleManager.preferencesInit();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance!.dependItem],
    child: EasyLocalization(
      child: MyApp(),
      supportedLocales: LanguageManager.instance!.supporteedLocales,
      path: ApplicationConstants.LANG_ASSETS_PATH,
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
      home: TestView(),
      onGenerateRoute: NavigationRoute.instance!.generateRoute,
      navigatorKey: NavigationService.instance!.navigatorKey,
    );
  }
}
