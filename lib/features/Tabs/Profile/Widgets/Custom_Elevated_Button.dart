import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/colors_manger.dart';


class CustomElevatedButton extends StatelessWidget {
   CustomElevatedButton({super.key, required this.text, required this.color, this.text_color});

   final String text;
   final Color color;
   late Color? text_color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(vertical:10.h,horizontal: 16.w),
      child: ElevatedButton(onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
          ),
          child: Padding(
            padding:  EdgeInsets.all(15.sp),
            child: Center(
                child: Text(text,style: GoogleFonts.roboto(color: text_color??ColorsManger.white,fontSize: 20,fontWeight: FontWeight.normal),)),
          )),
    );
  }
}
