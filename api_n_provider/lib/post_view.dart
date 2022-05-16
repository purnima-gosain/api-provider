import 'package:api_n_provider/home.dart';
import 'package:api_n_provider/post_model.dart';
import 'package:flutter/cupertino.dart';

class UserPage extends ChangeNotifier {
  Pages? _pageModel;
  bool loading = false;
  Pages? get pageModel {
    return _pageModel;
  }

  set postM(Pages? pageM) {
    _pageModel = pageM;
  }

  fetchData() async {
    loading = true;
    notifyListeners();
    _pageModel = (await getData());
    loading = false;

    notifyListeners();
  }
}
