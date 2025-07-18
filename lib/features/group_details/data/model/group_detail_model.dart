class GroupDetailModel {
  final int? id;
  final String? name;
  final String? sport;
  final String? country;
  final String? achievement;
  final String? img;

  GroupDetailModel({
    this.id,
    this.name,
    this.sport,
    this.country,
    this.achievement,
    this.img,
  });

  factory GroupDetailModel.fromJson(Map<String, dynamic> json) {
    return GroupDetailModel(
      id: json['id'],
      name: json['name'],
      sport: json['Sport'],
      country: json['Country'],
      achievement: json['Acheivement'],
      img: json['img'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'Sport': sport,
      'Country': country,
      'Acheivement': achievement,
      'img': img,
    };
  }
}
