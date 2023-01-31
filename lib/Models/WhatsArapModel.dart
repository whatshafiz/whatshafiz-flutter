class WhatsArapModel {
  int? id;
  String? name;
  String? slug;
  dynamic? summary;
  String? text;
  String? createdAt;
  String? updatedAt;

  WhatsArapModel(
      {this.id,
      this.name,
      this.slug,
      this.summary,
      this.text,
      this.createdAt,
      this.updatedAt});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['summary'] = summary;
    map['text'] = text;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

  WhatsArapModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    summary = json['summary'];
    text = json['text'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
