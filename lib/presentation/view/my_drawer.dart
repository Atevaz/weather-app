import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/business_logic/global_cubit/global_cubit.dart';
import 'package:weather_app/presentation/router/app_router_names.dart';

import '../styles/colors.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: GradientColors.seaBlueNew.last,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.star_rounded,
                      color: Colors.white,
                    ),
                    title: Text(
                      'My Location',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.grey[200],
                      ),
                    ),
                    trailing: InkWell(
                      onTap: (){
                        Navigator.pushReplacementNamed(context, AppRouterNames.rSearchRoute);
                      },
                      child: Icon(
                        Icons.search,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: SizedBox(),
                    title: Text(
                      '${GlobalCubit.get(context).weatherModel!.location!.name}',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '${GlobalCubit.get(context).weatherModel!.current!.tempC!.toInt()}°',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
