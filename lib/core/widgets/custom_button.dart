import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonWidth,
    required this.buttonClick,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.buttonName,
    required this.buttonPaddingHight,
    required this.style,
    this.borderSideColor,
    this.borderSideWidth,
    this.icon,
    this.isIcon = false,
    this.iconSpace,
  });
  final double buttonWidth;
  final double buttonPaddingHight;
  final double? borderSideWidth;
  final double? iconSpace;

  final VoidCallback buttonClick;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color? borderSideColor;

  final String buttonName;
  final String? icon;

  final TextStyle style;
  final bool isIcon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: borderSideColor ?? Colors.transparent,
              width: borderSideWidth ?? 0,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
        ),
        onPressed: buttonClick,
        child: Padding(
          padding: REdgeInsets.symmetric(vertical: buttonPaddingHight),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isIcon ? SvgPicture.asset(icon ?? "") : SizedBox.shrink(),
              SizedBox(width: iconSpace),
              Text(buttonName, style: style),
            ],
          ),
        ),
      ),
    );
  }
}
