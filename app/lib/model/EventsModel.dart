class EventsModel {
  int? eventID;
  String? eventName;
  String? eventDescription;
  String? eventdate;
  String? eventype;
  String? eventIcon;

  EventsModel(
      {this.eventID,
      this.eventName,
      this.eventDescription,
      this.eventdate,
      this.eventype,
      this.eventIcon});

  EventsModel.fromJson(Map<String, dynamic> json) {
    eventID = json['EventID'];
    eventName = json['EventName'];
    eventDescription = json['EventDescription'];
    eventdate = json['Eventdate'];
    eventype = json['eventype'];
    eventIcon = json['EventIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['EventID'] = eventID;
    data['EventName'] = eventName;
    data['EventDescription'] = eventDescription;
    data['Eventdate'] = eventdate;
    data['eventype'] = eventype;
    data['EventIcon'] = eventIcon;
    return data;
  }
}
