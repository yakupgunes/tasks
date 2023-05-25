import 'package:flutter/material.dart';
import 'package:kolaypara/src/constants/text_strings.dart';

import 'section_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionWidget(
              title: tSectionWidgetTitle1,
              value: tSectionWidgetValue1,
              color: Colors.black,
            ),
            SizedBox(height: 20),
            SectionWidget(
              title: tSectionWidgetTitle2,
              value: tSectionWidgetValue2,
              color: Colors.black,
            ),
            SizedBox(height: 20),
            SectionWidget(
              title: tSectionWidgetTitle3,
              value: tSectionWidgetValue3,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
