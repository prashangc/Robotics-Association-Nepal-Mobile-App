class ServicesModel {
  int? servicesID;
  String? serviceName;
  String? serviceDescription;
  String? serviceCoverImage;
  String? servicetype;
  String? serviceIcon;

  ServicesModel(
      {this.servicesID,
      this.serviceName,
      this.serviceDescription,
      this.serviceCoverImage,
      this.servicetype,
      this.serviceIcon});

  ServicesModel.fromJson(Map<String, dynamic> json) {
    servicesID = json['ServicesID'];
    serviceName = json['ServiceName'];
    serviceDescription = json['ServiceDescription'];
    serviceCoverImage = json['ServiceCoverImage'];
    servicetype = json['servicetype'];
    serviceIcon = json['serviceIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ServicesID'] = servicesID;
    data['ServiceName'] = serviceName;
    data['ServiceDescription'] = serviceDescription;
    data['ServiceCoverImage'] = serviceCoverImage;
    data['servicetype'] = servicetype;
    data['serviceIcon'] = serviceIcon;
    return data;
  }
}
