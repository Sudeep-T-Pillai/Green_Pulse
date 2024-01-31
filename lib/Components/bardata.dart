import 'package:green_pulse/Components/Individualbardata.dart';

class Bardata {
  final double Sunday;
  final double Monday;
  final double Tuesday;
  final double Wednesday;
  final double Thursday;
  final double Friday;
  final double Saturday;

  Bardata({
    required this.Sunday,
    required this.Monday,
    required this.Tuesday,
    required this.Wednesday,
    required this.Thursday,
    required this.Friday,
    required this.Saturday,
  });

  List<IndividualBardata> bardata = [];

void initializeBardata() {
  bardata = [
    IndividualBardata(x: 0, y: Sunday),
    IndividualBardata(x: 0, y: Monday),
    IndividualBardata(x: 0, y: Tuesday),
    IndividualBardata(x: 0, y: Wednesday),
    IndividualBardata(x: 0, y: Thursday),
    IndividualBardata(x: 0, y: Friday),
    IndividualBardata(x: 0, y: Saturday),
  ];
 }
}


