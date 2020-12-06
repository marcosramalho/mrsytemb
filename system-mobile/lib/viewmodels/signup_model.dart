import 'package:flutter/material.dart';
import 'package:mobile/enums/viewstate.dart';
import 'package:mobile/helpers/debounce.dart';

import '../services/auth_service.dart';
import '../services/cep_service.dart';
import '../locator.dart';
import '../services/navigation_service.dart';

import 'base_model.dart';

class SignupModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final CepService _cepService = locator<CepService>();
  final AuthService _authService = locator<AuthService>();

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final debouncer = Debouncer(miliseconds: 3000);

  final TextEditingController nameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController cepController = new TextEditingController();
  final TextEditingController streetController = new TextEditingController();
  final TextEditingController numberController = new TextEditingController();
  final TextEditingController districtController = new TextEditingController();
  final TextEditingController stateController = new TextEditingController();
  final TextEditingController cityController = new TextEditingController();

  bool validateForm = false;
  bool loadingAccount = false;

  Future searchCep(String cep) async {
    if (cep.length >= 8) {
      setState(ViewState.Busy);
      
      Map<String, dynamic> res = await _cepService.search(cep);

      if (res.containsKey("erro")) {
        setState(ViewState.Idle);
        scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text("CEP não encontrado!"),
            duration: Duration(seconds: 3),
          )
        );
        return false;
      }
      
      streetController.text = '${res["logradouro"]}, ${res["complemento"]}';
      districtController.text = res["bairro"];
      stateController.text = res["uf"];
      cityController.text = res["localidade"];
      setState(ViewState.Idle);
      notifyListeners();
      return true;
    }

    streetController.clear();
    districtController.clear();
    stateController.clear();
    cityController.clear();
    notifyListeners();
  }

  void setValidateForm(bool value) {
    validateForm = value;
    notifyListeners();
  }

  Future createAccount(var account) async {
    loadingAccount = true;
    final res = await _authService.createAccount(account);
    
    loadingAccount = false;

    if (res != 201) {
      
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Email informado já cadastrado!"),
          duration: Duration(seconds: 3),
        )
      );
      return false;
    }

    scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Cadastro efetuado com sucesso!"),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.lightGreen,
      )
    );

    debouncer.run(() {
      _navigationService.navigateTo('login');
    });

    notifyListeners();
  }
}