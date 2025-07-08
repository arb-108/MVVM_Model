import 'package:app_mvvm/res/components/buttonElevated.dart';
import 'package:app_mvvm/utils/routes/routesName.dart';
import 'package:flutter/material.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home Screen'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(8.0),
                // width: double.infinity,
                // color: Colors.grey,
                child: Image.asset('assets/images/we are open-bro.png'),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                // color: Colors.green,
                child: Text(
                  "WELCOME TO ARB 108",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  myelevatedbutton(
                    btntext: "Login",
                    loading: false,
                    onPressed: (){
                    Navigator.pushNamed(context, routesName.login);
                  },),
                  SizedBox(height: 15),
                  myelevatedbutton(
                    btntext: "Sign Up",
                    onPressed: (){
                      Navigator.pushNamed(context, routesName.signup);
                    },
                    loading: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
