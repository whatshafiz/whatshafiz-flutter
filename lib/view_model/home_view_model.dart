import 'package:whatshafiz/core/viewmodel/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel(super.context);
  int selectedIndex = 0;
  void onItemTapped() {
    selectedIndex++;
    notifyListeners();
}
  }
