import 'package:flutter/material.dart';
import 'package:flutter_seizure_detection/MapLocation.dart';
import 'package:flutter_seizure_detection/menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: MenuHome(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Location',
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
        body: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: MapLocation(),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex : 1 ,
                              child: Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.green,
                                    ),
                                  ),
                                  SizedBox(height: 8,),
                                  Text('Stable'),
                                ],
                              ),
                            ),
                            Expanded(
                              flex : 1 ,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.orange,
                                    ),
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(height: 8,),
                                  Text('Increased HR'),
                                ],
                              ),
                            ),
                            Expanded(
                              flex : 1 ,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.red,
                                    ),
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(height: 8,),
                                  Text('Seizure'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: 190,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text(
                              'Child Condition',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
