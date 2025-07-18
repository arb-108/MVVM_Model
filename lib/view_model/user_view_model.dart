import 'package:app_mvvm/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class userViewModel with ChangeNotifier{

  Future<bool> saveUser(UserModel user)async{
    final sp=await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }
  Future<UserModel> getUser()async{
    final SharedPreferences sp=await SharedPreferences.getInstance();
    final String? token=sp.getString('token');
    notifyListeners();
    return UserModel(
      token: token.toString()
    );
  }
  Future<bool> removeUser()async{
    final sp=await SharedPreferences.getInstance();
    final check=sp.clear();
    notifyListeners();
    return check;
  }
}