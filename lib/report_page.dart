import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'menu.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuHome(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Report',
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
        child: Column(
          children: [
            SizedBox(height: 20.0,),
            Row(
              children: [
                Column(
                  children: [
                    Text('Patiant Name : Ahmed'),
                    SizedBox(height: 8.0,),
                    Text('Number of Siezure: 4'),
                  ],

                ),
                Spacer(),
                Text('National Id: 23165131374'),
              ],
            ),
            SfCartesianChart(
              // Initialize category axis
                primaryXAxis: CategoryAxis(),

                series: <LineSeries<SalesData, String>>[
                  LineSeries<SalesData, String>(
                    // Bind data source
                      dataSource:  <SalesData>[
                        SalesData('Jan', 35),
                        SalesData('Feb', 28),
                        SalesData('Mar', 34),
                        SalesData('Apr', 32),
                        SalesData('May', 40)
                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales
                  )
                ]
            ),
            SizedBox(height: 20.0,),
            SfCartesianChart(
              // Initialize category axis
                primaryXAxis: CategoryAxis(),

                series: <LineSeries<SalesData, String>>[
                  LineSeries<SalesData, String>(
                    // Bind data source
                      dataSource:  <SalesData>[
                        SalesData('Jan', 35),
                        SalesData('Feb', 28),
                        SalesData('Mar', 34),
                        SalesData('Apr', 32),
                        SalesData('May', 40)
                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales
                  )
                ]
            ),
            SizedBox(height: 20.0,),
            Container(
              width: 150,
              child: ElevatedButton(
                onPressed: () {

                },
                child: Text('Press to View'),
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.lightBlue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
