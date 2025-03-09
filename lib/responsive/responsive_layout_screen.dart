import 'package:flutter/material.dart';

class ResponsiveLayoutScreen extends StatelessWidget {
  const ResponsiveLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth <= 750){}
      },

    );
  }
}