class ApiModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  ApiModel(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

//  factory ApiModel.fromJson(json).fromJson(dynamic json) {
//    return ApiModel.fromJson(json['albumId'] as String, json['age'] as int);
//  }

}
