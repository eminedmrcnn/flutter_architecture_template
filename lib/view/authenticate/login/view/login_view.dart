import 'package:flutter/material.dart';
import 'package:flutter_onboard/core/base/widget/base_widget.dart';
import 'package:flutter_onboard/core/extension/context_extension.dart';
import 'package:flutter_onboard/view/authenticate/login/viewModel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) =>
          buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) => Scaffold(
        body: ListView(
          children: [
            Container(
              padding: context.paddingLow,
              height: context.height * .4,
              color: Theme.of(context).buttonTheme.colorScheme!.onPrimary,
              child: buildText(context),
            )
          ],
        ),
      );

  Text buildText(BuildContext context) {
    return Text(
      'Hello',
      style: context.textTheme.headline1!
          .copyWith(color: context.theme.primaryColor),
    );
  }
}
