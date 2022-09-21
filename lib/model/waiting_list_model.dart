class WaitingListModel {
  bool? success;
  List<WaitingServices>? waitingServices;
  String? waitingServicesTotal;

  WaitingListModel(
      {this.success, this.waitingServices, this.waitingServicesTotal});

  WaitingListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['waiting_services'] != null) {
      waitingServices = <WaitingServices>[];
      json['waiting_services'].forEach((v) {
        waitingServices!.add(WaitingServices.fromJson(v));
      });
    }
    waitingServicesTotal = json['waiting_services_total'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (waitingServices != null) {
      data['waiting_services'] =
          waitingServices!.map((v) => v.toJson()).toList();
    }
    data['waiting_services_total'] = waitingServicesTotal;
    return data;
  }
}

class WaitingServices {
  String? id;
  String? serviceNo;
  String? status;

  WaitingServices({this.id, this.serviceNo, this.status});

  WaitingServices.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    serviceNo = json['service_no'].toString();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['service_no'] = serviceNo;
    data['status'] = status;
    return data;
  }
}
