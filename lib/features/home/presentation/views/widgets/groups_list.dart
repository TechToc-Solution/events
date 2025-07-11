import 'package:events/core/utils/app_localizations.dart';
import 'package:events/core/utils/colors.dart';
import 'package:events/features/group_details/presentation/view/group_detail_page.dart';
import 'package:events/features/home/data/model/home_model.dart';
import 'package:flutter/material.dart';

class GroupsList extends StatelessWidget {
  const GroupsList({super.key, required this.data});

  final HomeData data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: data.groups?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GroupDetailPage(
                  groupName: data.groups?[index].name ?? "",
                  groupId: data.groups?[index].id ?? 0,
                  numOfSelection: data.groups?[index].countSelect ?? 0,
                ),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 4),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 1,
                ),
              ],
              color: Colors.white,
              border: Border.all(color: AppColors.primaryColors, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              title: LayoutBuilder(
                builder: (context, constraints) {
                  final fontSize =
                      constraints.maxWidth /
                      ((data.groups![index].name?.length ?? 2) / 2);
                  return Text(
                    data.groups?[index].name ?? "",
                    style: TextStyle(
                      fontSize: fontSize.clamp(22, 26),
                      color: AppColors.primaryColors,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              subtitle: LayoutBuilder(
                builder: (context, constraints) {
                  int charNumber =
                      "group_hint_1".tr(context).length +
                      1 +
                      "group_hint_2".tr(context).length;
                  final fontSize = constraints.maxWidth / (charNumber / 2);
                  return Text(
                    "${"group_hint_1".tr(context)} ${data.groups?[index].countSelect ?? 0} ${"group_hint_2".tr(context)}",
                    style: TextStyle(fontSize: fontSize.clamp(10, 14)),
                  );
                },
              ),
              trailing: CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.primaryColors,
                child: Icon(Icons.person, size: 32, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
