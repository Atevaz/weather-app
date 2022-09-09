import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../business_logic/global_cubit/global_cubit.dart';

class HeaderDetailsView extends StatelessWidget {
  const HeaderDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = GlobalCubit.get(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      color: GradientColors.seaBlueNew.last,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('${cubit.weatherModel!.current!.tempC!.toInt()}°' ,
            style: TextStyle(
                fontSize: 50.sp,
                color: Colors.white
            ),),
          Column(children: [
            Text('${cubit.weatherModel!.current!.tempC!.toInt()}° / ${cubit.weatherModel!.current!.tempC!.toInt()+1}°' ,
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white
              ),),
            Text('${DateFormat.E().format(DateTime.now())}, ${TimeOfDay.now().format(context)}' , style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white
            ),),
          ],),
        Image(image: NetworkImage('https:${cubit.weatherModel!.current!.condition!.icon}'),width: 60.w,height: 80.h,fit: BoxFit.cover,)
        ],
      ),
    );
  }
}
