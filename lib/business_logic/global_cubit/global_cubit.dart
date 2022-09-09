import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/models/search_model.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/network/dio_helper.dart';

import '../../constants/end_points.dart';
import '../../data/models/current_model.dart';

part 'global_state.dart';
// TODO: Add 
class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  WeatherModel? weatherModel ;

  void getWatherDetails(String location){
    emit(GetWeatherInfoLoadingState());
    DioHelper.postData(url: forecast, query: {
      "key":apiKey,
      "q":location,
      "days":7,
    }).then((value){
      weatherModel = WeatherModel.fromJson(value.data);
      emit(GetWeatherInfoSuccessState());
    }).catchError((error){
      emit(GetWeatherInfoErrorState());
    });
  }

  List<SearchModel> searchList = [] ;

  void searchInWeather(String name){
    searchList = [] ;
    emit(SearchLoadingState());
    DioHelper.postData(url: search, query: {
      "key":apiKey,
      "q":name,
    }).then((value){
        value.data.forEach((element){
          searchList.add(SearchModel.fromJson(element));
        });
      emit(SearchSuccessState());
      print('hello amr ${searchList[0].name.toString()}');
    }).catchError((error){
      emit(SearchErrorState());
    });
  }


}
