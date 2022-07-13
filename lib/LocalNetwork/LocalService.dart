import 'package:dio/dio.dart';
import 'package:support_wheel_of_fate/DataModels/Engineer.dart';
import 'package:support_wheel_of_fate/HelperMethods/EngineerFilter.dart';

class LocalService {
  // http.Client _httpClient = http.Client();

  Dio _httpClient = Dio();
  Future<List<Engineer>> getAvailableEngineers() async {
    try {
      var response =
          await _httpClient.get("http://127.0.0.1:6060/getEngineers");
      if (response.statusCode == 200 && response.data != null) {
        {
          List engineers = response.data["message"]["engineers"];

          return getDailySupport(engineers);
        }
      }
    } catch (e) {
      print(e);
    }

    return [];
  }

  Future<List<Engineer>> getYesterdaysSupport() async {
    try {
      var response =
          await _httpClient.get("http://127.0.0.1:6060/workedYesterday");
      if (response.statusCode == 200 && response.data != null) {
        {
          List engineers = response.data["message"]["engineers"];

          return getPreviousSupport(engineers);
        }
      }
    } catch (e) {
      print(e);
    }

    return [];
  }
}
