import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:green_pulse/Components/bardata.dart';

class MyBarChart extends StatelessWidget {
  MyBarChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> daysOfWeek = [
      'Sun',
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
    ];

    List<double> weeklySummary = [45.0, 88.0, 44.8, 25.4, 65.4, 75.8, 89.7];

    Bardata mybardata = Bardata(
      Sunday: weeklySummary[0],
      Monday: weeklySummary[1],
      Tuesday: weeklySummary[2],
      Wednesday: weeklySummary[3],
      Thursday: weeklySummary[4],
      Friday: weeklySummary[5],
      Saturday: weeklySummary[6],
    );

    mybardata.initializeBardata();

    return BarChart(
      BarChartData(
        maxY: 200,
        minY: 0,
        gridData: FlGridData(show:false),
        borderData: FlBorderData(show: false),
        
        barGroups: mybardata.bardata.asMap().entries.map(
          (entry) {
            int index = entry.key;
            double value = entry.value.y;

            return BarChartGroupData(
              x: index.toInt(),
              barRods: [BarChartRodData(y: value)],
            );
          },
        ).toList(),
        titlesData: FlTitlesData(
         topTitles: SideTitles(showTitles: false),
          leftTitles:SideTitles(showTitles: false),
          rightTitles:SideTitles(showTitles: false),

          
          bottomTitles: SideTitles(
            showTitles: true,
            getTitles: (value) {
              int index = value.toInt();
              if (index >= 0 && index < daysOfWeek.length) {
                return daysOfWeek[index];
              }
              return '';
            },
            rotateAngle: 0, // Adjust the angle of x-axis labels
            margin: 10, // Margin to avoid overlapping
          ),
        ),
      ),
    );
  }
}