class StatsModel {
  int? id;
  String? statsName;
  String? statsValue;
  String? statsIcons;

  StatsModel({this.id, this.statsName, this.statsValue, this.statsIcons});

  StatsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statsName = json['stats_name'];
    statsValue = json['stats_value'];
    statsIcons = json['stats_icons'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['stats_name'] = statsName;
    data['stats_value'] = statsValue;
    data['stats_icons'] = statsIcons;
    return data;
  }
}
