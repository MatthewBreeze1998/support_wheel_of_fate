import 'dart:math';

import 'package:support_wheel_of_fate/DataModels/Engineer.dart';

List<Engineer> getDailySupport(List responseData) {
  List<Engineer> engineerThatHaventWorked = [];
  List<Engineer> engineerThatHaveWorkedOnce = [];
  //Filter list into list<Engineer>
  responseData.forEach((element) {
    Engineer tempEngineer = jsonToEngineer(element);
    //if they have worked one shift they get added to haveNotworked
    if (tempEngineer.shiftsWorked == 0) {
      engineerThatHaventWorked.add(tempEngineer);
    }
    //if they have worked one shift they get added to haveworkedOnce
    if (tempEngineer.shiftsWorked == 1) {
      engineerThatHaveWorkedOnce.add(tempEngineer);
    }
  });

  if (engineerThatHaventWorked.isNotEmpty &&
      engineerThatHaventWorked.length >= 2) {
    return getSupportWorker(engineerThatHaventWorked);
  } else {
    return getSupportWorker(engineerThatHaveWorkedOnce);
  }
}

List<Engineer> getPreviousSupport(List responseData) {
  List<Engineer> engineers = [];
  responseData.forEach((element) {
    Engineer tempEngineer = jsonToEngineer(element);
    engineers.add(tempEngineer);
  });
  return engineers;
}

Engineer jsonToEngineer(var json) {
  return Engineer(json["id"], json["name"], json["shiftsWorked"]);
}

//selects 2 engineers at random
List<Engineer> getSupportWorker(List<Engineer> availableEngineers) {
  var random = Random();
  int amSupportIndex = random.nextInt(availableEngineers.length);
  int pmSupportIndex = random.nextInt(availableEngineers.length);

  return [
    availableEngineers[amSupportIndex],
    availableEngineers[pmSupportIndex]
  ];
}
