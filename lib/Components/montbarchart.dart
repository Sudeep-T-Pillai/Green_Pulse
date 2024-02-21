import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:green_pulse/Components/monthybardata.dart';

class MoBarChart extends StatefulWidget {
  MoBarChart({Key? key}) : super(key: key);

  @override
  State<MoBarChart> createState() => _MoBarChartState();
}

class _MoBarChartState extends State<MoBarChart> {
  @override
  Widget build(BuildContext context) {
    List<String> Monthsofyear = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'July',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    List<double> MonthySummary = [45.0, 88.0, 44.8, 25.4, 65.4, 75.8, 89.7,55.0,99.0,15.9,54.89,98.99];

    MoBardata MObardata = MoBardata(
      Jan: MonthySummary[0],
      Feb: MonthySummary[1],
      Mar: MonthySummary[2],
      Apr: MonthySummary[3],
      May: MonthySummary[4],
      Jun: MonthySummary[5],
      July: MonthySummary[6],
      Aug: MonthySummary[7],
      Sep: MonthySummary[8],
      Oct: MonthySummary[9],
      Nov: MonthySummary[10],
      Dec: MonthySummary[11],
    );

    MObardata.initializeBardata();

    return BarChart(
      BarChartData(
        maxY: 200,
        minY: 0,
        gridData: FlGridData(show:false),
        borderData: FlBorderData(show: false),
        
        barGroups: MObardata.bardata.asMap().entries.map(
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
              if (index >= 0 && index < Monthsofyear.length) {
                return Monthsofyear[index];
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