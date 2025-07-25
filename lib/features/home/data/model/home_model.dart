class HomeData {
  String? text;
  DateTime? time;
  List<GroupData>? groups;

  HomeData({this.groups});

  HomeData.fromJson(Map<String, dynamic> json) {
    text = json['timers'][0]['text'];
    time = DateTime.tryParse(json['timers'][0]['time'] ?? '');

    if (json['groups'] != null) {
      groups = List<GroupData>.from(
        json['groups'].map((e) => GroupData.fromJson(e)),
      );
    } else {
      groups = [];
    }
  }
}

class GroupData {
  int? id;
  String? name;
  int? countSelect;
  String? comments;
  String? img;
  String? notes;
  GroupData({
    this.id,
    this.name,
    this.countSelect,
    this.img,
    this.comments,
    this.notes,
  });

  GroupData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countSelect = json['count_select'];
    if (json['img'] != null) img = json['img'];
    notes = json['notes'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['count_select'] = countSelect;
    data['img'] = img;
    data['notes'] = notes;
    data['comments'] = comments;
    return data;
  }
}
