import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:green_pulse/Components/yrbardata.dart';

class YrBarChart extends StatefulWidget {
  YrBarChart({Key? key}) : super(key: key);

  @override
  State<YrBarChart> createState() => _YrBarChartState();
}

class _YrBarChartState extends State<YrBarChart> {
  @override
  Widget build(BuildContext context) {
    List<String> Listofyear = [
      '2018',
      '2019',
      '2020',
      '2021',
      '2022',
    ];

    List<double> YearlySummary = [45.0, 88.0, 44.8, 25.4, 65.4];

    YrBardata Yrbardata = YrBardata(
      y_2018: YearlySummary[0],
      y_2019: YearlySummary[1],
      y_2020: YearlySummary[2],
      y_2021: YearlySummary[3],
      y_2022: YearlySummary[4],
     
    );

    Yrbardata.initializeBardata();

    return BarChart(
      BarChartData(
        maxY: 200,
        minY: 0,
        gridData: FlGridData(show:false),
        borderData: FlBorderData(show: false),
        
        barGroups: Yrbardata.bardata.asMap().entries.map(
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
              if (index >= 0 && index < YearlySummary.length) {
                return Listofyear[index];
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