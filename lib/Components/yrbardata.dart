import 'package:green_pulse/Components/Individualbardata.dart';

class YrBardata {
  final double y_2018;
  final double y_2019;
  final double y_2020;
  final double y_2021;
  final double y_2022;
 

  YrBardata({
    required this.y_2018,
    required this.y_2019,
    required this.y_2020,
    required this.y_2021,
    required this.y_2022,
    
  });

  List<IndividualBardata> bardata = [];

void initializeBardata() {
  bardata = [
    IndividualBardata(x: 0, y: y_2018),
    IndividualBardata(x: 1, y: y_2019),
    IndividualBardata(x: 2, y: y_2020),
    IndividualBardata(x: 3, y: y_2021),
    IndividualBardata(x: 4, y: y_2022),
   
  ];
 }
}