import '../../data/api.dart';
import '../../models/user.dart';

abstract class LogoutContract {
  void onLogoutSuccess(User user);
  void onLogoutError(String errorTxt);
}

class LogoutService {
  LogoutContract _view;
  RestDatasource _api = RestDatasource();
  LogoutService(this._view);

  attemptLogout(User user) async {
    try {
      user = await _api.logout(user);
      _view.onLogoutSuccess(user = null);
    } on Exception {
      _view.onLogoutError("Oops. Something went wrong. Please try again.");
    }
  }
}
