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
    IndividualBardata(x: 1, y: Monday),
    IndividualBardata(x: 2, y: Tuesday),
    IndividualBardata(x: 3, y: Wednesday),
    IndividualBardata(x: 4, y: Thursday),
    IndividualBardata(x: 5, y: Friday),
    IndividualBardata(x: 6, y: Saturday),
  ];
 }
}