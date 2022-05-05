class ProgramsModel {
  int? programID;
  String? programName;
  String? objectives;
  String? startDate;
  String? endDate;
  String? programCoverImage;
  String? programType;
  String? programIcon;

  ProgramsModel(
      {this.programID,
      this.programName,
      this.objectives,
      this.startDate,
      this.endDate,
      this.programCoverImage,
      this.programType,
      this.programIcon});

  ProgramsModel.fromJson(Map<String, dynamic> json) {
    programID = json['ProgramID'];
    programName = json['ProgramName'];
    objectives = json['Objectives'];
    startDate = json['StartDate'];
    endDate = json['EndDate'];
    programCoverImage = json['ProgramCoverImage'];
    programType = json['ProgramType'];
    programIcon = json['ProgramIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ProgramID'] = programID;
    data['ProgramName'] = programName;
    data['Objectives'] = objectives;
    data['StartDate'] = startDate;
    data['EndDate'] = endDate;
    data['ProgramCoverImage'] = programCoverImage;
    data['ProgramType'] = programType;
    data['ProgramIcon'] = programIcon;
    return data;
  }
}
