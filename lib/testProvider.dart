import 'package:flutter/foundation.dart';
import 'model.dart';

class TestProvider with ChangeNotifier {
  List<usermodel> userdata = [];
  List<usermodel> getProvider() {
    return userdata;
  }

  void addusermodel(usermodel statement) {
    userdata.insert(0, statement);
    //userdata.add(statement);
    notifyListeners();
  }

  void removeUserData(usermodel userModel) {
    userdata.remove(userModel);
    notifyListeners();
  }

  List<usermodel> getSortedUserdataByProvince() {
    userdata.sort((a, b) => a.province!.compareTo(b.province.toString()));
    return userdata;
  }
}
