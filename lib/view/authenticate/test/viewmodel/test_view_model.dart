import 'package:flutter/widgets.dart';
import 'package:flutter_onboard/core/constants/enums/app_theme_enums.dart';
import 'package:flutter_onboard/core/init/network/network_manager.dart';
import 'package:flutter_onboard/core/init/notifier/theme_notifier.dart';
import 'package:flutter_onboard/view/authenticate/test/model/test_model.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store {
  BuildContext? context;

  void setContext(BuildContext context) {
    this.context = context;
  }

  @observable
  bool isLoading = false;

  @observable
  int number = 0;

  @computed
  bool get isEven => number % 2 == 0;

  @action
  void incrementNumber() {
    number++;
  }

  void changeTheme() {
    Provider.of<ThemeNotifier>(context!, listen: false)
        .changeValue(AppThemes.DARK);
  }

  @action
  Future<void> getSampleRequest() async {
    isLoading = true;
    final list =  await NetworkManager.instance!.dioGet<TestModel>('x', TestModel());
    if (list is List){
      
    }
    isLoading = false;
  }
}
