/**
 * @ Author: Carlos Henry Céspedes <chenryhabana205@gmail.com>
 * @ Create Time: 2020-02-18 18:43:11
 * @ Modified by: Carlos Henry Céspedes <chenryhabana205@gmail.com>
 * @ Modified time: 2020-02-18 20:01:34
 * @ Description:
 */

import 'package:awesome_dialog/animated_button.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:example/ui/widgets/custom_edit_text.dart';
import 'package:feathers_socket_client/feathers_socket_client.dart';
import 'package:flutter/material.dart';

import '../../injector_container.dart';
import '../routes.gr.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  @override
  void initState() {
    super.initState();
    emailController.text = "demo@gmail.com";
    passController.text = "demo";
  }

  void authUser(BuildContext context) async {
    //Validate form before send reqest (I decide do this here for simplicity)
    if (_formKey.currentState.validate()) {
      //    If all data are correct then Send LoginRequest
      print('LOGIN INIT...........');
      var authSucces = await sl<FeatherClient>()
          .authWithCredential(emailController.text, passController.text);
      if (authSucces) {
        Navigator.of(context).pushReplacementNamed(Router.home);
      } else {
        AwesomeDialog(
                context: context,
                dialogType: DialogType.ERROR,
                tittle: "Error",
                desc: "Check your credentials",
                btnOkOnPress: () {})
            .show();
      }
    } else {
      //    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Card(
          margin: EdgeInsets.all(5),
          elevation: 0.5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              autovalidate: _autoValidate,
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Bienvenid@',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  IconedEditText(
                    controller: emailController,
                    icon: Icons.email,
                    hint: 'Enter the email',
                    textType: TextInputType.emailAddress,
                    validator: (value) {
                      Pattern pattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regex = new RegExp(pattern);
                      if (!regex.hasMatch(value))
                        return 'Invalid email';
                      else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  IconedEditText(
                      controller: passController,
                      icon: Icons.vpn_key,
                      isHidenText: true,
                      hint: 'Enter the password',
                      validator: (String value) {
                        if (value.isEmpty)
                          return 'The password cannot be empty';
                        else
                          return null;
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  AnimatedButton(
                    text: 'Login',
                    pressEvent: () {
                      authUser(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
