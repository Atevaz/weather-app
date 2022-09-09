import 'condition_model.dart';

class Day {
  num? maxtempC;
  num? maxtempF;
  num? mintempC;
  num? mintempF;
  num? avgtempC;
  num? avgtempF;
  num? maxwindMph;
  num? maxwindKph;
  num? totalprecipMm;
  num? totalprecipIn;
  num? avgvisKm;
  num? avgvisMiles;
  num? avghumidity;
  num? dailyWillItRain;
  num? dailyChanceOfRain;
  num? dailyWillItSnow;
  num? dailyChanceOfSnow;
  Condition? condition;
  num? uv;

  Day(
      {this.maxtempC,
        this.maxtempF,
        this.mintempC,
        this.mintempF,
        this.avgtempC,
        this.avgtempF,
        this.maxwindMph,
        this.maxwindKph,
        this.totalprecipMm,
        this.totalprecipIn,
        this.avgvisKm,
        this.avgvisMiles,
        this.avghumidity,
        this.dailyWillItRain,
        this.dailyChanceOfRain,
        this.dailyWillItSnow,
        this.dailyChanceOfSnow,
        this.condition,
        this.uv});

  Day.fromJson(Map<String?, dynamic> json) {
    maxtempC = json['maxtemp_c'];
    maxtempF = json['maxtemp_f'];
    mintempC = json['mintemp_c'];
    mintempF = json['mintemp_f'];
    avgtempC = json['avgtemp_c'];
    avgtempF = json['avgtemp_f'];
    maxwindMph = json['maxwind_mph'];
    maxwindKph = json['maxwind_kph'];
    totalprecipMm = json['totalprecip_mm'];
    totalprecipIn = json['totalprecip_in'];
    avgvisKm = json['avgvis_km'];
    avgvisMiles = json['avgvis_miles'];
    avghumidity = json['avghumidity'];
    dailyWillItRain = json['daily_will_it_rain'];
    dailyChanceOfRain = json['daily_chance_of_rain'];
    dailyWillItSnow = json['daily_will_it_snow'];
    dailyChanceOfSnow = json['daily_chance_of_snow'];
    condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
    uv = json['uv'];
  }

}