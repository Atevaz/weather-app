import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/business_logic/global_cubit/global_cubit.dart';

class SunriseSunsetView extends StatelessWidget {
  const SunriseSunsetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = GlobalCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.tealAccent.withOpacity(.3)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Sunrise',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: Colors.white
                    ),
                  ),
                  Text(
                    '${cubit.weatherModel!.forecast!.forecastday![0].astro!.sunrise}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: Colors.white
                    ),
                  ),
                  Image.asset('assets/images/sunrise2.gif',height: 60.h,width: 120.w,)
                ],
              ),
              Column(
                children: [
                  Text(
                    'Sunset',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: Colors.white
                    ),
                  ),
                  Text(
                    '${cubit.weatherModel!.forecast!.forecastday![0].astro!.sunset}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: Colors.white
                    ),
                  ),
                  Image.asset('assets/images/sunset2.gif',height: 60.h,width: 120.w,fit: BoxFit.contain,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
