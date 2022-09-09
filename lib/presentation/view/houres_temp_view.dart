import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/business_logic/global_cubit/global_cubit.dart';
import 'package:weather_app/data/models/weather_model.dart';

class HourTempView extends StatelessWidget {
  HourTempView({Key? key}) : super(key: key);

  var listController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var cubit = GlobalCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 230.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.tealAccent.withOpacity(.3)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 130.h,
                child: ListView.separated(
                  controller: listController,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => itemTimeTemp(cubit.weatherModel!, index),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 17.w,
                  ),
                  itemCount: cubit.weatherModel!.forecast!.forecastday![0].hour!.length,
                ),
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Container(
                  height: 50.h,
                  child: Sparkline(
                    fillColor: Colors.white,
                    lineColor: Colors.white,
                    data: [cubit.weatherModel!.forecast!.forecastday![0].hour![0].tempC!.toDouble(), cubit.weatherModel!.forecast!.forecastday![0].hour![1].tempC!.toDouble(), cubit.weatherModel!.forecast!.forecastday![0].hour![2].tempC!.toDouble(), cubit.weatherModel!.forecast!.forecastday![0].hour![3].tempC!.toDouble(), cubit.weatherModel!.forecast!.forecastday![0].hour![4].tempC!.toDouble(), cubit.weatherModel!.forecast!.forecastday![0].hour![5].tempC!.toDouble(),],
                    pointsMode: PointsMode.all,
                    pointSize: 4.0.r,
                    pointColor: Colors.blue,
                    lineWidth: 1.5.w,
                    cubicSmoothingFactor: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemTimeTemp( WeatherModel weatherModel ,int index) => Column(
    children: [
      Text('${weatherModel.forecast!.forecastday![0].hour![index].time!.substring(11,16)}',style: TextStyle(
          fontSize: 15.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold
      ),),
      SizedBox(height: 10.h,),
      Image(image: NetworkImage('https:${weatherModel.forecast!.forecastday![0].hour![index].condition!.icon}'),width: 40.w,height: 40.h,),
      SizedBox(height: 10.h,),
      Text('${weatherModel.forecast!.forecastday![0].hour![index].tempC!.toInt()}°',style: TextStyle(
          fontSize: 15.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold
      ),),
      SizedBox(height: 10.h,),
      Row(
        children: [
          Icon(Icons.water_drop,color: Colors.lightBlue,size: 14.sp),
          Text(' ${weatherModel.forecast!.forecastday![0].hour![index].willItRain}%',style: TextStyle(
              fontSize: 15.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),),
        ],
      ),
    ],
  );



}
