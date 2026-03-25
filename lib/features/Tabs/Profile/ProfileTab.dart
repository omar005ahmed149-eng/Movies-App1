import 'package:flutter/material.dart';
import 'package:movies/core/resources/colors_manger.dart';
import 'package:movies/features/Tabs/Profile/Widgets/top_section.dart';
import 'package:movies/features/Tabs/Profile/Widgets/Bottom_Section.dart';

class Profiletab extends StatefulWidget {
  const Profiletab({super.key});

  @override
  State<Profiletab> createState() => _ProfiletabState();
}

class _ProfiletabState extends State<Profiletab> {
  int selectedTab = 0; // 0 = Watch List, 1 = History

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.black,
      body: SafeArea(
        child: Column(
          children: [
            // Top section owns avatar, stats, buttons, tab bar
            // It calls onTabChanged so ProfileTab can pass selectedTab to BottomSection
            TopSection(
              selectedTab: selectedTab,
              onTabChanged: (index) => setState(() => selectedTab = index),
            ),

            // Divider
            Container(
              height: 1,
              color: const Color(0xFF2A2A2A),
            ),

            // Bottom section renders the grid or empty state
            Expanded(
              child: BottomSection(selectedTab: selectedTab),
            ),
          ],
        ),
      ),
    );
  }
}
