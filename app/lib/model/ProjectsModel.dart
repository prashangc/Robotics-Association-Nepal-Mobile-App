class ProjectsModel {
  int? id;
  String? title;
  String? projectIcons;

  ProjectsModel({this.id, this.title, this.projectIcons});

  ProjectsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    projectIcons = json['project_icons'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['project_icons'] = projectIcons;
    return data;
  }
}
