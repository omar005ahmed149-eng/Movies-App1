import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/colors_manger.dart';
import 'package:movies/core/resources/text_style.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.iconName,
    required this.prefixIcon,
    this.sufffixIcon,
    this.controller,
    this.validator,  this.maxLength,this.keyboardType
  });
  final String iconName;
  IconData prefixIcon;
  IconData? sufffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  TextInputType?  keyboardType;
 dynamic maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: ColorsManger.white),
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsManger.darkGray,
        label: Text(
          iconName,
          style: AppTextStyles.buttonName(15.sp, ColorsManger.white),
        ),

        prefixIcon: Icon(prefixIcon, color: ColorsManger.white),
        suffixIcon: Icon(sufffixIcon, color: ColorsManger.white),
      ),
      keyboardType: keyboardType,
      maxLength: maxLength,
    );
  }
}
