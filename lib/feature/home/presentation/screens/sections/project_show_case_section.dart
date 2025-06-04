import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_v2/core/constants/constants.dart';
import 'package:portfolio_v2/core/micro_functions/lauch_url.dart';
import 'package:portfolio_v2/feature/home/presentation/blocs/project_bloc/bloc/project_bloc.dart';
import 'package:portfolio_v2/feature/home/presentation/widget/project_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProjectShowCaseSection extends StatelessWidget {
  const ProjectShowCaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(
          child: Text(
            'Projects Showcase',
            style: TextStyle(fontFamily: AppConstants.silkScreen, fontSize: 30),
          ),
        ),
        SizedBox(height: 20),
        InkWell(
          splashFactory: NoSplash.splashFactory,
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
          onTap: () => launchUrlFunction('https://github.com/rishikesh-dev'),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Show all',
                style: TextStyle(
                  fontFamily: AppConstants.silkScreen,
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 5),
              Icon(FontAwesomeIcons.arrowRight, size: 18),
              SizedBox(width: 100),
            ],
          ),
        ),
        BlocBuilder<ProjectBloc, ProjectState>(
          builder: (context, state) {
            if (state is ProjectLoading) {
              return Skeletonizer(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  padding: EdgeInsets.all(100),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    childAspectRatio: 1 / .8,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppConstants.head),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  },
                ),
              );
            }
            if (state is ProjectLoaded) {
              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.project.length,
                padding: EdgeInsets.all(100),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                  childAspectRatio: 1 / .8,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  final project = state.project[index];
                  return ProjectCard(project: project);
                },
              );
            }
            if (state is ProjectError) {
              return Text(state.message);
            }
            return Text('No data available');
          },
        ),
      ],
    );
  }
}
