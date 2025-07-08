import 'package:app_mvvm/data/network/baseApiService.dart';
import 'package:app_mvvm/data/network/networkApiService.dart';
import 'package:app_mvvm/res/appUrl.dart';

class authRepository{

  BaseApiService _apiService=networkApiService();

  Future<dynamic> loginApi(dynamic data)async{
    try{
      dynamic response=await _apiService.getPostApiResponse(
      AppUrl.loginendpoint,data);
      return response;
    }catch(e){
        throw e;
    }
  }
  Future<dynamic> registerApi(dynamic data)async{
    try{
      dynamic response=await _apiService.getPostApiResponse(
          AppUrl.registerPoint,data);
      return response;
    }catch(e){
      throw e;
    }
  }
}