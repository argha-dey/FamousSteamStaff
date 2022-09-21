
import 'package:famous_steam_staff/model/servicedetail_model.dart';
import 'package:famous_steam_staff/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class Servicedetailbloc {
  final _servicedetail = PublishSubject<ServicedetailModel>();
  final _repository = Repository();

  Stream<ServicedetailModel> get servicedetailstream =>
      _servicedetail.stream;

  Future servicedetailstreamsink(String orderid, String lang) async {
    final ServicedetailModel Model =
        await _repository.onservicedetail(orderid, lang);
    _servicedetail.sink.add(Model);
  }

  void dispose() {
    _servicedetail.close();
  }
}

final servicedetailbloc = Servicedetailbloc();
