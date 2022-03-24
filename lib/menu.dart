import 'package:flutter/material.dart';
import 'package:flutter_seizure_detection/home_page.dart';
import 'package:flutter_seizure_detection/login.dart';
import 'package:flutter_seizure_detection/patiant_info.dart';
import 'package:flutter_seizure_detection/view_report.dart';

class MenuHome extends StatefulWidget {
  @override
  _MenuHomeState createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
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
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: ListTile(
                  leading: Image.asset(
                    'assets/images/home.png',
                    scale: 1,
                  ),
                  title: Text(
                    'Home Page',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PatientInfo(userId: "1321321",)),
                  );
                },
                child: ListTile(
                  leading: Image.asset(
                    'assets/images/info.png',
                    scale: 1,
                  ),
                  title: Text(
                    'Update Information',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewReport()),
                  );
                },
                child: ListTile(
                  leading: Image.asset(
                    'assets/images/update.png',
                    scale: 1,
                  ),
                  title: Text(
                    'View Report',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: ListTile(
                  leading: Image.asset(
                    'assets/images/logout.png',
                    scale: 1,
                  ),
                  title: Text(
                    'Log Out',
                    style: TextStyle(fontSize: 18),
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
