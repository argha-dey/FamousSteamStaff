class ServiceRatingModel {
  String? message;

  ServiceRatingModel({this.message,});

  ServiceRatingModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;

    return data;
  }
}


class Database {
  int? total;
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
  String? connection;
  String? query;
  double? time;

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


class Hit {
  List<String>? keys;
  int? total;

  Hit({this.keys, this.total});

  Hit.fromJson(Map<String, dynamic> json) {
    keys = json['keys'].cast<String>();
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keys'] = this.keys;
    data['total'] = this.total;
    return data;
  }
}


class Profiling {
  String? event;
  double? time;

  Profiling({this.event, this.time});

  Profiling.fromJson(Map<String, dynamic> json) {
    event = json['event'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event'] = this.event;
    data['time'] = this.time;
    return data;
  }
}

class Memory {
  int? usage;
  int? peak;

  Memory({this.usage, this.peak});

  Memory.fromJson(Map<String, dynamic> json) {
    usage = json['usage'];
    peak = json['peak'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usage'] = this.usage;
    data['peak'] = this.peak;
    return data;
  }
}
