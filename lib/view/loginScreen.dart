import 'package:app_mvvm/res/components/buttonElevated.dart';
import 'package:app_mvvm/utils/routes/routesName.dart';
import 'package:app_mvvm/utils/utils.dart';
import 'package:app_mvvm/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;

import '../res/components/inputField_Components.dart';
import '../view_model/user_view_model.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final emailFocusNode =FocusNode();
  final passwordFocusNode=FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final loginProvider=Provider.of<AuthViewModel>(context);
    final userProvider = Provider.of<userViewModel>(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login Screen'),
      //   centerTitle: true,
      // ),
      body: SafeArea(child:Column(

        children: [
          Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(8.0),
                // width: double.infinity,
                // color: Colors.grey,
                child: Image.asset('assets/images/we are open-bro.png'), )),
          Expanded(
              child: Container(
                alignment: Alignment.center,
                // color: Colors.green,
                child: Text("LOGIN PAGE",
                  style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,),
                ),)),
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
                          controller: emailController,
                          focusNode: emailFocusNode,
                          keyboardinput: TextInputType.emailAddress,
                          textHint: "Enter Email",
                          icon: Icons.email_sharp,
                          onsubmitted: (val){
                            FocusScope.of(context).requestFocus(passwordFocusNode);
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InputTextField(
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          textHint: "Enter Password",
                          icon: Icons.lock_open_sharp,
                          isPassword: true,
                          onsubmitted: (value){},
                        ),
                        TextButton(onPressed: (){}, child: Text("Forgot Password?")),
                      ],
                    ),
                  ),

                  myelevatedbutton(
                    btntext: "Login",
                    loading: loginProvider.isloading,
                    onPressed: (){
                      FocusScope.of(context).unfocus();
                    if(emailController.text.trim().isEmpty){
                      Utils.flushbarErrorMessage('Please Enter your Email', context);
                    }else if(!emailController.text.contains('@')){
                      Utils.flushbarErrorMessage('Please Enter your Email i.e @', context);
                    }else if(passwordController.text.trim().isEmpty){
                      Utils.flushbarErrorMessage('Please Enter Password', context);
                    }else if(passwordController.text.trim().length<3){
                      Utils.flushbarErrorMessage('Please Enter Password length greater then 3.', context);
                    }else{
                      Map data={
                          // "email": "eve.holt@reqres.in",
                          // "password": "cityslicka"
                         "email": emailController.text.toString(),
                         "password": passwordController.text.toString()
                        //"email":"sydney@fife",
                      };
                      loginProvider.loginApiModel(data,context);
                      // Utils.showSuccess("Login Successfully.", context);
                    }
                  },),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, routesName.signup);
                        },
                        child: Text("Sign Up"),
                      ),
                    ],
                  )


                ],
              ),
            ),
          ),
        ],
      ) ),
    );;
  }
}
