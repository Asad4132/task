import 'package:dio/dio.dart';
import 'package:task/TaskApp.dart';
import 'package:task/Utilities.dart';
import 'package:task/base/BasePresenter.dart';
import 'package:task/login/model/PostBodyLogin.dart';
import 'package:task/login/view/LoginPageMVPView.dart';

//ignore_for_file: unnecessary_statements

class LoginManager extends BasePresenter<LoginPageMVPView> {
  bool checkDataValidity(String email, String password) {
    if (email.isNotEmpty && password.isNotEmpty) return true;
    if (email.isEmpty)
      Utilities.showRedToast('Please input valid email');
    else if (password.isEmpty)
      Utilities.showRedToast('Password cannot be empty');
    return false;
  }

  Future login(String email, String password) async {
    var result = await TaskApp.getWebService()
        .login(
            "application/json", PostBodyLogin(email: email, password: password))
        .catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioError:
          // Here's the sample to get the failed response error code and message
          String error = handleError(obj);
          isViewAttached ? getView().showError(error) : null;
          break;
      }
      return;
    });

    if (result != null) {
      isViewAttached ? getView().onLoadUserInfo(result) : null;
    }
  }
}
