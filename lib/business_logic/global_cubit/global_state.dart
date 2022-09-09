part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class GetWeatherInfoLoadingState extends GlobalState {}
class GetWeatherInfoSuccessState extends GlobalState {}
class GetWeatherInfoErrorState extends GlobalState {}

class SearchLoadingState extends GlobalState {}
class SearchSuccessState extends GlobalState {}
class SearchErrorState extends GlobalState {}
