class MembersModel {
  int? membershipID;
  String? name;
  String? pic;
  String? socialsite1;
  String? socialsite2;
  String? socialsite3;
  int? membershipYear;
  int? categoryType;

  MembersModel(
      {this.membershipID,
      this.name,
      this.pic,
      this.socialsite1,
      this.socialsite2,
      this.socialsite3,
      this.membershipYear,
      this.categoryType});

  MembersModel.fromJson(Map<String, dynamic> json) {
    membershipID = json['MembershipID'];
    name = json['name'];
    pic = json['pic'];
    socialsite1 = json['socialsite1'];
    socialsite2 = json['socialsite2'];
    socialsite3 = json['socialsite3'];
    membershipYear = json['MembershipYear'];
    categoryType = json['CategoryType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['MembershipID'] = membershipID;
    data['name'] = name;
    data['pic'] = pic;
    data['socialsite1'] = socialsite1;
    data['socialsite2'] = socialsite2;
    data['socialsite3'] = socialsite3;
    data['MembershipYear'] = membershipYear;
    data['CategoryType'] = categoryType;
    return data;
  }
}
