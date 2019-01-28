//import '../../data/rest_ds.dart';
import '../../data/oauth2.dart';

abstract class LoginContract {
  void onLoginSuccess();
  void onLoginError(String errorTxt);
}

class LoginService {
  LoginContract _view;
  RestDatasource _api = RestDatasource();
  LoginService(this._view);

  attemptLogin(String username, String password) async {
    try {
      var response = await _api.login(username, password);
      _view.onLoginSuccess();
    } on Exception catch (error) {
      _view.onLoginError(error.toString());
    }
  }
}
