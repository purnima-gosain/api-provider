import 'package:api_n_provider/home.dart';
import 'package:flutter/cupertino.dart';

class UserPage extends ChangeNotifier {
  Page? _pageModel;
  bool loading = false;
  Page? get pageModel {
    return _pageModel;
  }

  set postM(Page? pageM) {
    _pageModel = pageM;
  }

  fetchData() async {
    loading = true;
    notifyListeners();
    _pageModel = (await getData()) as Page?;
    loading = false;

    notifyListeners();
  }
}
