import 'package:app_mvvm/utils/routes/routesName.dart';
import 'package:app_mvvm/view/profile.dart';
import 'package:app_mvvm/view/signupScreen.dart';
import 'package:app_mvvm/view/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:app_mvvm/view/homeScreen.dart';
import 'package:app_mvvm/view/loginScreen.dart';
import 'package:flutter/material.dart';

class Routes{
  static MaterialPageRoute ongenerate(RouteSettings setting){
    switch(setting.name){
      case routesName.splash:
        return MaterialPageRoute(builder: (BuildContext context)=>splashScreen());
      case routesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=>home_screen());
      case routesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=>login_screen());
      case routesName.signup:
        return MaterialPageRoute(builder: (BuildContext context)=>signup_screen());
      case routesName.profile:
        return MaterialPageRoute(builder: (BuildContext context)=>profile());
      default:
        return MaterialPageRoute(builder: (_)=> Scaffold(
          appBar: AppBar(
            title: Text('Default Screen'),
            centerTitle: true,
          ),
          body: Center(
            child: Text("Default Screen"),
          ),
        ));

    }
  }
}