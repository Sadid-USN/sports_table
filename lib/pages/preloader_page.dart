// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sport/pages/home_page.dart';
// import 'package:sport/pages/loading_page.dart';

// import '../bloc/team_cubit.dart';
// import '../bloc/team_state.dart';

// class PreLoaderPage extends StatelessWidget {
//   const PreLoaderPage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (_) => TeamCubit()..getTeam(),
//         child: Scaffold(
//             body: BlocBuilder<TeamCubit, TeamState>(builder: (context, state) {
//           if (state is PreloaderState) {
//             return const LoadingPage();
//           } else if (state is LoadedState) {
//             return const HomePage();
//           } else {
//             return Container();
//           }
//         })));
//   }
// }
