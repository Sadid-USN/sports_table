import 'package:dio/dio.dart';

String endpointUrl =
    'https://www.thesportsdb.com/api/v2/json/40130162/livescore.php?s=Soccer';

String redirektUrl = 'https://kueski.shop/cq1al3k.php?key=9ckcsrbnkseenkjkuh04';

class ApiServices {
  final Dio _dio = Dio();

  // ignore: body_might_complete_normally_nullable
  Future<Response?> getTeamsData() async {
    try {
      final Response response = await _dio.get(endpointUrl,
          options: Options(
              followRedirects: true,
              validateStatus: (status) {
                return status! < 500;
              }));
      return response;
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<Response?> getWeb() async {
    try {
      final Response response = await _dio.get(redirektUrl,
          options: Options(
              followRedirects: true,
              validateStatus: (status) {
                return status! < 500;
              }));
      return response;
    } catch (error) {
      print('Error: $error');
    }
    return null;
  }
}

// on DioError catch (error) {
//       if (error.response!.statusCode == 302) {
//         final Response response = await _dio.get(redirektUrl);
//         return response.data;
//       }
//     }










// abstract class DataServices {
//   Future<List<TeamModel>?> getInfoTeam();
// }

// class RepositoryImpl implements DataServices {
//   @override
//   Future<List<TeamModel>?> getInfoTeam() => _getTeamFromUrl(endpointUrl);

//   Future<List<TeamModel>?> _getTeamFromUrl(String url) async {
//     try {
//       final response = await http.get(Uri.parse(url));
//       print(" THIS IS URL ===============> $url");
//       if (response.statusCode == 200) {
//         final team = json.decode(response.body);
//         return (team['teams'] as List)
//             .map((team) => TeamModel.fromJson(team))
//             .toList();
//       }
//     } catch (e) {
//       throw e.toString();
//     }
//     return null;
//   }
// }
