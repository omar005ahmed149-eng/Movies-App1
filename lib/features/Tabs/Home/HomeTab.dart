import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/resources/assets_manger.dart';
import 'package:movies/core/resources/colors_manger.dart';
import 'package:movies/features/Tabs/Home/Widgets/Movies_Data.dart';

import 'bloc/home_bloc.dart';
import 'Widgets/Bottom_Section.dart';
import 'Widgets/Movie_Model.dart';
import 'Widgets/Top_section.dart';
import 'Widgets/Blurred_Background.dart';

class Hometab extends StatelessWidget {
  const Hometab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: const _HomeTabView(),
    );
  }
}

class _HomeTabView extends StatelessWidget {
  const _HomeTabView();

  List<Widget> _buildCategorySliders() {
    return categories.entries.map((entry) {
      return SliverToBoxAdapter(
        child: BottomSection(
          label: entry.key,
          movies: entry.value,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorsManger.black,
          body: Stack(
            children: [
              // ── Blurred background ────────────────────────────────────
              BlurredBackground(
                prevAsset: state.prevBg,
                currentAsset: state.currentBg,
              ),

              // ── Dark gradient overlay ─────────────────────────────────
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x44000000),
                      Color(0x22000000),
                      Color(0x99000000),
                      Color(0xF2000000),
                    ],
                    stops: [0.0, 0.3, 0.65, 1.0],
                  ),
                ),
              ),

              // ── Scrollable content ────────────────────────────────────
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: TopSection(activeIndex: state.activeIndex),
                  ),
                  SliverToBoxAdapter(
                    child: Image.asset(AssetsManger.available),
                  ),
                  ..._buildCategorySliders(),
                  const SliverToBoxAdapter(child: SizedBox(height: 40)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
