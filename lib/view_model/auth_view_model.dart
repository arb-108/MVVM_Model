import 'package:app_mvvm/model/user_model.dart';
import 'package:app_mvvm/repository/auth_repository.dart';
import 'package:app_mvvm/utils/routes/routesName.dart';
import 'package:app_mvvm/utils/utils.dart';
import 'package:app_mvvm/view_model/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AuthViewModel with ChangeNotifier{
  bool _isloading=false;
  bool get isloading=>_isloading;

  setloading(bool val){
    _isloading=val;
    notifyListeners();
  }

  final authrepo=authRepository();
  final userviewmodel=userViewModel();
  Future<dynamic> loginApiModel(dynamic data,BuildContext context)async{
    setloading(true);
    authrepo.loginApi(data)
        .then((value){
          if(kDebugMode){
            print("ali"+value.toString());
          }
          userviewmodel.saveUser(UserModel(token: value.toString())).then((value){
            Navigator.pushNamedAndRemoveUntil(context, routesName.profile, (route) => false,);
          });
          Utils.showSuccess("Login Successfully.", context);

          setloading(false);

    })
        .onError((e,stack){
          Utils.flushbarErrorMessage(e.toString(), context);
          setloading(false);
      if(kDebugMode){
        print(e);
      }
    });
  }
  Future<dynamic> signupApiModel(dynamic data,BuildContext Context)async{
    setloading(true);
    authrepo.registerApi(data)
        .then((value){
      if(kDebugMode){
        print("ali"+value.toString());
      }
      Utils.showSuccess("Register Successfully.", Context);
      setloading(false);

    })
        .onError((e,stack){
      Utils.flushbarErrorMessage(e.toString(), Context);
      setloading(false);
      if(kDebugMode){
        print(e);
      }
    });
  }
}