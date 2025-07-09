class HomeData {
  List<GroupData>? groups;

  HomeData({this.groups});

  HomeData.fromJson(List<dynamic> jsonList) {
    groups = <GroupData>[];
    if (jsonList.isNotEmpty) {
      groups = jsonList.map((e) => GroupData.fromJson(e)).toList();
    }
  }
}

class GroupData {
  int? id;
  String? name;
  int? countSelect;

  GroupData({this.id, this.name, this.countSelect});

  GroupData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countSelect = json['count_select'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['count_select'] = countSelect;
    return data;
  }
}
