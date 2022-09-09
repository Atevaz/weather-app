import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/presentation/screens/home_screen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'assets/images/sunrise.gif',
        fit: BoxFit.cover,
      ),
      title: Text(
        "Weather Hive",
        style: TextStyle(
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      logoWidth: 150.w,
      backgroundColor: GradientColors.skyBlue.last,
      showLoader: false,
      // loaderColor: Colors.white,
      // loadingText: Text(
      //   "Loading...",
      //   style: TextStyle(
      //     fontSize: 18.sp,
      //     fontWeight: FontWeight.bold,
      //     color: Colors.white,
      //   ),
      // ),
      navigator: HomeScreen(),
      durationInSeconds: 3,
    );
  }
}
