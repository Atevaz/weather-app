import 'astro_model.dart';
import 'day_model.dart';
import 'hours_model.dart';

class Forecast {
  List<ForecastDay>? forecastday;

  Forecast({this.forecastday});

  Forecast.fromJson(Map<String?, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday =  <ForecastDay>[];
      json['forecastday'].forEach((v) {
        forecastday!.add(new ForecastDay.fromJson(v));
      });
    }
  }

}

class ForecastDay {
  String? date;
  num? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  ForecastDay({this.date, this.dateEpoch, this.day, this.astro, this.hour});

  ForecastDay.fromJson(Map<String?, dynamic> json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];
    day = json['day'] != null ? new Day.fromJson(json['day']) : null;
    astro = json['astro'] != null ? new Astro.fromJson(json['astro']) : null;
    if (json['hour'] != null) {
      hour =  <Hour>[];
      json['hour'].forEach((v) {
        hour!.add(new Hour.fromJson(v));
      });
    }
  }

}