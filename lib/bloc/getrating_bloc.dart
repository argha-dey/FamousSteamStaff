import 'package:famous_steam_staff/model/getrating_model.dart';
import 'package:famous_steam_staff/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class Getratingbloc {
  final _getrating = PublishSubject<ServiceRatingModel>();
  final _repository = Repository();

  Stream<ServiceRatingModel> get getratingstream => _getrating.stream;

  Future getratingstreamsink(String author_id,String model_id,String order_id,String review,String rating) async {
    final ServiceRatingModel Model = await _repository.getrating(author_id, model_id, order_id, review, rating);
    _getrating.sink.add(Model);
  }

  void dispose() {
    _getrating.close();
  }
}

final getratingbloc = Getratingbloc();

/*
class Getratingbloc {
  final _getrating = PublishSubject<GetratingModel>();
  final _repository = Repository();

  Stream<GetratingModel> get getratingstream => _getrating.stream;

  Future getratingstreamsink() async {
    final GetratingModel Model = await _repository.getrating();
    _getrating.sink.add(Model);
  }

  void dispose() {
    _getrating.close();
  }
}

final getratingbloc = Getratingbloc();*/
