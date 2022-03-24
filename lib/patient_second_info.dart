import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'menu.dart';
import 'package:firebase_database/firebase_database.dart';

enum Pet { male,female }

class PateintInfoSecond extends StatefulWidget {
  String userId = "";
  PateintInfoSecond({Key? key, required this.userId}) : super(key: key);
  @override
  _PateintInfoSecondState createState() => _PateintInfoSecondState();
}

class _PateintInfoSecondState extends State<PateintInfoSecond> {
  DateTime dateTime = DateTime.now();
  Pet _pet = Pet.male;
  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: const Color(0xffE8D9E4),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffE8D9E4),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter Patient Information',
                style: TextStyle(
                  color: Colors.lightBlue,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Choose gender :',
                    style: TextStyle(
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: const Text('Male'),
                leading: Radio<Pet>(
                  value: Pet.male,
                  groupValue: _pet,
                  onChanged: (Pet? value) {
                    setState(() {
                      _pet = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Female'),
                leading: Radio<Pet>(
                  value: Pet.female,
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
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Choose Age :',
                    style: TextStyle(
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildDatePicker(),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 150,
                child: ElevatedButton(
                  onPressed: () async{
                    await databaseReference.child(widget.userId).push().set({
                      'type': _pet == Pet.male ? "male" : 'female',
                      'birthDate': "$dateTime",
                    });
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuHome()),
                    );
                  },
                  child: Text('Next'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
