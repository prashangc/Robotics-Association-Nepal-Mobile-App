class ProjectsModel {
  int? projectID;
  String? projectName;
  String? projectDescription;
  String? projectdate;
  String? projectPOCname;
  String? projectPOCnum;
  String? projectype;
  String? projectlink;
  String? projectTechnicalspecification;
  String? projectWhitepapers;
  String? projectCoverphoto;
  String? projectIcon;

  ProjectsModel(
      {this.projectID,
      this.projectName,
      this.projectDescription,
      this.projectdate,
      this.projectPOCname,
      this.projectPOCnum,
      this.projectype,
      this.projectlink,
      this.projectTechnicalspecification,
      this.projectWhitepapers,
      this.projectCoverphoto,
      this.projectIcon});

  ProjectsModel.fromJson(Map<String, dynamic> json) {
    projectID = json['ProjectID'];
    projectName = json['ProjectName'];
    projectDescription = json['ProjectDescription'];
    projectdate = json['Projectdate'];
    projectPOCname = json['ProjectPOCname'];
    projectPOCnum = json['ProjectPOCnum'];
    projectype = json['Projectype'];
    projectlink = json['Projectlink'];
    projectTechnicalspecification = json['ProjectTechnicalspecification'];
    projectWhitepapers = json['ProjectWhitepapers'];
    projectCoverphoto = json['ProjectCoverphoto'];
    projectIcon = json['ProjectIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ProjectID'] = projectID;
    data['ProjectName'] = projectName;
    data['ProjectDescription'] = projectDescription;
    data['Projectdate'] = projectdate;
    data['ProjectPOCname'] = projectPOCname;
    data['ProjectPOCnum'] = projectPOCnum;
    data['Projectype'] = projectype;
    data['Projectlink'] = projectlink;
    data['ProjectTechnicalspecification'] = projectTechnicalspecification;
    data['ProjectWhitepapers'] = projectWhitepapers;
    data['ProjectCoverphoto'] = projectCoverphoto;
    data['ProjectIcon'] = projectIcon;
    return data;
  }
}
