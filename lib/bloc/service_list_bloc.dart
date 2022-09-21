import 'package:famous_steam_staff/model/service_list_model.dart';
import 'package:famous_steam_staff/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class Servicelistbloc {
  final _servicelist = PublishSubject<ServicelistModel>();
  final _repository = Repository();

  Stream<ServicelistModel> get serviceliststream => _servicelist.stream;

  Future serviceliststreamsink(String lang, String filterdate) async {
    final ServicelistModel Model =
        await _repository.onservicelist(lang, filterdate);
    _servicelist.sink.add(Model);
  }

  void dispose() {
    _servicelist.close();
  }
}

final servicelistbloc = Servicelistbloc();
