import 'package:flutter/material.dart';
import 'package:support_wheel_of_fate/Client.dart/EngineerClient.dart';
import 'package:support_wheel_of_fate/DataModels/Engineer.dart';

class SupportWheelOfFate extends StatefulWidget {
  late final EngineerClient engineerClient;
  SupportWheelOfFate(this.engineerClient);
  @override
  State<StatefulWidget> createState() => _SupportWheelOfFate();
}

class _SupportWheelOfFate extends State<SupportWheelOfFate> {
  late EngineerClient engineerClient;
  String amEngineerName = "";
  String pmEngineerName = "";
  @override
  void initState() {
    engineerClient = widget.engineerClient;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Engineer> supportEengineer = [];

    return MaterialApp(
        home: Scaffold(
            body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        buildSupportPanal(
            "AM", Colors.amber, amEngineerName, Icons.wb_sunny_outlined),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildButton("Get Todays Support", () async {
              supportEengineer = await engineerClient.getTodaysSupport();
              setState(() {
                amEngineerName = supportEengineer[0].name;
                pmEngineerName = supportEengineer[1].name;
              });
            }),
            buildButton("Get Yesterdays Support", () async {
              supportEengineer = await engineerClient.getYesterdaysSupport();
              setState(() {
                amEngineerName = supportEengineer[0].name;
                pmEngineerName = supportEengineer[1].name;
              });
            })
          ],
        ),
        buildSupportPanal(
            "PM", Colors.deepOrange, pmEngineerName, Icons.wb_sunny),
      ],
    )));
  }

// build button for page
  Widget buildButton(String buttonTxt, buttonFunction()) {
    return Container(
        height: 50,
        margin: EdgeInsets.all(10),
        child:
            ElevatedButton(onPressed: buttonFunction, child: Text(buttonTxt)));
  }

  // builds pannels for displaying devloper name
  Widget buildSupportPanal(
      String title, Color color, String name, IconData icon) {
    Widget panal = Expanded(
        child: Container(
            margin: EdgeInsets.all(10),
            color: color,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(title),
                ),
                Expanded(
                    flex: 2,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Icon(
                        icon,
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: Text(name),
                ),
              ],
            )));

    return panal;
  }
}
