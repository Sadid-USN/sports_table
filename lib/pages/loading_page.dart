import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:sport/bloc/web_bloc/web_cubit.dart';
import 'package:sport/bloc/web_bloc/web_state.dart';
import 'package:sport/pages/the_sportsdb_page.dart';

import '../common/assets.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WebCubit, WebState>(
      builder: (context, state) {
        if (state is LoadingWebState) {
          return Center(
            child: GlowingProgressIndicator(
              child: SvgPicture.asset(
                height: 100,
                width: 100,
                Assets.ball,
              ),
            ),
          );
        } else {
          return const TheSportsDbPage();
        }
      },
    );
  }
}
