import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_onboard/core/constants/enums/preferences_keys_enum.dart';
import 'package:flutter_onboard/core/init/cache/locale_manager.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/widget/base_widget.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/language_manager.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/test_view_model.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  TestViewModel? viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onModelReady: (model) {
        viewModel = model;
      },
      onPageBuilder: (context, value) => scaffoldBody,
    );
  }

  Widget get scaffoldBody => Scaffold(
        appBar: appBar(),
        floatingActionButton: floatingActionButtonNumberIncrement,
        body: textNumber,
      );

  AppBar appBar() {
    return AppBar(
      leading: Text(
        LocaleManager.instance!.getStringValue(PreferencesKeys.TOKEN),
      ),
      title: textWelcomeWidget(),
      actions: [iconButonChangeTheme()],
    );
  }

  Widget get textNumber {
    return Column(
      children: [
        
        Observer(
          builder: (context) => Text(
            viewModel!.number.toString(),
          ),
        ),
      ],
    );
  }

  Text textWelcomeWidget() => Text(LocaleKeys.welcome.locale);

  IconButton iconButonChangeTheme() {
    return IconButton(
      icon: Icon(Icons.change_history),
      onPressed: () {
        context.locale = LanguageManager.instance!.enLocale;
      },
    );
  }

  FloatingActionButton get floatingActionButtonNumberIncrement {
    return FloatingActionButton(
      onPressed: () => viewModel!.incrementNumber(),
    );
  }

  
}
