

class CopyDetailsModel {
  int? id;
  String? colorName;
  String? time;


  CopyDetailsModel({this.id, this.colorName, this.time});

  CopyDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    colorName = json['colorName'];
    time = json["time"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['colorName'] = colorName;
    data['time'] = time;
    return data;
  }
}