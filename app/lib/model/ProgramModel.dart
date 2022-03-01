class ProgramsModel {
  int? id;
  String? title;
  String? programIcons;

  ProgramsModel({this.id, this.title, this.programIcons});

  ProgramsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    programIcons = json['program_icons'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['program_icons'] = programIcons;
    return data;
  }
}
