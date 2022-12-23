import 'package:sport/dataservices/data_services.dart';
import 'package:sport/models/team_model.dart';

class Repository {
  final ApiServices apiServices;

  Repository({required this.apiServices});

  // ignore: body_might_complete_normally_nullable
  Future<List<TeamModel>?> getTeams() async {
    final response = await apiServices.getTeamsData();

    if (response != null) {
      final data = response.data['events'] as List<dynamic>;
      print(data);
      return data.map((team) => TeamModel.fromJson(team)).toList();
    }
  }

  Future<void> getWeb() async {
    final response = await apiServices.getWeb();

    if (response != null) {
      final data = response.data;
      print(data);
      return data;
    }
  }
}
