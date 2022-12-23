import 'package:equatable/equatable.dart';
import 'package:sport/core/error.dart';

abstract class WebState extends Equatable {
  const WebState();
  @override
  List<Object?> get props => [];
}

class InitialWebState extends WebState {}

class LoadingWebState extends WebState {}

class LoadedWebState extends WebState {
  @override
  List<Object?> get props => [];
}

class ErrorWebState extends WebState {
  final Failure failure;

  const ErrorWebState({required this.failure});
  @override
  List<Object?> get props => [failure];
}
