import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatItem extends StatelessWidget {
  final String count;
  final String label;

  const StatItem({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style:  TextStyle(
            color: Colors.white,
            fontSize: 36.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
         SizedBox(height: 2.h),
        Text(
          label,
          style:  TextStyle(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}