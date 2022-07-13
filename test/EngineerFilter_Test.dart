import 'package:flutter_test/flutter_test.dart';
import 'package:support_wheel_of_fate/DataModels/Engineer.dart';
import 'package:support_wheel_of_fate/HelperMethods/EngineerFilter.dart';

void main() {
  group('Version Calculator tests', () {
    test('test helper method json to Engineer', () {
      Engineer engineer = jsonToEngineer({
        "id": 10,
        "name": "Stan Dupp",
        "shiftsWorked": 1,
      });

      expect(engineer.name, "Stan Dupp");
      expect(engineer.id, 10);
      expect(engineer.shiftsWorked, 1);
    });

    test('test helper method getSupportWorker returns 2 Engineers', () {
      Engineer engineer1 = Engineer(1, "testname1", 0);
      Engineer engineer2 = Engineer(2, "testname2", 0);
      Engineer engineer3 = Engineer(3, "testname3", 0);
      Engineer engineer4 = Engineer(4, "testname4", 0);
      var engineer =
          getSupportWorker([engineer1, engineer2, engineer3, engineer4]);

      expect(engineer is List<Engineer>, true);
      expect(engineer.length, 2);
    });

    test('test helper method getPreviousSupport returns 2 Engineers', () {
      var engineer = getPreviousSupport([
        {
          "id": 10,
          "name": "Stan Dupp",
          "shiftsWorked": 1,
        },
        {
          "id": 2,
          "name": "david test",
          "shiftsWorked": 1,
        }
      ]);

      expect(engineer is List<Engineer>, true);
      expect(engineer.length, 2);
      expect(engineer[0].name, "Stan Dupp");
      expect(engineer[1].name, "david test");
    });
  });
}
