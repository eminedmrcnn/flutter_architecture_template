import 'package:flutter/material.dart';
import 'package:flutter_onboard/core/extension/string_extension.dart';

class LocalText extends StatelessWidget {
  final String? value;
  const LocalText({Key? key, @required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      value!.locale,
      );
  }
}
