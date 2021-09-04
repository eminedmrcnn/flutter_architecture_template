// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';

extension StringLocalization on String {
  String get locale => this.tr();
}