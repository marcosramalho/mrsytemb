import 'package:flutter/material.dart';
import 'package:mobile/enums/viewstate.dart';

import '../helpers/debounce.dart';
import '../viewmodels/signup_model.dart';
import '../views/base_view.dart';
import '../helpers/animation/FadeAnimation.dart';

class SignupView extends StatelessWidget {
  final _debouncer = Debouncer(miliseconds: 300);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return BaseView<SignupModel>(
      builder: (context, model, child) => Scaffold(
        key: model.scaffoldKey,
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FadeAnimation(
                      1,
                      Text(
                        "Criar Conta",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                      1.2,
                      Text(
                        "Para criar uma conta é necessário preencher todos os dados abaixo:",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  autovalidate: model.validateForm,                  
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                        1.2,
                        makeInput(
                          label: "Nome Completo",
                          controller: model.nameController,
                          onEditingComplete: () => node.nextFocus(),
                          enabled: true,
                        ),
                      ),
                      FadeAnimation(
                        1.3,
                        makeInput(
                          label: "Email",
                          controller: model.emailController,
                          onEditingComplete: () => node.nextFocus(),
                          enabled: true,
                        ),
                      ),
                      FadeAnimation(
                        1.4,
                        makeInput(
                          label: "Senha",
                          controller: model.passwordController,
                          onEditingComplete: () => node.nextFocus(),
                          enabled: true,
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: 30),
                      FadeAnimation(
                        1.6,
                        Text(
                          "Endereço",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      FadeAnimation(
                        1.6,
                        makeInput(
                          label: "CEP",
                          controller: model.cepController,
                          onEditingComplete: () {
                            node.unfocus();
                            node.nextFocus();
                          },
                          onChange: (String text) {
                            _debouncer.run(() {
                              model.searchCep(text);
                            });
                          },
                          enabled: true,
                        ),
                      ),
                      Visibility(
                        visible: model.state == ViewState.Busy,
                        child: Text("Aguarde... buscando CEP"),
                      ),
                      SizedBox(height: 20),
                      FadeAnimation(
                        1.7,
                        makeInput(
                          label: "Logradouro",
                          controller: model.streetController,
                          onEditingComplete: () => node.nextFocus(),
                          enabled: false,
                        ),
                      ),
                      FadeAnimation(
                        1.8,
                        makeInput(
                          label: "Nº da Residência",
                          controller: model.numberController,
                          onEditingComplete: () => node.nextFocus(),
                          enabled: true,
                        ),
                      ),
                      FadeAnimation(
                        1.9,
                        makeInput(
                          label: "Bairro",
                          controller: model.districtController,
                          onEditingComplete: () => node.nextFocus(),
                          enabled: false,
                        ),
                      ),
                      FadeAnimation(
                        2.0,
                        makeInput(
                          label: "Estado",
                          controller: model.stateController,
                          onEditingComplete: () => node.nextFocus(),
                          enabled: false,
                        ),
                      ),
                      FadeAnimation(
                        2.1,
                        makeInput(
                          label: "Cidade",
                          controller: model.cityController,
                          onEditingComplete: () => node.unfocus(),
                          enabled: false,
                        ),
                      ),
                    ],
                  ),
                ),
                FadeAnimation(
                  1.5,
                  Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: model.loadingAccount ? null : () {
                        if (_formKey.currentState.validate()) {
                          model.createAccount({
                            "name": model.nameController.text,
                            "email": model.emailController.text,
                            "password": model.passwordController.text,
                            "address": {
                              "street": model.streetController.text,
                              "number": model.numberController.text,
                              "cep": model.cepController.text,
                              "state": model.stateController.text,
                              "city": model.cityController.text,
                              "district": model.districtController.text,
                            }
                          });

                          return;
                        }

                        model.setValidateForm(true);
                      },
                      color: Colors.greenAccent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: !model.loadingAccount ? Text(
                        "Criar Conta",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ) : CircularProgressIndicator()
                    ),
                  ),
                ),
                FadeAnimation(
                  2.2,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Já possui uma conta?"),
                      Text(
                        "Entrar",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget makeInput(
      {String label,
      var controller,
      Function onEditingComplete,
      bool enabled,
      Function onChange,
      bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        SizedBox(
          height: 0,
        ),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          onEditingComplete: onEditingComplete,
          onChanged: onChange,
          enabled: enabled,
          validator: (String value) {
            if (value.isEmpty) {
              return '$label é obrigatório';
            }
          },
          decoration: InputDecoration(
              hintText: '$label',
              filled: !enabled ? true : false,
              fillColor: !enabled ? Colors.grey[300] : null,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400]),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400]),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              )),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
