import 'package:flutter/material.dart';
import 'package:green_pulse/navigationbar.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
      ),
      body: const Center(
        child: Text('Analytics Content'),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}