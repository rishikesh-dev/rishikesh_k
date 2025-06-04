import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_v2/core/constants/constants.dart';
import 'package:portfolio_v2/core/micro_functions/lauch_url.dart';
import 'package:portfolio_v2/core/theme/colors.dart';
import 'package:portfolio_v2/feature/home/presentation/blocs/bio_bloc/bloc/bio_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<BioBloc, BioState>(
        builder: (context, state) {
          if (state is BioLoading) {
            return Skeletonizer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Welcome to my portfolio👋'),
                      Text(
                        'state.bio.name',
                        style: TextStyle(
                          fontSize: 101,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Text(
                        'Flutter Dev',
                        style: TextStyle(
                          fontFamily: 'SilkScreen',
                          color: AppColors.primaryTertiary,
                        ),
                      ),
                      Row(
                        spacing: 10,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.github,
                              color: AppColors.primaryTertiary,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.linkedin,
                              color: AppColors.primaryTertiary,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.youtube,
                              color: AppColors.primaryTertiary,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.instagram,
                              color: AppColors.primaryTertiary,
                            ),
                          ),

                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.envelope,
                              color: AppColors.primaryTertiary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 70.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      foregroundImage: AssetImage(AppConstants.head),
                      radius: 200,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is BioLoaded) {
            final bio = state.bio;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome to my portfolio👋'),
                    Text(
                      state.bio.name,
                      style: TextStyle(
                        fontSize: 101,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Text(
                      'Flutter Dev',
                      style: TextStyle(
                        fontFamily: 'SilkScreen',
                        color: AppColors.primaryTertiary,
                      ),
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        IconButton(
                          onPressed: () {
                            launchUrlFunction(bio.linkedIn);
                          },
                          icon: Icon(
                            FontAwesomeIcons.github,
                            color: AppColors.primaryTertiary,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            launchUrlFunction(bio.linkedIn);
                          },
                          icon: Icon(
                            FontAwesomeIcons.linkedin,
                            color: AppColors.primaryTertiary,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            launchUrlFunction(bio.youtube);
                          },
                          icon: Icon(
                            FontAwesomeIcons.youtube,
                            color: AppColors.primaryTertiary,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.instagram,
                            color: AppColors.primaryTertiary,
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            launchUrlFunction(
                              'mailto:${state.bio.email}.com?subject=Project Proposal – Flutter App Development',
                            );
                          },
                          icon: Icon(
                            FontAwesomeIcons.envelope,
                            color: AppColors.primaryTertiary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Stack(
                  children: [
                    Image.asset('assets/image/head.png', width: 600),
                    Positioned(
                      bottom: 50,
                      right: 120,
                      child: Card(
                        color: AppColors.primaryTertiary,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/image/flutter.png',
                            scale: 1,
                            width: 50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
          if (state is BioError) {
            return Center(child: Text(state.messsage));
          }
          return SizedBox();
        },
      ),
    );
  }
}
