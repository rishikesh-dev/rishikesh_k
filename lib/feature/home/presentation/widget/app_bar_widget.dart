import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_v2/core/micro_functions/lauch_url.dart';
import 'package:portfolio_v2/core/theme/colors.dart';
import 'package:portfolio_v2/feature/home/presentation/blocs/bio_bloc/bloc/bio_bloc.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.onNavigatedSelected});

  final Function(String) onNavigatedSelected;
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isHovered = ValueNotifier<bool>(false);
    final isMobile = MediaQuery.of(context).size.width < 800;
    return BlocBuilder<BioBloc, BioState>(
      builder: (context, state) {
        if (state is BioLoaded) {
          return SliverAppBar(
            toolbarHeight: 80,
            title: RichText(
              text: TextSpan(
                text: isMobile ? 'R' : 'RISHIKESH',
                style: TextStyle(
                  color: AppColors.lightPrimary,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: '.',
                    style: TextStyle(
                      color: AppColors.primaryTertiary,
                      fontWeight: FontWeight.w900,
                      fontSize: 60,
                    ),
                  ),
                  TextSpan(text: isMobile ? null : 'K'),
                ],
              ),
            ),
            actions:
                isMobile
                    ? null
                    : [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: InkWell(
                          onTap: () => onNavigatedSelected('home'),
                          child: Text('Home'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: InkWell(
                          onTap: () => onNavigatedSelected('about'),
                          child: Text('About'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: InkWell(
                          onTap: () => onNavigatedSelected('projects'),
                          child: Text('Projects'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: InkWell(
                          onTap: () => onNavigatedSelected('contact'),
                          child: Text('Contact'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          launchUrlFunction(state.bio.resume);
                        },
                        child: MouseRegion(
                          onEnter: (_) => isHovered.value = true,
                          onExit: (_) => isHovered.value = false,
                          child: ValueListenableBuilder(
                            valueListenable: isHovered,
                            builder: (context, isHover, _) {
                              return AnimatedContainer(
                                margin: EdgeInsets.only(right: 50),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 7,
                                  horizontal: 30,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      isHover
                                          ? AppColors.primaryTertiary
                                          : AppColors.lightPrimary,
                                ),
                                transform:
                                    isHover
                                        ? (Matrix4.identity()
                                          ..scale(1.1, 1.1, 1.1))
                                        : Matrix4.identity(),
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                                child: Text(
                                  'Resume',
                                  style: TextStyle(
                                    color:
                                        isHover
                                            ? AppColors.lightPrimary
                                            : AppColors.darkPrimary,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
            backgroundColor: Colors.transparent,
          );
        }
        return SliverAppBar(
          toolbarHeight: 80,
          title: RichText(
            text: TextSpan(
              text: 'RISHIKESH',
              style: TextStyle(
                color: AppColors.lightPrimary,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: '.',
                  style: TextStyle(
                    color: AppColors.primaryTertiary,
                    fontWeight: FontWeight.w900,
                    fontSize: 60,
                  ),
                ),
                const TextSpan(text: 'K'),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: InkWell(
                onTap: () => onNavigatedSelected('home'),
                child: Text('Home'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: InkWell(
                onTap: () => onNavigatedSelected('about'),
                child: Text('About'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: InkWell(
                onTap: () => onNavigatedSelected('projects'),
                child: Text('Projects'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: InkWell(
                onTap: () => onNavigatedSelected('contact'),
                child: Text('Contact'),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: MouseRegion(
                onEnter: (_) => isHovered.value = true,
                onExit: (_) => isHovered.value = false,
                child: ValueListenableBuilder(
                  valueListenable: isHovered,
                  builder: (context, isHover, _) {
                    return AnimatedContainer(
                      margin: EdgeInsets.only(right: 50),
                      padding: const EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 30,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            isHover
                                ? AppColors.primaryTertiary
                                : AppColors.lightPrimary,
                      ),
                      transform:
                          isHover
                              ? (Matrix4.identity()..scale(1.1, 1.1, 1.1))
                              : Matrix4.identity(),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                      child: Text(
                        'Resume',
                        style: TextStyle(
                          color:
                              isHover
                                  ? AppColors.lightPrimary
                                  : AppColors.darkPrimary,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
        );
      },
    );
  }
}
