import 'package:flutter/material.dart';
import 'package:portfolio_v2/feature/home/presentation/screens/sections/about_me_section.dart';
import 'package:portfolio_v2/feature/home/presentation/screens/sections/get_in_touch_section.dart';
import 'package:portfolio_v2/feature/home/presentation/screens/sections/intro_section.dart';
import 'package:portfolio_v2/feature/home/presentation/screens/sections/project_show_case_section.dart';
import 'package:portfolio_v2/feature/home/presentation/screens/sections/what_i_can_do_section.dart';
import 'package:portfolio_v2/feature/home/presentation/widget/app_bar_widget.dart';
import 'package:portfolio_v2/feature/home/presentation/widget/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final GlobalKey _contactSection = GlobalKey();
final GlobalKey _homeSection = GlobalKey();
final GlobalKey _aboutSection = GlobalKey();
final GlobalKey _projectsSection = GlobalKey();

scrollToSection(GlobalKey key) {
  Scrollable.ensureVisible(
    key.currentContext!,
    duration: Duration(milliseconds: 600),
    curve: Curves.easeIn,
  );
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1200;
    return Scaffold(
      drawer: isMobile ? AppDrawer(onNavigatedSelected: (p0) {}) : null,
      extendBody: true,
      body: CustomScrollView(
        slivers: [
          AppBarWidget(
            onNavigatedSelected: (String section) {
              switch (section) {
                case 'home':
                  scrollToSection(_homeSection);
                  break;
                case 'about':
                  scrollToSection(_aboutSection);
                  break;
                case 'projects':
                  scrollToSection(_projectsSection);
                  break;
                case 'contact':
                  scrollToSection(_contactSection);
                  break;
              }
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SingleChildScrollView(
                child: Column(
                  spacing: 30,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IntroSection(key: _homeSection),
                    Text(
                      'About Me',
                      style: TextStyle(fontFamily: 'SilkScreen', fontSize: 44),
                    ),
                    AboutMeSection(key: _aboutSection),
                    WhatICanDoSection(),
                    ProjectShowCaseSection(key: _projectsSection),
                    GetInTouchSection(key: _contactSection),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
