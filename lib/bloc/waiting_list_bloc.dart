import 'package:famous_steam_staff/model/waiting_list_model.dart';
import 'package:famous_steam_staff/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class WaitingListBloc {
  final _waitinglist = PublishSubject<WaitingListModel>();
  final _repository = Repository();
  Stream<WaitingListModel> get waitinglistStream => _waitinglist.stream;

  Future waitinglistBlocSink() async {
    final WaitingListModel model = await _repository.onWaitingList();
    _waitinglist.sink.add(model);
  }

  void dispose() {
    _waitinglist.close();
  }
}

final waitingListBloc = WaitingListBloc();
