import 'dart:ui';

class MovieModel {
  final String title;
  final String rating;
  final String tagline;
  final String poster_image;
  final Color dominantColor;

  const MovieModel({
    required this.title,
    required this.rating,
    required this.tagline,
    required this.poster_image,
    required this.dominantColor,
  });
}