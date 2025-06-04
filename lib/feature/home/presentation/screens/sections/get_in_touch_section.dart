import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_v2/core/constants/constants.dart';
import 'package:portfolio_v2/core/micro_functions/lauch_url.dart';

import '../../blocs/bio_bloc/bloc/bio_bloc.dart';

class GetInTouchSection extends StatelessWidget {
  const GetInTouchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BioBloc, BioState>(
      builder: (context, state) {
        if (state is BioLoading) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'GET IN TOUCH',
                style: TextStyle(
                  fontFamily: AppConstants.silkScreen,
                  fontSize: 35,
                ),
              ),
              Text(
                'Lets build something together',
                style: TextStyle(fontFamily: AppConstants.silkScreen),
              ),
              SizedBox(height: 50),
              Row(
                spacing: 50,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    radius: .9,
                    onTap: () {},
                    child: SizedBox(
                      width: 250,
                      height: 250,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Icon(FontAwesomeIcons.instagram, size: 80),
                            Text('📥DM on Instagram'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    radius: .9,
                    onTap: () {},
                    child: SizedBox(
                      width: 250,
                      height: 250,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Icon(FontAwesomeIcons.envelope, size: 80),
                            Text('📩 Email'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    radius: .9,
                    onTap: () {},
                    child: SizedBox(
                      width: 250,
                      height: 250,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Icon(FontAwesomeIcons.linkedin, size: 80),
                            Text('💼 Connect on LinkedIn'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0, bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 1),
                    Text('©️2025/RISHIKESH K'),
                    Spacer(flex: 3),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.github),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.linkedin),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.youtube),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.envelope),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              ),
            ],
          );
        }
        if (state is BioLoaded) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'GET IN TOUCH',
                style: TextStyle(
                  fontFamily: AppConstants.silkScreen,
                  fontSize: 35,
                ),
              ),
              Text(
                'Lets build something together',
                style: TextStyle(fontFamily: AppConstants.silkScreen),
              ),
              SizedBox(height: 50),
              Row(
                spacing: 50,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    radius: .9,
                    onTap: () {
                      launchUrlFunction(state.bio.instagram);
                    },
                    child: SizedBox(
                      width: 250,
                      height: 250,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Icon(FontAwesomeIcons.instagram, size: 80),
                            Text('📥DM on Instagram'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    radius: .9,
                    onTap: () {
                      launchUrlFunction(
                        'mailto:${state.bio.email}?subject=Project Proposal – Flutter App Development',
                      );
                    },
                    child: SizedBox(
                      width: 250,
                      height: 250,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Icon(FontAwesomeIcons.envelope, size: 80),
                            Text('📩 Email'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    radius: .9,
                    onTap: () {
                      launchUrlFunction(state.bio.linkedIn);
                    },
                    child: SizedBox(
                      width: 250,
                      height: 250,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Icon(FontAwesomeIcons.linkedin, size: 80),
                            Text('💼 Connect on LinkedIn'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0, bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 1),
                    Text('©️2025/${state.bio.name}'),
                    Spacer(flex: 3),
                    IconButton(
                      onPressed: () {
                        launchUrlFunction(state.bio.instagram);
                      },
                      icon: Icon(FontAwesomeIcons.github),
                    ),
                    IconButton(
                      onPressed: () {
                        launchUrlFunction(state.bio.linkedIn);
                      },
                      icon: Icon(FontAwesomeIcons.linkedin),
                    ),
                    IconButton(
                      onPressed: () {
                        launchUrlFunction(state.bio.youtube);
                      },
                      icon: Icon(FontAwesomeIcons.youtube),
                    ),
                    IconButton(
                      onPressed: () {
                        launchUrlFunction(
                          'mailto:${state.bio.email}?subject=Project Proposal – Flutter App Development',
                        );
                      },
                      icon: Icon(FontAwesomeIcons.envelope),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              ),
            ],
          );
        }
        return SizedBox();
      },
    );
  }
}
