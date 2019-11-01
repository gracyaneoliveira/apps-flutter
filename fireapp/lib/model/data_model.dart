class DataModel {
  String id;
  String name;
  Banner banner;

  DataModel({this.id, this.name, this.banner});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    banner =
    json['banner'] != null ? new Banner.fromJson(json['banner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.banner != null) {
      data['banner'] = this.banner.toJson();
    }
    return data;
  }
}

class Banner {
  String id;
  String url;
  String image;

  Banner({this.id, this.url, this.image});

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['image'] = this.image;
    return data;
  }
}
