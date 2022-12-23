import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport/bloc/web_bloc/web_state.dart';
import 'package:sport/core/error.dart';
import 'package:sport/dataservices/repository.dart';

class WebCubit extends Cubit<WebState> {
  final Repository repository;
  WebCubit({required this.repository}) : super(InitialWebState());

  Future<void> getWebView() async {
    emit(LoadingWebState());
    try {
      final teamList = await repository.getWeb();

      emit(LoadedWebState());
    } on Failure catch (error) {
      emit(ErrorWebState(failure: error));
    } catch (error) {
      print("Error: $error");
    }
  }
}
