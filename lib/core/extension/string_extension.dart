// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter_onboard/core/constants/app/app_constants.dart';

extension StringLocalization on String {
  String get locale => this.tr();

  String? get isValidEmail =>
      this.contains(RegExp(ApplicationConstants.EMAIL_REGEX)) ? null : 'Email does not valid';
}
