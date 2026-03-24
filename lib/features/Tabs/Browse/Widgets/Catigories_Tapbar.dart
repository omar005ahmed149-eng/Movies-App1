import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabItem extends StatelessWidget {
   TabItem(
       {
         super.key,
         required this.label,
         required this.selectedBgColor,
         required this.selectedFgColor,
         required this.unselectedBgColor,
         required this.unselectedFgColor,
         required this.isSelected,
         required this.selectedBorderColor,
         required this.unselectedBorderColor
       });
   String label;
   Color selectedBgColor;
   Color unselectedBgColor;
   Color selectedFgColor;
   Color unselectedFgColor;
   Color selectedBorderColor;
   Color unselectedBorderColor;
   bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        color: isSelected?selectedBgColor:unselectedBgColor,
        border: Border.all(color: isSelected?selectedBorderColor:unselectedBorderColor,),
        borderRadius: BorderRadiusGeometry.circular(16.r)
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 12.h,horizontal: 20.w),
        child: Text(
            label,
          style: TextStyle(
            fontSize: 20.sp,
            color:  isSelected?selectedFgColor:unselectedFgColor,
          ),
        ),
      ),
    );
  }
}
