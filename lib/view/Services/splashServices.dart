import 'package:app_mvvm/model/user_model.dart';
import 'package:app_mvvm/utils/routes/routesName.dart';
import 'package:app_mvvm/utils/utils.dart';
import 'package:app_mvvm/view_model/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class splashServices {
  Future<UserModel> getUser() => userViewModel().getUser();
  Future<void> AuthenticateUser(BuildContext context) async {
    getUser()
        .then((value) {
          print("splash msg " + value.token.toString());
          if (value.token == 'null' || value.token == '') {
            Future.delayed(Duration(seconds: 3), () {
              Navigator.pushNamed(context, routesName.home);
            });
          } else {
            Future.delayed(Duration(seconds: 3), () {
              Navigator.pushNamed(context, routesName.profile);
            });
          }
        })
        .onError((e, stack) {
          Utils.flushbarErrorMessage('App not Responding!!', context);
        });
  }
}
