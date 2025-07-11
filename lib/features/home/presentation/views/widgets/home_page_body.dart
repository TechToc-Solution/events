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
    return Expanded(
      child: ListView(
        children: [
          SizedBox(height: 12),
          HomeTitle(),
          SizedBox(height: 12),
          CountdownTimerWidget(),
          SizedBox(height: 12),
          GroupsList(data: data),
        ],
      ),
    );
  }
}
