import 'package:equatable/equatable.dart';
import 'package:sport/core/error.dart';
import 'package:sport/models/team_model.dart';

abstract class TeamState extends Equatable {
  const TeamState();
  @override
  List<Object?> get props => [];
}

class InitialState extends TeamState {}

class LoadingState extends TeamState {}

class LoadedState extends TeamState {
  final List<TeamModel> teams;
  const LoadedState({required this.teams});

  @override
  List<Object?> get props => [teams];
}

class ErrorState extends TeamState {
  final Failure failure;

  const ErrorState({required this.failure});
  @override
  List<Object?> get props => [failure];
}
