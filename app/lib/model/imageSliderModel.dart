class ImageSliderModel {
  int? id;
  String? pictures;

  ImageSliderModel({this.id, this.pictures});

  ImageSliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pictures = json['pictures'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pictures'] = pictures;
    return data;
  }
}
