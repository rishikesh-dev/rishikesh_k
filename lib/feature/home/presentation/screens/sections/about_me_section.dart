import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_v2/core/constants/constants.dart';
import 'package:portfolio_v2/core/theme/colors.dart';
import 'package:portfolio_v2/feature/home/domain/entity/bio_entity.dart';
import 'package:portfolio_v2/feature/home/presentation/blocs/bio_bloc/bloc/bio_bloc.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BioBloc, BioState>(
      builder: (context, state) {
        if (state is BioLoading) {
          return CircularProgressIndicator();
        }
        if (state is BioLoaded) {
          return LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 1200) {
                return _buildIntroContent(
                  context,
                  bio: state.bio,
                  isMobile: false,
                );
              } else if (constraints.maxWidth > 800) {
                return _buildIntroContent(context, bio: state.bio, isTab: true);
              } else {
                return _buildIntroContent(
                  context,
                  bio: state.bio,
                  isMobile: true,
                );
              }
            },
          );
        }
        if (state is BioError) {
          return Center(child: Text(state.messsage));
        }
        return Container();
      },
    );
  }

  Widget _buildIntroContent(
    BuildContext context, {
    BioEntity? bio,
    bool isMobile = false,
    bool isTab = false,
  }) {
    final imageContent = FadeInImage.assetNetwork(
      image: AppConstants.profile,
      placeholder: AppConstants.profile,
      width: isMobile ? 500 : 500,
      fit: BoxFit.cover,
    );
    final content = Column(
      spacing: 20,
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,

      children: [
        Text(
          '🧑‍💻 WHO AM I?',
          style: TextStyle(
            fontFamily: AppConstants.silkScreen,
            color: AppColors.primaryTertiary,
            fontSize: isMobile ? 30 : 40,
          ),
        ),
        isMobile ? imageContent : SizedBox(),
        Text(
          "I'm ${bio!.name},  a Flutter Developer and content creator behind Simple Code Malayalam.",
          style: TextStyle(
            fontSize: isMobile ? 20 : 25,
            fontWeight: FontWeight.bold,
          ),
          textAlign: isMobile ? TextAlign.center : null,
        ),
        Text(
          "I’m passionate about building smooth, scalable mobile and web applications using Flutter. Over the past few years, I've been deeply exploring the Flutter ecosystem, with a strong focus on Clean Architecture, state management, and maintainable code practices.I enjoy sharing my knowledge through YouTube tutorials and technical content in my native language—helping others understand Flutter from the ground up.My goal is simple: to create high-quality apps and help others grow in their development journey.",
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
          textAlign: isMobile ? TextAlign.center : null,
        ),
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: bio.skills.length,
            itemBuilder: (context, index) {
              return Row(
                spacing: 5,
                children: [
                  Image.asset(AppConstants.arrow),
                  Text(bio.skills[index]),
                ],
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 20),
          ),
        ),
        isMobile
            ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    Text('Name : ${bio.name}'),
                    Text('Age: ${bio.age}'),
                  ],
                ),
                Text('Email : ${bio.email}'),
                Text('From: Kannur,Kerala,IND'),
              ],
            )
            : Row(
              spacing: isMobile ? 10 : 50,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name : ${bio.name}'),
                    Text('Age: ${bio.age}'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email : ${bio.email}'),
                    Text('From: Kannur,Kerala,IND'),
                  ],
                ),
              ],
            ),
      ],
    );
    if (isMobile) {
      return Column(children: [content]);
    } else if (isTab) {
      return Row(children: [imageContent, Flexible(child: content)]);
    } else {
      return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            imageContent,
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.5,
              child: content,
            ),
          ],
        ),
      );
    }
  }
}
