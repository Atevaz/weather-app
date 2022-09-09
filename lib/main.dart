import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/business_logic/global_cubit/global_cubit.dart';
import 'package:weather_app/presentation/router/app_router.dart';
import 'package:weather_app/presentation/router/app_router_names.dart';
import 'package:weather_app/presentation/screens/home_screen.dart';

import 'business_logic/bloc_observer.dart';
import 'constants/constants.dart';
import 'data/network/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
    () async {

      WidgetsFlutterBinding.ensureInitialized();
      DioHelper.init();

      runApp(MyApp(appRouter: AppRouter()));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({required this.appRouter, Key? key}) : super(key: key);
  final AppRouter appRouter;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    // LanguageManager.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ScreenUtilInit(
          designSize: Size(390, 844),
          builder: (context, child) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => GlobalCubit()..getWatherDetails(location)),
              ],
              child: BlocConsumer<GlobalCubit,GlobalState>(
                listener: (context,state){},
                builder: (context,state){
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: "weather app",
                    onGenerateRoute: widget.appRouter.onGenerateRoute,
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

