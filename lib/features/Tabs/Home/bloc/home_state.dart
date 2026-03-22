part of 'home_bloc.dart';

class HomeState {
  final int activeIndex;
  final String currentBg;
  final String prevBg;

  const HomeState({
    required this.activeIndex,
    required this.currentBg,
    required this.prevBg,
  });

  factory HomeState.initial() => HomeState(
        activeIndex: 0,
        currentBg: featuredMovies[0].poster_image,
        prevBg: featuredMovies[0].poster_image,
      );

  HomeState copyWith({
    int? activeIndex,
    String? currentBg,
    String? prevBg,
  }) {
    return HomeState(
      activeIndex: activeIndex ?? this.activeIndex,
      currentBg: currentBg ?? this.currentBg,
      prevBg: prevBg ?? this.prevBg,
    );
  }
}
