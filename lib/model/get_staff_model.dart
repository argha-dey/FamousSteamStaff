class GetstaffModel {
  Data? data;


  GetstaffModel({this.data});

  GetstaffModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//    debug = json['debug'] != null ? new Debug.fromJson(json['debug']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }

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
  dynamic name;
  dynamic image;
  dynamic status;

  StationId({this.stationId, this.name, this.image, this.status});

  StationId.fromJson(Map<String, dynamic> json) {
    stationId = json['station_id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['station_id'] = this.stationId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['status'] = this.status;
    return data;
  }
}


class Database {
  dynamic total;
  List<Items>? items;

  Database({this.total, this.items});

  Database.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  dynamic connection;
  dynamic query;
  dynamic time;

  Items({this.connection, this.query, this.time});

  Items.fromJson(Map<String, dynamic> json) {
    connection = json['connection'];
    query = json['query'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['connection'] = this.connection;
    data['query'] = this.query;
    data['time'] = this.time;
    return data;
  }
}


