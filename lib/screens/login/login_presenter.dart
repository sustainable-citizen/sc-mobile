import '../../data/rest_ds.dart';
import '../../models/user.dart';

abstract class LoginContract {
  void onLoginSuccess(User user);
  void onLoginError(String errorTxt);
}

class LoginPresenter {
  LoginContract _view;
  RestDatasource api = RestDatasource();
  LoginPresenter(this._view);

  attemptLogin(String username, String password) async {
    try {
      var user = await api.login(username, password);
      _view.onLoginSuccess(user);
    } on Exception catch (error) {
      _view.onLoginError(error.toString());
    }
  }
}
