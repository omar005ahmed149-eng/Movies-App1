import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/colors_manger.dart';
import 'package:movies/features/movie_details/movie_details_screen.dart';

import '../../../../core/resources/assets_manger.dart';
import '../bloc/home_bloc.dart';
import '../../../../core/models/Movie_Model.dart';
import '../../../../core/models/Movies_Data.dart';
import 'Rating_Badge.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key, required this.activeIndex});

  final int activeIndex;

  static final PageController _pageController = PageController(
    viewportFraction: 0.62,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 56.h),

        Image.asset(AssetsManger.available),

        SizedBox(height: 16.h),

        SizedBox(
          height: 360.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: MovieData.featuredMovies.length,
            onPageChanged: (index) {
              context.read<HomeBloc>().add(HomePageChanged(index));
            },
            itemBuilder: (context, index) {
              return HeroCard(
                movie: MovieData.featuredMovies[index],
                isActive: index == activeIndex,
              );
            },
          ),
        ),
      ],
    );
  }
}

class HeroCard extends StatelessWidget {
  final MovieModel movie;
  final bool isActive;

  const HeroCard({super.key, required this.movie, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MovieDetailsScreen(movie: movie),
        ),
      ),
      child: AnimatedScale(
        scale: isActive ? 1.0 : 0.88,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutBack,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  color: ColorsManger.white,
                  child: Image.asset(
                    movie.poster_image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: RatingBadge(rating: movie.rating),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
