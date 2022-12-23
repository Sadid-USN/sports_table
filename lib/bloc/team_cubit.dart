import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport/bloc/team_state.dart';
import 'package:sport/core/error.dart';
import 'package:sport/dataservices/repository.dart';
import 'package:sport/models/team_model.dart';

class TeamCubit extends Cubit<TeamState> {
  final Repository repository;
  TeamCubit({required this.repository}) : super(InitialState());

  Future<void> getTeams() async {
    emit(LoadingState());
    try {
      final List<TeamModel>? teamList = await repository.getTeams();

      emit(LoadedState(teams: teamList!));
    } on Failure catch (error) {
      emit(ErrorState(failure: error));
    } catch (error) {
      print("Error: $error");
    }
  }
}
