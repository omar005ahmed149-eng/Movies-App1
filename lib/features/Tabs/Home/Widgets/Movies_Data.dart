import 'dart:ui';

import 'package:movies/core/resources/assets_manger.dart';

import 'Movie_Model.dart';

final List<MovieModel> featuredMovies = [
  MovieModel(
    title: '1917',
    rating: "7.7",
    tagline: 'TIME IS THE ENEMY',
    poster_image:AssetsManger.Poster_1917,
    dominantColor: Color(0xFF1a3a5c),
  ),
  MovieModel(
    title: 'Baby Driver',
    rating: "7.6",
    tagline: 'ALL YOU NEED IS ONE KILLER TRACK',
    poster_image:AssetsManger.Baby_Driver,
    dominantColor: Color(0xFF8B1A1A),
  ),
  MovieModel(
    title: 'Captain America',
    rating: "7.7",
    tagline: 'WHEN PATRIOTS BECOME HEROES',
    poster_image:AssetsManger.Captain_America,
    dominantColor: Color(0xFF0a2a6e),
  ),
  MovieModel(
    title: 'The Dark Knight',
    rating:"9.0",
    tagline: 'WHY SO SERIOUS?',
    poster_image:AssetsManger.Dark_Knight,
    dominantColor: Color(0xFF0d0d1a),
  ),
  MovieModel(
    title: 'Black Widow',
    rating: "7.7",
    tagline: "SHE'S DONE RUNNING",
    poster_image:AssetsManger.Black_Widow,
    dominantColor: Color(0xFF1a0a0a),
  ),
];

final Map<String, List<MovieModel>> categories = {
  'Action': [
    featuredMovies[2],
    featuredMovies[3],
    featuredMovies[4],
    featuredMovies[1],
  ],
  'Drama': [
    featuredMovies[0],
    featuredMovies[3],
    featuredMovies[1],
    featuredMovies[4],
  ],
  'Sci-Fi': [
    featuredMovies[2],
    featuredMovies[4],
    featuredMovies[0],
    featuredMovies[3],
  ],
};