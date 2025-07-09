import 'package:events/core/utils/app_localizations.dart';
import 'package:events/core/utils/colors.dart';
import 'package:events/features/home/data/model/home_model.dart';
import 'package:events/features/home/presentation/views/widgets/countdown_timer_widget.dart';
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: data.groups?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: AppColors.primaryColors,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      title: Text(
                        data.groups?[index].name ?? "",
                        style: TextStyle(
                          fontSize: 26,
                          color: AppColors.primaryColors,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "${"group_hint_1".tr(context)} ${data.groups?[index].countSelect ?? 0} ${"group_hint_2".tr(context)}",
                      ),
                      trailing: CircleAvatar(
                        radius: 28,
                        backgroundColor: AppColors.primaryColors,
                        child: Icon(
                          Icons.person,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
