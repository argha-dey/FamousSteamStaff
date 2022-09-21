
import 'package:famous_steam_staff/model/rating_review_list_model.dart';
import 'package:famous_steam_staff/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

import '../model/customer_rating_model.dart';

class Ratingreviewlistbloc {
  final _ratingreviewlist = PublishSubject<CustomerRatingModel>();
  final _repository = Repository();

  Stream<CustomerRatingModel> get ratingreviewstream => _ratingreviewlist.stream;

  Future ratingreviewstreamsink() async {
    final CustomerRatingModel Model = await _repository.onratingreviewlistApi();
    _ratingreviewlist.sink.add(Model);
  }

  void dispose() {
    _ratingreviewlist.close();
  }
}

final ratingreviewlistbloc = Ratingreviewlistbloc();
