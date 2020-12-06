import '../locator.dart';
import '../services/navigation_service.dart';
import '../constants/routes_path.dart' as routes;

import 'base_model.dart';

class WelcomeModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToLogin() {
    _navigationService.navigateTo(routes.LoginViewRoute);
  }

  void navigateToSignup() {
    _navigationService.navigateTo(routes.SignUpViewRoute);
  }
}