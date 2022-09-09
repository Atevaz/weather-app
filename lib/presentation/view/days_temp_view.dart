import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/business_logic/global_cubit/global_cubit.dart';
import 'package:weather_app/data/models/weather_model.dart';

class DaysTempView extends StatelessWidget {
  const DaysTempView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = GlobalCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 310.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.tealAccent.withOpacity(.3)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => itemDaysOfWeek(cubit.weatherModel!,index),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10.h,
                  ),
                  itemCount: 7,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  
  Widget itemDaysOfWeek(WeatherModel weatherModel , int index) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 100.w,
        child: Text(
          '${DateFormat.EEEE().format(DateTime.now().add(Duration(days: index)))}',
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
      ),
      Row(
        children: [
          Icon(Icons.water_drop,color: Colors.lightBlue,size: 14.sp),
          Text(
            ' ${weatherModel.forecast!.forecastday![index].day!.dailyWillItRain}%',
            style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey
            ),
          ),
        ],
      ),
      Row(
        children: [
          Image(image: NetworkImage('https:${weatherModel.forecast!.forecastday![index].day!.condition!.icon}'),width: 30.w,height: 30.h,)
        ],
      ),
      Row(
        children: [
          Text(
            '${weatherModel.forecast!.forecastday![index].day!.maxtempC!.toInt()}°',
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
          SizedBox(width: 10.w,),
          Text(
            '${weatherModel.forecast!.forecastday![index].day!.mintempC!.toInt()}°',
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ],
      ),
    ],
  );
}
