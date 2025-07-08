import 'package:app_mvvm/view/Services/splashServices.dart' show splashServices;
import 'package:app_mvvm/view_model/movies_view_model.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    splashServices splashservice=splashServices();
    // TODO: implement initState
    super.initState();
    splashservice.AuthenticateUser(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Screen',style: TextStyle(
          fontSize: 30
        ),),
      ),
    );
  }
}
