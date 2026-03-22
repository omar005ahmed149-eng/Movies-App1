import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/colors_manger.dart';

class InfoPreview extends StatelessWidget {
   InfoPreview({super.key, required this.name, this.icon});
  final String name ;
  final Icon? icon ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManger.darkGray,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: icon!,
              ),
              Text(name,style: GoogleFonts.roboto(color: ColorsManger.white,fontSize: 20,fontWeight: FontWeight.normal),),

            ],
          ),
        ),
      ),
    );
  }
}
