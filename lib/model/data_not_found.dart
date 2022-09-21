class DataNotFoundModel {
  bool? success;
  String? error;
  String? message;

  DataNotFoundModel({this.success, this.error,this.message});

  DataNotFoundModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = success;
    data['error'] = error;
    data['message'] = message;
    return data;
  }
}
