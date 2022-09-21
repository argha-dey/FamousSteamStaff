import 'package:famous_steam_staff/model/get_staff_model.dart';
import 'package:famous_steam_staff/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class GetstaffBloc {
  final _getstaff = PublishSubject<GetstaffModel>();
  final _repository = Repository();
  Stream<GetstaffModel> get getstaffStream => _getstaff.stream;

  Future getstaffBlocSink() async {
    final GetstaffModel model = await _repository.ongetstaff();
    _getstaff.sink.add(model);
  }

  void dispose() {
    _getstaff.close();
  }
}

final getstaffBloc = GetstaffBloc();
