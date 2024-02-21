import 'package:flutter/material.dart';
import 'package:green_pulse/Components/montbarchart.dart';
import 'package:green_pulse/Components/yrbarchart.dart';
import 'package:green_pulse/navigationbar.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
            SizedBox(height: 10),

             Center(
               child: Text(
                'Monthly Progress',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                           ),
             ),

             SizedBox(height: 0,),

             Container(
              child: SizedBox(
                height: 250,
                child: MoBarChart(),
              ),
            ),

            SizedBox(height: 30,),

             Center(
               child: Text(
                'Yearly Progress',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                           ),
             ),

              Container(
              child: SizedBox(
                height: 250,
                child: YrBarChart(),
              ),
            ),

        ]
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}