// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_v2/core/constants/constants.dart';
import 'package:portfolio_v2/core/micro_functions/lauch_url.dart';
import 'package:portfolio_v2/core/theme/colors.dart';
import 'package:portfolio_v2/feature/home/presentation/blocs/bio_bloc/bloc/bio_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, required this.onNavigatedSelected});

  final Function(String) onNavigatedSelected;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BioBloc, BioState>(
      builder: (context, state) {
        if (state is BioLoaded) {
          return Drawer(
            child: Column(
              spacing: 20,
              children: [
                FadeInImage.assetNetwork(
                  placeholder: AppConstants.head,
                  image: AppConstants.head,
                ),
                Text(
                  'RISHIKESH K',
                  style: TextStyle(
                    fontFamily: AppConstants.silkScreen,
                    fontSize: 30,
                  ),
                ),
                InkWell(
                  onTap: () => onNavigatedSelected('home'),
                  child: Text('Home'),
                ),
                InkWell(
                  onTap: () => onNavigatedSelected('about'),
                  child: Text('About'),
                ),
                InkWell(
                  onTap: () => onNavigatedSelected('projects'),
                  child: Text('Projects'),
                ),
                InkWell(
                  onTap: () => onNavigatedSelected('contact'),
                  child: Text('Contact'),
                ),
                ElevatedButton(
                  onPressed: () => launchUrlFunction(state.bio.resume),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                    backgroundColor: AppColors.primaryTertiary,
                    foregroundColor: AppColors.darkSecoundary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Resume'),
                ),
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
