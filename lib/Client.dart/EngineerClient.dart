// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';
import 'package:support_wheel_of_fate/DataModels/Engineer.dart';

abstract class EngineerClient extends Model {
  Future<List<Engineer>> getTodaysSupport();
  Future<List<Engineer>> getYesterdaysSupport();
}
