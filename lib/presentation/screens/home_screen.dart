import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/business_logic/global_cubit/global_cubit.dart';
import 'package:weather_app/presentation/view/days_temp_view.dart';
import 'package:weather_app/presentation/view/detection_view.dart';
import 'package:weather_app/presentation/view/houres_temp_view.dart';
import 'package:weather_app/presentation/view/my_drawer.dart';
import 'package:weather_app/presentation/view/qoutes_view.dart';
import 'package:weather_icons/weather_icons.dart';

import '../view/header_deatils.dart';
import '../view/sunrise_sunset_view.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController scrollController;
  bool isScroll = false;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  void initState() {
    scrollController = ScrollController();

    scrollController.addListener(() {
      print(scrollController.position.pixels);

      if (scrollController.position.pixels <= 120) {
        setState(() {
          isScroll = false;
        });
      } else {
        setState(() {
          isScroll = true;
        });
      }

      // if (scrollController.position.pixels > 800) {
      //   setState(() {
      //     backgroundColor = Colors.lightBlue;
      //   });
      // } else {
      //   setState(() {
      //     backgroundColor = Colors.blueGrey;
      //   });
      // }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = GlobalCubit.get(context);

    return SafeArea(
      child: Scaffold(
        key: _key,
        backgroundColor: GradientColors.seaBlueNew.last,
        drawer: NavBar(),
        body: ConditionalBuilder(
            condition: GlobalCubit.get(context).weatherModel == null,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
            fallback: (context) => CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  controller: scrollController,
                  slivers: [
                    SliverAppBar(
                      backgroundColor: GradientColors.seaBlueNew.last,
                      elevation: 0,
                      expandedHeight: 230.0,
                      floating: false,
                      pinned: true,
                      snap: false,
                      leading: IconButton(
                        onPressed: () {
                          _key.currentState!.openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(width: 45.w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                isScroll == false
                                    ? Text(
                                        "${cubit.weatherModel!.current!.tempC!.toInt()}°",
                                        style: TextStyle(color: Colors.white))
                                    : Text(
                                        "${cubit.weatherModel!.location!.name}",
                                        style: TextStyle(color: Colors.white)),
                                isScroll == false
                                    ? Text(
                                        '${cubit.weatherModel!.location!.name}',
                                        style: TextStyle(color: Colors.white))
                                    : Container(),
                                isScroll == false
                                    ? SizedBox(
                                        height: 20.h,
                                      )
                                    : Container(),
                                isScroll == false
                                    ? Text(
                                        '${cubit.weatherModel!.current!.tempC!.toInt()}° / ${cubit.weatherModel!.current!.tempC!.toInt() + 1}° feels like ${cubit.weatherModel!.current!.tempC!.toInt()}°',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10))
                                    : Container(),
                                isScroll == false
                                    ? Text(
                                        '${DateFormat.E().format(DateTime.now())}, ${TimeOfDay.now().format(context)}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10))
                                    : Container(),
                              ],
                            ),
                            Spacer(),
                            isScroll == false
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image(
                                        image: NetworkImage(
                                            'https:${cubit.weatherModel!.current!.condition!.icon}'),
                                        width: 40.w,
                                        height: 40.h,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                        height: 60.h,
                                      ),
                                    ],
                                  )
                                : Container(),
                            SizedBox(
                              width: 10.w,
                            ),
                          ],
                        ),
                        background: Container(color: Colors.transparent),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                          (context, index) => Column(
                                children: [
                                  if (isScroll) HeaderDetailsView(),
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        /// hours temp
                                        HourTempView(),
                                        SizedBox(
                                          height: 10.h,
                                        ),

                                        /// quote view
                                        const QuoteView(),
                                        SizedBox(
                                          height: 10.h,
                                        ),

                                        /// days temp view
                                        const DaysTempView(),
                                        SizedBox(
                                          height: 10.h,
                                        ),

                                        /// sunrise & sunset view
                                        SunriseSunsetView(),
                                        SizedBox(
                                          height: 10,
                                        ),

                                        /// detection view
                                        DetectionView(),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                    )
                  ],
                )),
      ),
    );
  }
}
