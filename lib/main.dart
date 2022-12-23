import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport/bloc/team_cubit.dart';
import 'package:sport/bloc/web_bloc/web_cubit.dart';
import 'package:sport/common/colors.dart';
import 'package:sport/dataservices/data_services.dart';
import 'package:sport/dataservices/repository.dart';
import 'package:sport/pages/home_page.dart';

void main() {
  runApp(MyApp(
    apiServices: ApiServices(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.apiServices});

  final ApiServices apiServices;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TeamCubit>(
          create: (context) => TeamCubit(
            repository: Repository(
              apiServices: apiServices,
            ),
          )..getTeams(),
        ),
        BlocProvider<WebCubit>(
          create: (context) => WebCubit(
            repository: Repository(
              apiServices: apiServices,
            ),
          )..getWebView(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            backgroundColor: AppColors.mainBgColor,
            scaffoldBackgroundColor: AppColors.mainBgColor,
          ),
          home: const HomePage()

          // const LoadingPage()

          ),
    );
  }
}
