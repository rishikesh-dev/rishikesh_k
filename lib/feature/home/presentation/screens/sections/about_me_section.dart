import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_v2/core/constants/constants.dart';
import 'package:portfolio_v2/core/theme/colors.dart';
import 'package:portfolio_v2/feature/home/presentation/blocs/bio_bloc/bloc/bio_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BioBloc, BioState>(
      builder: (context, state) {
        if (state is BioLoading) {
          return Skeletonizer(
            child: Column(
              children: [
                Text(
                  'About Me',
                  style: TextStyle(fontFamily: 'SilkScreen', fontSize: 44),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AppConstants.profile, width: 500),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.4,
                        child: Column(
                          spacing: 20,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              '🧑‍💻 WHO AM I?',
                              style: TextStyle(
                                fontFamily: AppConstants.silkScreen,
                                color: AppColors.primaryTertiary,
                                fontSize: 40,
                              ),
                            ),
                            Text(
                              "I'm RISHIKESH K,  a Flutter Developer and content creator behind Simple Code Malayalam.",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "I’m passionate about building smooth, scalable mobile and web applications using Flutter. Over the past few years, I've been deeply exploring the Flutter ecosystem, with a strong focus on Clean Architecture, state management, and maintainable code practices.I enjoy sharing my knowledge through YouTube tutorials and technical content in my native language—helping others understand Flutter from the ground up.My goal is simple: to create high-quality apps and help others grow in their development journey.",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: 100,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: 7,
                                itemBuilder: (context, index) {
                                  return Row(
                                    spacing: 5,
                                    children: [
                                      Image.asset(AppConstants.arrow),
                                      Text('state.bio.skills[index]'),
                                    ],
                                  );
                                },
                                separatorBuilder:
                                    (context, index) => SizedBox(width: 20),
                              ),
                            ),
                            Row(
                              spacing: 50,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [Text('Name : '), Text('Age: ')],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Email : '),
                                    Text('From: Kannur,Kerala,IND'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        if (state is BioLoaded) {
          return Column(
            children: [
              Text(
                'About Me',
                style: TextStyle(fontFamily: 'SilkScreen', fontSize: 44),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppConstants.profile, width: 500),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.4,
                      child: Column(
                        spacing: 20,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            '🧑‍💻 WHO AM I?',
                            style: TextStyle(
                              fontFamily: AppConstants.silkScreen,
                              color: AppColors.primaryTertiary,
                              fontSize: 40,
                            ),
                          ),
                          Text(
                            "I'm ${state.bio.name},  a Flutter Developer and content creator behind Simple Code Malayalam.",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "I’m passionate about building smooth, scalable mobile and web applications using Flutter. Over the past few years, I've been deeply exploring the Flutter ecosystem, with a strong focus on Clean Architecture, state management, and maintainable code practices.I enjoy sharing my knowledge through YouTube tutorials and technical content in my native language—helping others understand Flutter from the ground up.My goal is simple: to create high-quality apps and help others grow in their development journey.",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.bio.skills.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  spacing: 5,
                                  children: [
                                    Image.asset(AppConstants.arrow),
                                    Text(state.bio.skills[index]),
                                  ],
                                );
                              },
                              separatorBuilder:
                                  (context, index) => SizedBox(width: 20),
                            ),
                          ),
                          Row(
                            spacing: 50,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Name : ${state.bio.name}'),
                                  Text('Age: ${state.bio.age}'),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Email : ${state.bio.email}'),
                                  Text('From: Kannur,Kerala,IND'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        if (state is BioError) {
          return Center(child: Text(state.messsage));
        }
        return Container();
      },
    );
  }
}
