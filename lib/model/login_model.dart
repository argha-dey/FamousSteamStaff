class LoginModel {
  dynamic tokenType;
  Data? data;
  dynamic accessToken;
  dynamic message;

  LoginModel({this.tokenType, this.data, this.accessToken, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    tokenType = json['token_type'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    accessToken = json['access_token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token_type'] = this.tokenType;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['access_token'] = this.accessToken;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  dynamic staffId;
  dynamic profileImage;
  dynamic carDriverId;
  StationId? stationId;
  dynamic name;
  dynamic mobile;
  dynamic email;
  dynamic address;
  dynamic status;

  Data(
      {this.staffId,
        this.profileImage,
        this.carDriverId,
        this.stationId,
        this.name,
        this.mobile,
        this.email,
        this.address,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    staffId = json['staff_id'];
    profileImage = json['profile_image'];
    carDriverId = json['car_driver_id'];
    stationId = json['station_id'] != null
        ? new StationId.fromJson(json['station_id'])
        : null;
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    address = json['address'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['staff_id'] = this.staffId;
    data['profile_image'] = this.profileImage;
    data['car_driver_id'] = this.carDriverId;
    if (this.stationId != null) {
      data['station_id'] = this.stationId!.toJson();
    }
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['address'] = this.address;
    data['status'] = this.status;
    return data;
  }
}

class StationId {
  dynamic stationId;
  dynamic nameEng;
  dynamic nameAr;
  dynamic image;
  dynamic status;

  StationId(
      {this.stationId, this.nameEng, this.nameAr, this.image, this.status});

  StationId.fromJson(Map<String, dynamic> json) {
    stationId = json['station_id'];
    nameEng = json['name_eng'];
    nameAr = json['name_ar'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['station_id'] = this.stationId;
    data['name_eng'] = this.nameEng;
    data['name_ar'] = this.nameAr;
    data['image'] = this.image;
    data['status'] = this.status;
    return data;
  }
}