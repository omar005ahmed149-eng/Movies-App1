import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manger.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../Browse/BrowseTab.dart';
import '../../Home/HomeTab.dart';
import '../../Profile/ProfileTab.dart';
import '../../Search/SearchTab.dart';

class CustomizedBottomnavigationbar extends StatefulWidget {
  const CustomizedBottomnavigationbar({super.key});

  @override
  State<CustomizedBottomnavigationbar> createState() => _CustomizedBottomnavigationbarState();
}

class _CustomizedBottomnavigationbarState extends State<CustomizedBottomnavigationbar> {
  int selectedindex=0;
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs=[
      Hometab(),
      Searchtab(),
      Browsetab(),
      Profiletab()
    ];
    return Stack(
      children: [
        tabs[selectedindex],
        Padding(
          padding: EdgeInsets.all(12.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color:ColorsManger.darkGray,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _Activation(0, IconsManager.home),
                    _Activation(1, IconsManager.search),
                    _Activation(2, IconsManager.browse),
                    _Activation(3, IconsManager.profile),
                  ],
                ),
              ),
            ],
          ),
        )],
    );

  }

  Widget _Activation(int index, String icon) {
    bool isSelected = selectedindex == index;

    return GestureDetector(
      onTap: () {
        selectedindex = index;
        setState(() {
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 8.w),
        child: ImageIcon(
          AssetImage(icon),
          color: isSelected ? Colors.yellow : Colors.white,
        ),
      ),
    );
  }
}
