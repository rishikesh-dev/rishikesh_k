import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_v2/core/theme/theme.dart';
import 'package:portfolio_v2/feature/home/data/data_sources/bio_remote_data_source.dart';
import 'package:portfolio_v2/feature/home/data/data_sources/project_remote_data_source.dart';
import 'package:portfolio_v2/feature/home/data/data_sources/what_i_can_do_remote_data_source.dart';
import 'package:portfolio_v2/feature/home/data/repositories/bio_repository_impl.dart';
import 'package:portfolio_v2/feature/home/data/repositories/projects_repositoryimpl.dart';
import 'package:portfolio_v2/feature/home/data/repositories/what_i_can_do_repository_impl.dart';
import 'package:portfolio_v2/feature/home/domain/use_cases/bio_use_case.dart';
import 'package:portfolio_v2/feature/home/domain/use_cases/projects_use_case.dart';
import 'package:portfolio_v2/feature/home/domain/use_cases/what_i_can_do_use_case.dart';
import 'package:portfolio_v2/feature/home/presentation/blocs/bio_bloc/bloc/bio_bloc.dart';
import 'package:portfolio_v2/feature/home/presentation/blocs/project_bloc/bloc/project_bloc.dart';
import 'package:portfolio_v2/feature/home/presentation/blocs/what_i_can_do/bloc/what_i_can_do_bloc.dart';
import 'package:portfolio_v2/feature/home/presentation/screens/home_screen.dart';
import 'package:portfolio_v2/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) => BioBloc(
                BioUseCase(
                  BioRepositoryImpl(
                    BioRemoteDataSourceImpl(FirebaseFirestore.instance),
                  ),
                ),
              )..add(LoadBio()),
        ),
        BlocProvider(
          create:
              (_) => ProjectBloc(
                ProjectsUseCase(
                  ProjectsRepositoryimpl(
                    ProjectRemoteDataSourceImpl(FirebaseFirestore.instance),
                  ),
                ),
              )..add(LoadProject()),
        ),
        BlocProvider(
          create:
              (_) => WhatICanDoBloc(
                WhatICanDoUseCase(
                  repository: WhatICanDoRepositoryImpl(
                    remoteDataSource: WhatICanDoRemoteDataSourceImpl(
                      firestore: FirebaseFirestore.instance,
                    ),
                  ),
                ),
              )..add(LoadWhatICanDo()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RISHIKESH K',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
