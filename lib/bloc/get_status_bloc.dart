import 'package:famous_steam_staff/model/get_status_model.dart';
import 'package:famous_steam_staff/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class GetStatusBloc {
  final _getstatus = PublishSubject<GetStatusModel>();
  final _repository = Repository();
  Stream<GetStatusModel> get getStatusStream => _getstatus.stream;

  Future getStatusBlocSink(String lang, String orderid) async {
    final GetStatusModel model = await _repository.onGetStatus(lang, orderid);
    _getstatus.sink.add(model);
  }

  void dispose() {
    _getstatus.close();
  }
}

final getStatusBloc = GetStatusBloc();
