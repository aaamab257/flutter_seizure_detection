import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_seizure_detection/report_page.dart';

import 'menu.dart';

class ViewReport extends StatefulWidget {
  @override
  _ViewReportState createState() => _ViewReportState();
}

enum Pet { yes, no }

class _ViewReportState extends State<ViewReport> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  DateTime dateTime = DateTime.now();
  Pet _pet = Pet.yes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: MenuHome(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'View Report',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Image.asset(
              'assets/images/menu_img.png',
              width: 50,
              height: 50,
            ),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select the Month :',
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                buildDatePicker(),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Add Graph',
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: const Text('Yes'),
                  leading: Radio<Pet>(
                    value: Pet.yes,
                    groupValue: _pet,
                    onChanged: (Pet? value) {
                      setState(() {
                        _pet = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('No'),
                  leading: Radio<Pet>(
                    value: Pet.no,
                    groupValue: _pet,
                    onChanged: (Pet? value) {
                      setState(() {
                        _pet = value!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReportScreen()),
                      );
                    },
                    child: Text('Continue'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightBlue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          minimumYear: 1960,
          maximumYear: DateTime.now().year,
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
}
