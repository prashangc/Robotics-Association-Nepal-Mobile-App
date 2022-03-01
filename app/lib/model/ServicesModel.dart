class ServicesModel {
  int? id;
  String? title;
  String? icons;

  ServicesModel({this.id, this.title, this.icons});

  ServicesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    icons = json['icons'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['icons'] = icons;
    return data;
  }
}
