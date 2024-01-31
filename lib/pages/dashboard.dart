import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:green_pulse/navigationbar.dart';
import 'package:green_pulse/Components/barchart.dart';

class Dashboard extends StatelessWidget {
 const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top left Welcome back
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 45,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back...',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 13,
                    ),
                    child: Text(
                      'Kunuvava',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Container for graph
          SizedBox(
            height: 5,
          ),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 134, 157, 240),
              ),
              height: 190,
              child: Row(
                children: [
                  // Today's analysis
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 25,
                    ),
                    child: Text(
                      'Today\'s Analysis',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),

                  // Pie chart
                  SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    height: 130,
                    width: 130,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: 90,
                            showTitle: false,
                            radius: 60,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          PieChartSectionData(
                            value: 10,
                            title: 'Used',
                            showTitle: false,
                            radius: 60,
                            color: Color.fromARGB(255, 214, 124, 213),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Weekly progress 
          //text - Weekly progress
            SizedBox(height: 5,),
              Text('Weekly Progress',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700
              )
              ),


            //container for Bar graph
           
            SizedBox(height: 15,),
            Container(
              child:SizedBox(
                height: 300,
                child: MyBarChart(),
              ),
            ),




        ],
      ),
        bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
