import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manger.dart';
import '../bloc/home_bloc.dart';
import 'Movie_Model.dart';
import 'Movies_Data.dart';
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

        // Hero carousel
        SizedBox(
          height: 360.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: featuredMovies.length,
            onPageChanged: (index) {
              context.read<HomeBloc>().add(HomePageChanged(index));
            },
            itemBuilder: (context, index) {
              return HeroCard(
                movie: featuredMovies[index],
                isActive: index == activeIndex,
              );
            },
          ),
        ),

        SizedBox(height: 14.h),

        // Dot indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(featuredMovies.length, (i) {
            final isActive = i == activeIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: isActive ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFFF5C518) : Colors.white30,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),

        SizedBox(height: 28.h),
      ],
    );
  }
}

// ─── Hero Card ────────────────────────────────────────────────────────────────

class HeroCard extends StatelessWidget {
  final MovieModel movie;
  final bool isActive;

  const HeroCard({super.key, required this.movie, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
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
              Image.asset(
                movie.poster_image,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    ColoredBox(color: movie.dominantColor),
              ),
              if (isActive)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(14, 40, 14, 14),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Color(0xCC000000)],
                      ),
                    ),
                    child: Text(
                      movie.tagline,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 10,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
    );
  }
}
