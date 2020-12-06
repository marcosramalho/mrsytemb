import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './services/navigation_service.dart';

import './constants/routes_path.dart' as routes;
import './router.dart';
import './locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SystemB',
        initialRoute: routes.WelcomeViewRoute,
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: Router.generateRoute,      
    );
  }
}