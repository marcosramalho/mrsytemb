import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './views/login_view.dart';
import './views/signup_view.dart';
import './views/welcome_view.dart';

import './constants/routes_path.dart' as routes;

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routes.LoginViewRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
        break;
      case routes.WelcomeViewRoute:
        return MaterialPageRoute(builder: (_) => WelcomeView());
        break;
      case routes.SignUpViewRoute:
        return MaterialPageRoute(builder: (_) => SignupView());
        break; 
      default:      
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            );
          },
        );
    }
  }
}