class StatsDetailsModel {
  int? id;
  String? statsName;
  String? statsValue;

  StatsDetailsModel({this.id, this.statsName, this.statsValue});

  StatsDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statsName = json['stats_name'];
    statsValue = json['stats_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['stats_name'] = statsName;
    data['stats_value'] = statsValue;
    return data;
  }
}
