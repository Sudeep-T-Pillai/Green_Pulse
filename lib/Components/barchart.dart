import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarChart extends StatelessWidget{
       MyBarChart({super.key});

       @override

        List <double> weeklysummar =[
          45.0,
          88.0,
          44.8,
          25.4,
          65.4,
          75.8,
          89.7
        ];

      Widget build(BuildContext context){
        return BarChart(
              BarChartData(
                  maxY: 200,
                  minY: 0,
              ),
        );
      }
  
}