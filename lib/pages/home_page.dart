import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:sport/bloc/team_cubit.dart';
import 'package:sport/bloc/team_state.dart';
import 'package:sport/widgets/board_card.dart';

import '../common/assets.dart';

class HomePage extends StatelessWidget {
  // final AllTeamsModel teams;
  const HomePage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: SvgPicture.asset(
          height: 45,
          width: 45,
          Assets.ball,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<TeamCubit, TeamState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: GlowingProgressIndicator(
                child: SvgPicture.asset(
                  height: 100,
                  width: 100,
                  Assets.ball,
                ),
              ),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Text(state.failure.massege),
            );
          } else if (state is LoadedState) {
            final teams = state.teams;
            return teams.isEmpty
                ? const Center(
                    child: Text('No any Teams'),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: teams.length,
                          itemBuilder: (context, index) {
                            return BoardCard(
                              strLeague: teams[index].strLeague!,
                              strStatus: teams[index].strStatus!,
                              strHomeTeam: teams[index].strHomeTeam,
                              strAwayTeam: teams[index].strAwayTeam,
                              intHomeScore: teams[index].intHomeScore,
                              intAwayScore: teams[index].intAwayScore,
                              strEventTime: teams[index].strEventTime!,
                            );
                          },
                        ),
                      )
                    ],
                  );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
