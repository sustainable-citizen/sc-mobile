import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  final Color color;

  DashboardWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
