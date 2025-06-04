import 'package:flutter/material.dart';
import 'package:portfolio_v2/core/micro_functions/lauch_url.dart';
import 'package:portfolio_v2/core/theme/colors.dart';
import 'package:portfolio_v2/feature/home/domain/entity/project_entity.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key, required this.project});
  final ProjectEntity project;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  final ValueNotifier<bool> hoverNotifier = ValueNotifier(false);

  @override
  void dispose() {
    hoverNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrlFunction(widget.project.url),
      child: MouseRegion(
        onEnter: (_) => hoverNotifier.value = true,
        onExit: (_) => hoverNotifier.value = false,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(widget.project.imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: hoverNotifier,
              builder: (context, isHovered, child) {
                return Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear,
                    child: Container(
                      padding:
                          isHovered
                              ? const EdgeInsets.all(20)
                              : EdgeInsets.zero,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.darkPrimary.withValues(alpha: 0.6),
                      ),
                      child:
                          isHovered
                              ? Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(
                                      widget.project.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(widget.project.description),
                                  ),
                                ],
                              )
                              : const SizedBox.shrink(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
