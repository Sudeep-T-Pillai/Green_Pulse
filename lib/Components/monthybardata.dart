import 'package:green_pulse/Components/Individualbardata.dart';

class MoBardata {
  final double Jan;
  final double Feb;
  final double Mar;
  final double Apr;
  final double May;
  final double Jun;
  final double July;
  final double Aug;
  final double Sep;
  final double Oct;
  final double Nov;
  final double Dec;

  MoBardata({
    required this.Jan,
    required this.Feb,
    required this.Mar,
    required this.Apr,
    required this.May,
    required this.Jun,
    required this.July,
    required this.Aug,
    required this.Sep,
    required this.Oct,
    required this.Nov,
    required this.Dec,
  });

  List<IndividualBardata> bardata = [];

void initializeBardata() {
  bardata = [
    IndividualBardata(x: 0, y: Jan),
    IndividualBardata(x: 1, y: Feb),
    IndividualBardata(x: 2, y: Mar),
    IndividualBardata(x: 3, y: Apr),
    IndividualBardata(x: 4, y: May),
    IndividualBardata(x: 5, y: Jun),
    IndividualBardata(x: 6, y: July),
    IndividualBardata(x: 7, y: Aug),
    IndividualBardata(x: 8, y: Sep),
    IndividualBardata(x: 9, y: Oct),
    IndividualBardata(x: 10, y: Nov),
    IndividualBardata(x: 11, y: Dec),
  ];
 }
}