/// message : "The password must be at least 5 characters."
/// errors : {}

class CodeUpdateModel {
  CodeUpdateModel({
      String? message,
      dynamic? errors,}){
    _message = message;
    _errors = errors;
}

  CodeUpdateModel.fromJson(dynamic json) {
    _message = json['message'];
    _errors = json['errors'];
  }
  String? _message;
  dynamic? _errors;
CodeUpdateModel copyWith({  String? message,
  dynamic errors,
}) => CodeUpdateModel(  message: message ?? _message,
  errors: errors ?? _errors,
);
  String? get message => _message;
  dynamic? get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['errors'] = _errors;
    return map;
  }

}