import 'package:app_mvvm/data/response/apiResponse.dart';
import 'package:app_mvvm/model/movies_model.dart';
import 'package:app_mvvm/repository/movies_repository.dart';
import 'package:flutter/cupertino.dart';

class moviesViewModel with ChangeNotifier{
  movies_repo movieRepo=movies_repo();
  ApiResponse<movies> moviesList=ApiResponse.loading();
  setMovieList(ApiResponse<movies> response){
    moviesList=response;
    notifyListeners();
  }
  Future<void> fetchMoviesApi()async{
    setMovieList(ApiResponse.loading());
    movieRepo.moviesApi().then((value){
      setMovieList(ApiResponse.compeleted(value));
    }).onError((e,stack){
      setMovieList(ApiResponse.error("Unable to Fetch Data"));
    });
  }
}