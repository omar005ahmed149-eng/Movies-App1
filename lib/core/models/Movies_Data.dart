import 'dart:ui';

import 'package:movies/core/resources/assets_manger.dart';

import 'Movie_Model.dart';
class MovieData{

static final List<MovieModel> featuredMovies = [
  MovieModel(
    title: '1917',
    rating: "7.7",
    poster_image:AssetsManger.Poster_1917,

  ),
  MovieModel(
    title: 'Baby Driver',
    rating: "7.6",
    poster_image:AssetsManger.Baby_Driver,
  ),
  MovieModel(
    title: 'Captain America',
    rating: "7.7",
    poster_image:AssetsManger.Captain_America,
  ),
  MovieModel(
    title: 'The Dark Knight',
    rating:"9.0",
    poster_image: AssetsManger.Dark_Knight,
  ),
  MovieModel(
    title: 'Black Widow',
    rating: "7.7",
    poster_image:AssetsManger.Black_Widow,
  ),
  MovieModel(
    title: 'Joker',
    rating: "8.1",
    poster_image: AssetsManger.joker,
  ),
MovieModel(
    title: 'Iron Man 3',
    rating: "6.9",
  poster_image: AssetsManger.iron_man3,
  ),
MovieModel(
    title: 'Avengers',
    rating: "7.0",
    poster_image: AssetsManger.avengers,
  ),
  MovieModel(
    title: 'Doctor Strange',
    rating: "7.5",
    poster_image:AssetsManger.dr_strange,
  ),
  MovieModel(
    title: 'Wednesday',
    rating: "8.0",
    poster_image: AssetsManger.wednesday,
  ),
  MovieModel(
    title: 'Doctor Who',
    rating: "8.2",
    poster_image: AssetsManger.doctor_who,
  ),
  MovieModel(
    title: 'Godzilla',
    rating: "7.3",
    poster_image: AssetsManger.godzilla,
  ),
];

 static final Map<String, List<MovieModel>> categories = {
  'Action': [
    featuredMovies[1],
    featuredMovies[2],
    featuredMovies[3],
    featuredMovies[4],
    featuredMovies[7],
    featuredMovies[8],
    featuredMovies[9],
    featuredMovies[11],
  ],
  'Drama': [
    featuredMovies[0],
    featuredMovies[1],
    featuredMovies[3],
    featuredMovies[4],
    featuredMovies[6],
    featuredMovies[9],
  ],
  'Sci-Fi': [
    featuredMovies[0],
    featuredMovies[2],
    featuredMovies[3],
    featuredMovies[4],
    featuredMovies[10],
    featuredMovies[11],
  ],
   'Animation':[],
   'Biography':[],
};
static List<String> get labels => categories.keys.toList();

}