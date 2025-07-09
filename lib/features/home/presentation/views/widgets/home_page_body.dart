import 'package:events/features/home/data/model/home_model.dart';
import 'package:events/features/home/presentation/views/widgets/countdown_timer_widget.dart';
import 'package:events/features/home/presentation/views/widgets/groups_list.dart';
import 'package:events/features/home/presentation/views/widgets/home_title.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key, required this.data});
  final HomeData data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        Expanded(
          child: ListView(
            children: [
              HomeTitle(),
              SizedBox(height: 8),
              CountdownTimerWidget(),
              SizedBox(height: 8),
              GroupsList(data: data),
            ],
          ),
        ),
      ],
    );
  }
}
