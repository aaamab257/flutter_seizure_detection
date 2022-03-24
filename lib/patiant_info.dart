import 'package:flutter/material.dart';
import 'package:flutter_seizure_detection/patient_second_info.dart';
import 'package:firebase_database/firebase_database.dart';

class PatientInfo extends StatefulWidget {
  String userId = "";
  PatientInfo({Key? key, required this.userId}) : super(key: key);
  @override
  _PatientInfoState createState() => _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo> {
  final databaseReference = FirebaseDatabase.instance.reference();
  String fName = '' , sName = '' , nId = "" , height = '' , weight = '' ;
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                child: TextFormField(
                  onChanged: (v){
                    fName = v ;
                  },
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'First Name',

                      fillColor: const Color(0xffE8D9E4),
                    )),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                child: TextFormField(
                    onChanged: (v){
                      sName = v ;
                    },
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                      fillColor: const Color(0xffE8D9E4),
                    )),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                child: TextFormField(
                    onChanged: (v){
                      nId = v ;
                    },
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'National ID',

                      fillColor: const Color(0xffE8D9E4),
                    )),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                child: TextFormField(
                    onChanged: (v){
                      height = v ;
                    },
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Height',

                      fillColor: const Color(0xffE8D9E4),
                    )),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                child: TextFormField(
                    onChanged: (v){
                      weight = v ;
                    },
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Weight',

                      fillColor: const Color(0xffE8D9E4),
                    )),
              ),
              SizedBox(height: 20,),
              Container(
                width: 150,
                child: ElevatedButton(
                  onPressed: () async{
                    await databaseReference.child(widget.userId).set({
                      'fname': fName,
                      'lname': sName,
                      'national_id': nId,
                      'height' : height,
                      'weight' : weight,
                    });
                   await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PateintInfoSecond(userId: widget.userId,)),
                    );
                  },
                  child: Text('Next'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all( Colors.lightBlue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
