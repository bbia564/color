class AllColors {
  String? name;
  String? titleColorName;
  List<ColorsSubModel>? subColors;

  AllColors({this.name, this.titleColorName, this.subColors});

  AllColors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    titleColorName = json["titleColorName"];
    subColors = <ColorsSubModel>[];
    if (json['subColors'] != null) {
      json['subColors'].forEach((v) {
        subColors!.add(ColorsSubModel.fromJson(v));
      });
    }
  }
}

class ColorsSubModel {
  List? colors;
  ColorsSubModel({this.colors});

  ColorsSubModel.fromJson(Map<String, dynamic> json) {
    colors = json['colors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['colors'] = colors;
    return data;
  }
}
