class GetStatusModel {
  List<StepData>? data;

  GetStatusModel({this.data, });

  GetStatusModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <StepData>[];
      json['data'].forEach((v) {
        data!.add(new StepData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class StepData {
  int? staffOrderStatusId;
  String? name;
  String? updateButton;
  String? jobStatusEng;
  String? image;

  StepData(
      {this.staffOrderStatusId,
        this.name,
        this.updateButton,
        this.jobStatusEng,
        this.image});

  StepData.fromJson(Map<String, dynamic> json) {
    staffOrderStatusId = json['staff_order_status_id'];
    name = json['name'];
    updateButton = json['update_button'];
    jobStatusEng = json['job_status_eng'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['staff_order_status_id'] = this.staffOrderStatusId;
    data['name'] = this.name;
    data['update_button'] = this.updateButton;
    data['job_status_eng'] = this.jobStatusEng;
    data['image'] = this.image;
    return data;
  }
}
