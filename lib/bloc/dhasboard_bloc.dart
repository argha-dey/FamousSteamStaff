import 'package:famous_steam_staff/model/dashboard_model.dart';
import 'package:famous_steam_staff/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class DashboardBloc {
  final _dashboard = PublishSubject<DashboardModel>();
  final _repository = Repository();
  Stream<DashboardModel> get dashboardStream => _dashboard.stream;

  Future dashboardBlocSink() async {
    final DashboardModel model = await _repository.ondashboard();
    _dashboard.sink.add(model);
  }

  void dispose() {
    _dashboard.close();
  }
}

final dashboardBloc = DashboardBloc();
