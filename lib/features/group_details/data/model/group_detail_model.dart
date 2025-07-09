class GroupDetailModel {
  final int? id;
  final String? name;
  final int? sport;
  final int? country;
  final String? achievement;

  GroupDetailModel({this.id, this.name, this.sport, this.country, this.achievement});

  factory GroupDetailModel.fromJson(Map<String, dynamic> json) {
    return GroupDetailModel(
      id: json['id'],
      name: json['name'],
      sport: json['Sport'],
      country: json['country'],
      achievement: json['Acheivement'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'Sport': sport, 'Country': country, 'Acheivement': achievement};
  }
}
