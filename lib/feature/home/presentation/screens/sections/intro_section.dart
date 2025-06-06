import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_v2/core/constants/constants.dart';
import 'package:portfolio_v2/core/micro_functions/lauch_url.dart';
import 'package:portfolio_v2/core/theme/colors.dart';
import 'package:portfolio_v2/feature/home/domain/entity/bio_entity.dart';
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
              child: _buildIntroContent(context, isLoading: true),
            );
          } else if (state is BioLoaded) {
            return LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= 1200) {
                  return _buildIntroContent(context, bio: state.bio);
                } else {
                  return _buildIntroContent(
                    context,
                    bio: state.bio,
                    isMobile: true,
                  );
                }
              },
            );
          } else if (state is BioError) {
            return Center(child: Text(state.messsage));
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildIntroContent(
    BuildContext context, {
    BioEntity? bio,
    bool isMobile = false,
    bool isLoading = false,
  }) {
    final content = Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Welcome to my portfolio👋'),
        Text(
          isLoading ? 'state.bio.name' : bio!.name,
          style: TextStyle(
            fontSize: isMobile ? MediaQuery.of(context).size.width / (10) : 100,
            fontWeight: isMobile ? FontWeight.bold : FontWeight.w500,
          ),
        ),
        const Text(
          'Flutter Dev',
          style: TextStyle(
            fontFamily: 'SilkScreen',
            color: AppColors.primaryTertiary,
          ),
        ),
        Wrap(
          spacing: 10,
          children: [
            IconButton(
              onPressed:
                  isLoading ? null : () => launchUrlFunction(bio!.linkedIn),
              icon: const Icon(
                FontAwesomeIcons.github,
                color: AppColors.primaryTertiary,
              ),
            ),
            IconButton(
              onPressed:
                  isLoading ? null : () => launchUrlFunction(bio!.linkedIn),
              icon: const Icon(
                FontAwesomeIcons.linkedin,
                color: AppColors.primaryTertiary,
              ),
            ),
            IconButton(
              onPressed:
                  isLoading ? null : () => launchUrlFunction(bio!.youtube),
              icon: const Icon(
                FontAwesomeIcons.youtube,
                color: AppColors.primaryTertiary,
              ),
            ),
            IconButton(
              onPressed: isLoading ? null : () {},
              icon: const Icon(
                FontAwesomeIcons.instagram,
                color: AppColors.primaryTertiary,
              ),
            ),
            IconButton(
              onPressed:
                  isLoading
                      ? null
                      : () => launchUrlFunction(
                        'mailto:${bio!.email}?subject=Project Proposal – Flutter App Development',
                      ),
              icon: const Icon(
                FontAwesomeIcons.envelope,
                color: AppColors.primaryTertiary,
              ),
            ),
          ],
        ),
      ],
    );

    final imageSection = Stack(
      children: [
        FadeInImage.assetNetwork(
          image: AppConstants.head,
          placeholder: AppConstants.head,
          width: isMobile ? 400 : 600,
        ),
        Positioned(
          bottom: isMobile ? 20 : 50,
          right: isMobile ? 50 : 40,
          child: Card(
            color: AppColors.primaryTertiary,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FadeInImage.assetNetwork(
                image: AppConstants.flutter,
                placeholder: AppConstants.flutter,
                width: 50,
              ),
            ),
          ),
        ),
      ],
    );

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [imageSection, const SizedBox(height: 30), content],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          content,
          Padding(
            padding: const EdgeInsets.only(right: 70.0),
            child: imageSection,
          ),
        ],
      );
    }
  }
}
