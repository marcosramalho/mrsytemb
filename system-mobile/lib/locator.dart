import 'package:get_it/get_it.dart';

import './services/auth_service.dart';
import './services/cep_service.dart';
import './services/navigation_service.dart';

import './viewmodels/login_model.dart';
import './viewmodels/signup_model.dart';
import './viewmodels/base_model.dart';
import './viewmodels/welcome_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {  
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => CepService());
  locator.registerLazySingleton(() => AuthService());

  locator.registerFactory(() => BaseModel());  
  locator.registerFactory(() => WelcomeModel());  
  locator.registerFactory(() => SignupModel());  
  locator.registerFactory(() => LoginModel());  
 
}