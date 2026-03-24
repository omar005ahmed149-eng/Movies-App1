// import 'package:flutter/material.dart';
//
// class BlurredBackground extends StatelessWidget {
//   final String prevAsset;
//   final String currentAsset;
//
//   const BlurredBackground({
//     super.key,
//     required this.prevAsset,
//     required this.currentAsset,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         _buildBgImage(prevAsset),
//         AnimatedSwitcher(
//           duration: const Duration(milliseconds: 700),
//           child: _buildBgImage(currentAsset),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildBgImage(String asset) {
//     return Image.asset(
//       asset,
//       key: ValueKey(asset),
//       fit: BoxFit.cover,
//       color: Colors.black.withOpacity(0.78),
//       colorBlendMode: BlendMode.darken,
//       errorBuilder: (_, __, ___) => const ColoredBox(color: Color(0xFF0a0a0f)),
//     );
//   }
// }
