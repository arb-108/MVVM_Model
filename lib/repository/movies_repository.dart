import 'package:app_mvvm/model/movies_model.dart';

import '../data/network/baseApiService.dart';
import '../data/network/networkApiService.dart';
import '../res/appUrl.dart';

class movies_repo{

  BaseApiService _apiService=networkApiService();

  Future<movies> moviesApi()async{
    try{
      dynamic response=await _apiService.getGetApiResponse(
          AppUrl.moviesListEndPoint);
      return response=movies.fromJson(response);
    }catch(e){
      throw e;
    }
  }
}