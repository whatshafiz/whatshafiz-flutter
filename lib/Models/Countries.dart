class Countries {
  Countries({
    this.id,
    this.iso,
    this.name,
    this.phoneCode,
  });

  ///custom comparing function to check if two users are equal
  bool isEqual(Countries model) {
    return this.id == model.id;
  }

  @override
  String toString() => name!;

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ${this.name}';
  }

  ///this method will prevent the override of toString
  bool userFilterByCreationDate(String filter) {
    return this.name.toString().contains(filter);
  }

  Countries.fromJson(dynamic json) {
    id = json['id'];
    iso = json['iso'];
    name = json['name'];
    phoneCode = json['phone_code'];
  }

  int? id;
  String? iso;
  String? name;
  String? phoneCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['iso'] = iso;
    map['name'] = name;
    map['phone_code'] = phoneCode;
    return map;
  }
}
