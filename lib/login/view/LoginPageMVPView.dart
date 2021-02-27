import 'package:task/base/BaseMVPView.dart';
import 'package:task/login/model/User.dart';

abstract class LoginPageMVPView implements BaseMVPView {
  onLoadUserInfo(UserClass result);
}
