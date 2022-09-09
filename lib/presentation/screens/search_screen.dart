import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/business_logic/global_cubit/global_cubit.dart';
import 'package:weather_app/data/models/search_model.dart';
import 'package:weather_app/presentation/router/app_router_names.dart';
import 'package:weather_app/presentation/styles/colors.dart';

import '../componants/default_text_form_field.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();

  String? searchedVal ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GradientColors.seaBlueNew.last,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pushReplacementNamed(context, AppRouterNames.rHomeRoute);
          },
        ),
        backgroundColor: GradientColors.seaBlueNew.last,
        title: Text(
          'Search Screen',
          style: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          children: [
            MyFormField(
              controller: searchController,
              hintText: 'Search',
              inputType: TextInputType.text,
              validateText: 'this filed must not be empty',
              onChanged: (value){
                setState(() {
                  searchedVal = value ;
                  GlobalCubit.get(context).searchInWeather(searchController.text);
                  print(value);
                });
              },
              onSubmit: (value){
                setState(() {
                  print(value);
                });
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child:searchController.text.isNotEmpty? ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>  searchItem(GlobalCubit.get(context).searchList[index] , index),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10.h,
                ),
                itemCount: GlobalCubit.get(context).searchList.length,
              ) : Center(child: Container(),),
            )
          ],
        ),
      ),
    );
  }

  Widget searchItem(SearchModel searchModel , index) => InkWell(
    onTap: (){
      GlobalCubit.get(context).getWatherDetails(searchModel.name!);
      Navigator.pushReplacementNamed(context, AppRouterNames.rHomeRoute);
    },
    child: Container(
      decoration: BoxDecoration(
          color: Colors.lightBlueAccent.withOpacity(.7),
          borderRadius: BorderRadius.circular(20.r)
      ),
      child: Padding(
        padding:  EdgeInsets.all(18.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${searchModel.name}',
              style: TextStyle(color: Colors.white, fontSize: 20.sp,fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              '${searchModel.region}',
              style: TextStyle(color: AppColor.offWhite, fontSize: 18.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '${searchModel.url}',
              style: TextStyle(color: AppColor.offWhite, fontSize: 16.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '${searchModel.country}',
              style: TextStyle(color: AppColor.offWhite, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    ),
  );
}

