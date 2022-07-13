import 'package:support_wheel_of_fate/Client.dart/EngineerClient.dart';
import 'package:support_wheel_of_fate/DataModels/Engineer.dart';

import 'LocalService.dart';

class LocalInterface extends EngineerClient {
  LocalService service = LocalService();

  @override
  Future<List<Engineer>> getTodaysSupport() async {
    return await service.getAvailableEngineers();
  }

  @override
  Future<List<Engineer>> getYesterdaysSupport() async {
    return await service.getYesterdaysSupport();
  }
}
