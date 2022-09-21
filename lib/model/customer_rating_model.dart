class CustomerRatingModel {
  List<Data>? data;
  dynamic total;

  CustomerRatingModel({this.data, this.total, });

  CustomerRatingModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;

    return data;
  }
}

class Data {
  int? id;

  int? modelId;

  dynamic authorId;
  dynamic orderId;
  dynamic review;
  dynamic rating;
  dynamic activeStatus;

  Order? order;

  Data(
      {this.id,

        this.modelId,

        this.authorId,
        this.orderId,
        this.review,
        this.rating,
        this.activeStatus,

        this.order});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    modelId = json['model_id'];

    authorId = json['author_id'];
    orderId = json['order_id'];
    review = json['review'];
    rating = json['rating'];
    activeStatus = json['active_status'];

    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['model_id'] = this.modelId;

    data['author_id'] = this.authorId;
    data['order_id'] = this.orderId;
    data['review'] = this.review;
    data['rating'] = this.rating;
    data['active_status'] = this.activeStatus;

    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    return data;
  }
}

class Order {
  int? id;
  String? orderDisplayId;


  Order(
      {this.id,
        this.orderDisplayId,
});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderDisplayId = json['order_display_id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    return data;
  }
}

