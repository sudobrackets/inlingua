import 'package:inlingua/src/models/base/base_model.dart';

class LanguageListResponseModel extends BaseModel {
  List<LanguageListModel> languageList;

  LanguageListResponseModel({this.languageList});

  LanguageListResponseModel.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    if (data != null) {
      languageList = new List<LanguageListModel>();
      data.forEach((v) {
        languageList.add(new LanguageListModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.languageList != null) {
      data['languageList'] = this.languageList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LanguageListModel {
  String id;
  String language;
  String shortName;
  String bannerImage;
  String thumbnailImage;

  LanguageListModel(
      {this.id,
      this.language,
      this.shortName,
      this.bannerImage,
      this.thumbnailImage});

  LanguageListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    language = json['language'];
    shortName = json['short_name'];
    bannerImage = json['banner_image'];
    thumbnailImage = json['thumbnail_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['language'] = this.language;
    data['short_name'] = this.shortName;
    data['banner_image'] = this.bannerImage;
    data['thumbnail_image'] = this.thumbnailImage;
    return data;
  }
}
