import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/presentation/styles/colors.dart';

class MyFormField extends StatelessWidget {
  final IconData? prefix;
  final IconData? suffix;

  final TextEditingController controller;

  //final VoidCallback? onTap ;
  final String validateText;

  final Function(String)? onChanged ;
  final Function(String)? onSubmit ;

  final bool isPassword;

  final bool readOnly;

  final TextInputType inputType;

   String? hintText;
   String? labelText;
  final TextAlign textAlign;

  //final Color? color;
  void Function()? suffixPressed;

  MyFormField({
    Key? key,
    required this.onChanged ,
    required this.onSubmit ,
    required this.controller,
    required this.validateText,
    this.suffixPressed,
    this.isPassword = false,
    required this.inputType,
    required this.hintText,
    this.prefix,
    this.suffix,
    this.textAlign = TextAlign.start,
    this.readOnly = false,
    //this.color ,
    //this.onTap ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      validator: (value) {
        if (value!.isEmpty) {
          return validateText;
        }
      },
      //onTap: onTap,
      obscureText: isPassword,
      keyboardType: inputType,
      textAlign: textAlign,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: suffixPressed,
          icon: Icon(suffix,color: AppColor.grey,),
        ),
        prefixIcon: Icon(
          prefix,
          color:AppColor.grey,
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
            color: AppColor.grey
        ),
        hintStyle: TextStyle(
          color: AppColor.grey
        ),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0.r),
          borderSide: BorderSide(
                  color: AppColor.blue,
                ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0.r),
          borderSide: BorderSide(
                  color: Colors.grey.shade300,
                  width: 2.0,
                ),
        ),
        fillColor: AppColor.offWhite,
        filled: true,
      ),
      style: TextStyle(
          color: AppColor.grey
      ),
    );
  }
}
