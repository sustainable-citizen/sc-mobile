import '../../data/api.dart';
import '../../models/user.dart';

abstract class LoginContract {
  void onLoginSuccess(User user);
  void onLoginError(String errorTxt);
}

class LoginService {
  LoginContract _view;
  RestDatasource _api = RestDatasource();
  LoginService(this._view);

  attemptLogin(String username, String password) async {
    User user;
    try {
      user = await _api.login(username, password);
      _view.onLoginSuccess(user);
    } on Exception {
      _view.onLoginError("Oops. Something went wrong. Please try again.");
    }
  }
}
