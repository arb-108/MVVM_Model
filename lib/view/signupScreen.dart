import 'package:app_mvvm/res/components/inputField_Components.dart';
import 'package:app_mvvm/utils/routes/routesName.dart';
import 'package:app_mvvm/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/components/buttonElevated.dart';
import '../utils/utils.dart';

class signup_screen extends StatefulWidget {
  const signup_screen({super.key});

  @override
  State<signup_screen> createState() => _signup_screenState();
}

class _signup_screenState extends State<signup_screen> {
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final fullNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    fullnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<AuthViewModel>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                // color: Colors.green,
                child: Text(
                  "",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                // color: Colors.green,
                child: Text(
                  "Sign Up page",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 5,

              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InputTextField(
                            controller: fullnameController,
                            focusNode: fullNameFocusNode,
                            textHint: "Enter FullName",
                            onsubmitted: (val) {
                              FocusScope.of(
                                context,
                              ).requestFocus(emailFocusNode);
                            },
                            icon: Icons.person,
                          ),
                          SizedBox(height: 30),
                          InputTextField(
                            controller: emailController,
                            focusNode: emailFocusNode,
                            onsubmitted: (val) {
                              FocusScope.of(
                                context,
                              ).requestFocus(passwordFocusNode);
                            },
                            textHint: "Enter Email",
                            icon: Icons.email_sharp,
                            keyboardinput: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 30),
                          InputTextField(
                            controller: passwordController,
                            focusNode: passwordFocusNode,
                            onsubmitted: (val) {
                              FocusScope.of(
                                context,
                              ).requestFocus(confirmPasswordFocusNode);
                            },
                            isPassword: true,
                            textHint: "Enter Password",
                            icon: Icons.lock_open_sharp,
                          ),
                          SizedBox(height: 30),
                          InputTextField(
                            controller: confirmPasswordController,
                            focusNode: confirmPasswordFocusNode,
                            isPassword: true,
                            onsubmitted: (val) {
                              FocusScope.of(context).unfocus();
                            },
                            textHint: "Confirm Password",
                            icon: Icons.lock_open_sharp,
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                    myelevatedbutton(
                      btntext: "Login",
                      loading: signUpProvider.isloading,
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (fullnameController.text.trim().isEmpty) {
                          Utils.flushbarErrorMessage(
                            'Please Enter your Full Name',
                            context,
                          );
                        } else if (emailController.text.trim().isEmpty) {
                          Utils.flushbarErrorMessage(
                            'Please Enter your Email',
                            context,
                          );
                        } else if (!emailController.text.contains('@')) {
                          Utils.flushbarErrorMessage(
                            'Please Enter your Email i.e @',
                            context,
                          );
                        } else if (passwordController.text.trim().isEmpty) {
                          Utils.flushbarErrorMessage(
                            'Please Enter Password',
                            context,
                          );
                        } else if (passwordController.text.trim().length < 3) {
                          Utils.flushbarErrorMessage(
                            'Please Enter Password length greater then 3.',
                            context,
                          );
                        }else if (confirmPasswordController.text.trim().isEmpty) {
                          Utils.flushbarErrorMessage(
                            'Please Enter Confirm Password',
                            context,
                          );
                        } else if (confirmPasswordController.text.trim()!=passwordController.text.trim()) {
                          Utils.flushbarErrorMessage(
                            'Please Match Password with Confirm Password.',
                            context,
                          );
                        } else {
                          Map data={
                            // "email": "eve.holt@reqres.in",
                            // "password": "pistol"
                            "email": emailController.text.toString(),
                            "password": passwordController.text.toString()
                          };
                          signUpProvider.signupApiModel(data, context);
                        }
                      },
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Already have an account?",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, routesName.login);
                          },
                          child: Text("Login Here"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
