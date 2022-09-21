class RatingreviewListModel {
  bool? success;
  List<Rating>? rating;
  String? count;

  RatingreviewListModel({this.success, this.rating, this.count});

  RatingreviewListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['rating'] != null) {
      rating = <Rating>[];
      json['rating'].forEach((v) {
        rating!.add(Rating.fromJson(v));
      });
    }
    count = json['count'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (rating != null) {
      data['rating'] = rating!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class Rating {
  String? ratingReview;
  String? ratingStar;

  Rating({this.ratingReview, this.ratingStar});

  Rating.fromJson(Map<String, dynamic> json) {
    ratingReview = json['rating_review'];
    ratingStar = json['rating_star'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating_review'] = ratingReview;
    data['rating_star'] = ratingStar;
    return data;
  }
}
