import 'package:flutter/material.dart';


class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        Expanded(
          child: ListView(
            children: [SizedBox(height: 8), SizedBox(height: 16)],
          ),
        ),
      ],
    );
  }
}
