import 'package:flutter/material.dart';
import 'package:movies/core/models/user_model.dart';

import '../../../core/resources/colors_manger.dart';

class Profiletab extends StatelessWidget {
  const Profiletab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Popcorn icon made with widgets
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 90,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const Icon(Icons.local_movies_rounded, size: 80, color: Color(0xFFFFC107)),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Find your movie',
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.bookmark_border_rounded, size: 64, color: Colors.grey),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.person_outline_rounded, size: 64, color: Colors.grey),
    );
  }
}



