class ForgotPasswordModel {
  dynamic password;
  dynamic message;


  ForgotPasswordModel({this.password, this.message});

  ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    message = json['message'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['message'] = this.message;

    return data;
  }
}

