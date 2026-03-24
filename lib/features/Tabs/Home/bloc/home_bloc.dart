import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/models/Movies_Data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<HomePageChanged>(_onPageChanged);
  }

  void _onPageChanged(HomePageChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      prevBg: state.currentBg,
      activeIndex: event.index,
      currentBg:  MovieData.featuredMovies[event.index].poster_image,
    ));
  }
}
