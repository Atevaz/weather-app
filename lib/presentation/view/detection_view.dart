import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/business_logic/global_cubit/global_cubit.dart';
import 'package:weather_icons/weather_icons.dart';

class DetectionView extends StatelessWidget {
  const DetectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = GlobalCubit.get(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Container(

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: Colors.tealAccent.withOpacity(.3)),
        child: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BoxedIcon(WeatherIcons.day_sunny,color: Colors.yellowAccent,size: 30.r,),
                  Text(
                    'UV index',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    '${cubit.weatherModel!.forecast!.forecastday![0].hour![12].uv!.toInt()}',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey[500]),
                  ),
                ],
              ),
              Column(
                children: [
                  BoxedIcon(WeatherIcons.windy,color: Colors.grey,size: 30.r,),
                  Text(
                    'Wind',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    '${cubit.weatherModel!.forecast!.forecastday![0].day!.maxwindKph} km/h',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey[500]),
                  ),
                ],
              ),
              Column(
                children: [
                  BoxedIcon(WeatherIcons.rain_mix,color: Colors.blue,size: 30.r,),

                  Text(
                    'Humidity',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    '${cubit.weatherModel!.forecast!.forecastday![0].day!.avghumidity}',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey[500]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
