class WpSendCodeModel {
  WpSendCodeModel({
      this.message, 
      this.verificationCodeValidUntil,});

  WpSendCodeModel.fromJson(dynamic json) {
    message = json['message'];
    verificationCodeValidUntil = json['verification_code_valid_until'];
  }
  String? message;
  String? verificationCodeValidUntil;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['verification_code_valid_until'] = verificationCodeValidUntil;
    return map;
  }

}