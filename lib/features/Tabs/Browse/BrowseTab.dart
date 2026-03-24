import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/models/Movies_Data.dart';
import 'package:movies/core/resources/colors_manger.dart';
import 'package:movies/core/widgets/Category_card.dart';
import 'Widgets/Catigories_Tapbar.dart';

class Browsetab extends StatefulWidget {
  const Browsetab({super.key});
  @override
  State<Browsetab> createState() => _BrowsetabState();
}

int _selectedIndex = 0;

class _BrowsetabState extends State<Browsetab> {

 @override
  Widget build(BuildContext context) {
   return SafeArea(
      child: Column(
        children: [
           SizedBox(height: 12.h),
              DefaultTabController(
                length:MovieData.categories.length ,
                child: TabBar(
                  isScrollable: true,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  tabs: List.generate(
                    MovieData.categories.length,
                        (index) => TabItem(
                      label: MovieData.labels[index].toString(),
                      selectedBgColor: ColorsManger.yellow,
                      selectedFgColor: ColorsManger.black,
                      unselectedBgColor: ColorsManger.black,
                      unselectedFgColor: ColorsManger.yellow,
                      selectedBorderColor: ColorsManger.yellow,
                      unselectedBorderColor: ColorsManger.yellow,
                      isSelected: _selectedIndex == index,
                    ),
                  ),
                  onTap: (index){
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
           SizedBox(height: 16.h),
          Expanded(
            child: GridView.builder(
                padding:  EdgeInsets.symmetric(horizontal: 12.h, vertical: 4.w),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.68,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: MovieData.categories[MovieData.labels[_selectedIndex]]!.length,
                itemBuilder: (_, index) {
                  final movie = MovieData.categories[MovieData.labels[_selectedIndex]]![index];
                    return CategoryCard(rating: movie.rating, poster_image:movie.poster_image,);}
            ),
          ),
        ],
      ),
    );
  }
}