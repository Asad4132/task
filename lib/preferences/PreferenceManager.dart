import 'package:task/login/model/User.dart';
import 'package:task/preferences/SharedPref.dart';

class PreferenceManager {
  static SharedPref preferences = SharedPref();

  Future getUser() async {
    try {
      UserClass user = UserClass.fromJson(await preferences.read("user"));
      return user;
    } catch (e) {
      // do something
    }
  }

  saveUser(UserClass user) {
    preferences.save("user", user);
  }

  logout() {
    preferences.remove("user");
  }
}
