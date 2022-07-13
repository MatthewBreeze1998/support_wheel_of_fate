// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:mockito/mockito.dart';
import 'package:support_wheel_of_fate/Client.dart/EngineerClient.dart';
import 'package:support_wheel_of_fate/DataModels/Engineer.dart';
import 'package:support_wheel_of_fate/Main/Routes/SupportWheelOfFate.dart';

class MockEngineerClient extends Mock implements EngineerClient {
  @override
  Future<List<Engineer>> getTodaysSupport() async {
    return [Engineer(2, "t1", 0), Engineer(2, "t2", 0)];
  }

  @override
  Future<List<Engineer>> getYesterdaysSupport() async {
    return [Engineer(2, "y1", 0), Engineer(2, "y2", 0)];
  }
}

void main() {
  Widget makeTestableDeviceList(EngineerClient ec) {
    return MaterialApp(
      home: SupportWheelOfFate(ec),
    );
  }

  group(' Support wheel of fate', () {
    testWidgets('default Page loads Correctly', (WidgetTester tester) async {
      EngineerClient ec = MockEngineerClient();
      var wheelOfFatePage = makeTestableDeviceList(ec);

      await tester.pumpWidget(wheelOfFatePage);
      await tester.pumpAndSettle();

      expect(find.text("AM"), findsOneWidget);
      expect(find.text("PM"), findsOneWidget);
      expect(find.text("Get Todays Support"), findsOneWidget);
      expect(find.text("Get Yesterdays Support"), findsOneWidget);
    });

    testWidgets('default Page loads todays support',
        (WidgetTester tester) async {
      EngineerClient ec = MockEngineerClient();
      var wheelOfFatePage = makeTestableDeviceList(ec);

      await tester.pumpWidget(wheelOfFatePage);
      await tester.pumpAndSettle();

      await tester.tap(find.text("Get Todays Support"));
      await tester.pumpAndSettle();

      expect(find.text("AM"), findsOneWidget);
      expect(find.text("PM"), findsOneWidget);
      expect(find.text("Get Todays Support"), findsOneWidget);
      expect(find.text("Get Yesterdays Support"), findsOneWidget);
      expect(find.text("t1"), findsOneWidget);
      expect(find.text("t2"), findsOneWidget);
    });

    testWidgets('default Page loads yesterdays support',
        (WidgetTester tester) async {
      EngineerClient ec = MockEngineerClient();
      var wheelOfFatePage = makeTestableDeviceList(ec);

      await tester.pumpWidget(wheelOfFatePage);
      await tester.pumpAndSettle();

      await tester.tap(find.text("Get Yesterdays Support"));
      await tester.pumpAndSettle();

      expect(find.text("AM"), findsOneWidget);
      expect(find.text("PM"), findsOneWidget);
      expect(find.text("Get Todays Support"), findsOneWidget);
      expect(find.text("Get Yesterdays Support"), findsOneWidget);
      expect(find.text("y1"), findsOneWidget);
      expect(find.text("y2"), findsOneWidget);
    });
  });
}
