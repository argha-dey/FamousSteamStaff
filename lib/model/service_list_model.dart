/*
class ServicelistModel {
  List<Data>? data;

  ServicelistModel({this.data, });

  ServicelistModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  dynamic orderId;
  dynamic orderDisplayId;
  Category? category;
  Brand? brand;
  CarSize? carSize;
  CarModel? carModel;
  dynamic appointmentDate;
  dynamic timeslotId;
  dynamic slotStartTime;
  dynamic slotEndTime;
  Package? package;
  Vehicle? vehicle;
  dynamic remark;
  Staff? staff;
  dynamic entryFrom;
  List<ExtraService>? extraService;
  dynamic totalExtraServicePrice;
  dynamic timeDuration;
  dynamic pickupAddress;
  UserAddress? userAddress;
  dynamic staffStatus;
  dynamic orderStatus;
  dynamic paymentStatus;
  dynamic paymentMode;
  dynamic paymentDate;
  dynamic subTotal;
  dynamic tax;
  dynamic totalAmount;
  Rating? rating;

  Data(
      {this.orderId,
        this.orderDisplayId,
        this.category,
        this.brand,
        this.carSize,
        this.carModel,
        this.appointmentDate,
        this.timeslotId,
        this.slotStartTime,
        this.slotEndTime,
        this.package,
        this.vehicle,
        this.remark,
        this.staff,
        this.entryFrom,
        this.extraService,
        this.totalExtraServicePrice,
        this.timeDuration,
        this.pickupAddress,
        this.userAddress,
        this.staffStatus,
        this.orderStatus,
        this.paymentStatus,
        this.paymentMode,
        this.paymentDate,
        this.subTotal,
        this.tax,
        this.totalAmount,
        this.rating});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderDisplayId = json['order_display_id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    carSize = json['car_size'] != null
        ? new CarSize.fromJson(json['car_size'])
        : null;
    carModel = json['car_model'] != null
        ? new CarModel.fromJson(json['car_model'])
        : null;
    appointmentDate = json['appointment_date'];
    timeslotId = json['timeslot_id'];
    slotStartTime = json['slot_start_time'];
    slotEndTime = json['slot_end_time'];
    package =
    json['package'] != null ? new Package.fromJson(json['package']) : null;
    vehicle =
    json['vehicle'] != null ? new Vehicle.fromJson(json['vehicle']) : null;
    remark = json['remark'];
    staff = json['staff'] != null ? new Staff.fromJson(json['staff']) : null;
    entryFrom = json['entry_from'];
    if (json['extra_service'] != null) {
      extraService = <ExtraService>[];
      json['extra_service'].forEach((v) {
        extraService!.add(new ExtraService.fromJson(v));
      });
    }
    totalExtraServicePrice = json['total_extra_service_price'];
    timeDuration = json['time_duration'];
    pickupAddress = json['pickup_address'];
    userAddress = json['user_address'] != null
        ? new UserAddress.fromJson(json['user_address'])
        : null;
    staffStatus = json['staff_status'];
    orderStatus = json['order_status'];
    paymentStatus = json['payment_status'];
    paymentMode = json['payment_mode'];
    paymentDate = json['payment_date'];
    subTotal = json['sub_total'];
    tax = json['tax'];
    totalAmount = json['total_amount'];
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_display_id'] = this.orderDisplayId;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.carSize != null) {
      data['car_size'] = this.carSize!.toJson();
    }
    if (this.carModel != null) {
      data['car_model'] = this.carModel!.toJson();
    }
    data['appointment_date'] = this.appointmentDate;
    data['timeslot_id'] = this.timeslotId;
    data['slot_start_time'] = this.slotStartTime;
    data['slot_end_time'] = this.slotEndTime;
    if (this.package != null) {
      data['package'] = this.package!.toJson();
    }
    if (this.vehicle != null) {
      data['vehicle'] = this.vehicle!.toJson();
    }
    data['remark'] = this.remark;
    if (this.staff != null) {
      data['staff'] = this.staff!.toJson();
    }
    data['entry_from'] = this.entryFrom;
    if (this.extraService != null) {
      data['extra_service'] =
          this.extraService!.map((v) => v.toJson()).toList();
    }
    data['total_extra_service_price'] = this.totalExtraServicePrice;
    data['time_duration'] = this.timeDuration;
    data['pickup_address'] = this.pickupAddress;
    if (this.userAddress != null) {
      data['user_address'] = this.userAddress!.toJson();
    }
    data['staff_status'] = this.staffStatus;
    data['order_status'] = this.orderStatus;
    data['payment_status'] = this.paymentStatus;
    data['payment_mode'] = this.paymentMode;
    data['payment_date'] = this.paymentDate;
    data['sub_total'] = this.subTotal;
    data['tax'] = this.tax;
    data['total_amount'] = this.totalAmount;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}

class Category {
  dynamic categoryId;
  dynamic name;
  dynamic image;

  Category({this.categoryId, this.name, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class Brand {
  dynamic brandId;
  dynamic name;
  dynamic image;

  Brand({this.brandId, this.name, this.image});

  Brand.fromJson(Map<String, dynamic> json) {
    brandId = json['brand_id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand_id'] = this.brandId;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class CarSize {
  dynamic carSizeId;
  dynamic sizeName;

  CarSize({this.carSizeId, this.sizeName});

  CarSize.fromJson(Map<String, dynamic> json) {
    carSizeId = json['car_size_id'];
    sizeName = json['size_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['car_size_id'] = this.carSizeId;
    data['size_name'] = this.sizeName;
    return data;
  }
}

class CarModel {
  dynamic carModelId;
  dynamic carModelName;

  CarModel({this.carModelId, this.carModelName});

  CarModel.fromJson(Map<String, dynamic> json) {
    carModelId = json['car_model_id'];
    carModelName = json['car_model_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['car_model_id'] = this.carModelId;
    data['car_model_name'] = this.carModelName;
    return data;
  }
}

class Package {
  dynamic packageId;
  Category? category;
  CarSize? carSize;
  dynamic packageName;
  dynamic packageImage;
  dynamic packagePrice;
  dynamic packageOfferPrice;
  dynamic packageDiscount;
  dynamic timeDuration;
  dynamic showDashboard;
  List<PackageServices>? packageServices;
  dynamic packageRating;

  Package(
      {this.packageId,
        this.category,
        this.carSize,
        this.packageName,
        this.packageImage,
        this.packagePrice,
        this.packageOfferPrice,
        this.packageDiscount,
        this.timeDuration,
        this.showDashboard,
        this.packageServices,
        this.packageRating});

  Package.fromJson(Map<String, dynamic> json) {
    packageId = json['package_id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    carSize = json['car_size'] != null
        ? new CarSize.fromJson(json['car_size'])
        : null;
    packageName = json['package_name'];
    packageImage = json['package_image'];
    packagePrice = json['package_price'];
    packageOfferPrice = json['package_offer_price'];
    packageDiscount = json['package_discount'];
    timeDuration = json['time_duration'];
    showDashboard = json['show_dashboard'];
    if (json['package_services'] != null) {
      packageServices = <PackageServices>[];
      json['package_services'].forEach((v) {
        packageServices!.add(new PackageServices.fromJson(v));
      });
    }
    packageRating = json['package_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_id'] = this.packageId;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.carSize != null) {
      data['car_size'] = this.carSize!.toJson();
    }
    data['package_name'] = this.packageName;
    data['package_image'] = this.packageImage;
    data['package_price'] = this.packagePrice;
    data['package_offer_price'] = this.packageOfferPrice;
    data['package_discount'] = this.packageDiscount;
    data['time_duration'] = this.timeDuration;
    data['show_dashboard'] = this.showDashboard;
    if (this.packageServices != null) {
      data['package_services'] =
          this.packageServices!.map((v) => v.toJson()).toList();
    }
    data['package_rating'] = this.packageRating;
    return data;
  }
}

class PackageServices {
  dynamic serviceId;
  Category? category;
  CarSize? carSize;
  dynamic serviceName;
  dynamic servicePrice;
  dynamic serviceOfferPrice;
  dynamic timeDuration;
  dynamic showDashboard;

  PackageServices(
      {this.serviceId,
        this.category,
        this.carSize,
        this.serviceName,
        this.servicePrice,
        this.serviceOfferPrice,
        this.timeDuration,
        this.showDashboard});

  PackageServices.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    carSize = json['car_size'] != null
        ? new CarSize.fromJson(json['car_size'])
        : null;
    serviceName = json['service_name'];
    servicePrice = json['service_price'];
    serviceOfferPrice = json['service_offer_price'];
    timeDuration = json['time_duration'];
    showDashboard = json['show_dashboard'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.carSize != null) {
      data['car_size'] = this.carSize!.toJson();
    }
    data['service_name'] = this.serviceName;
    data['service_price'] = this.servicePrice;
    data['service_offer_price'] = this.serviceOfferPrice;
    data['time_duration'] = this.timeDuration;
    data['show_dashboard'] = this.showDashboard;
    return data;
  }
}

class Vehicle {
  dynamic userVehicleId;
  Category? category;
  Brand? brand;
  Fuel? fuel;
  CarSize? carSize;
  CarModel? carModel;

  Vehicle(
      {this.userVehicleId,
        this.category,
        this.brand,
        this.fuel,
        this.carSize,
        this.carModel});

  Vehicle.fromJson(Map<String, dynamic> json) {
    userVehicleId = json['user_vehicle_id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    fuel = json['fuel'] != null ? new Fuel.fromJson(json['fuel']) : null;
    carSize = json['car_size'] != null
        ? new CarSize.fromJson(json['car_size'])
        : null;
    carModel = json['car_model'] != null
        ? new CarModel.fromJson(json['car_model'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_vehicle_id'] = this.userVehicleId;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.fuel != null) {
      data['fuel'] = this.fuel!.toJson();
    }
    if (this.carSize != null) {
      data['car_size'] = this.carSize!.toJson();
    }
    if (this.carModel != null) {
      data['car_model'] = this.carModel!.toJson();
    }
    return data;
  }
}

class Fuel {
  dynamic fuelId;
  dynamic name;
  dynamic image;

  Fuel({this.fuelId, this.name, this.image});

  Fuel.fromJson(Map<String, dynamic> json) {
    fuelId = json['fuel_id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fuel_id'] = this.fuelId;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class Staff {
  dynamic staffId;
  dynamic profileImage;
  dynamic carDriverId;
  StationId? stationId;
  dynamic name;
  dynamic mobile;
  dynamic email;
  dynamic address;
  dynamic status;

  Staff(
      {this.staffId,
        this.profileImage,
        this.carDriverId,
        this.stationId,
        this.name,
        this.mobile,
        this.email,
        this.address,
        this.status});

  Staff.fromJson(Map<String, dynamic> json) {
    staffId = json['staff_id'];
    profileImage = json['profile_image'];
    carDriverId = json['car_driver_id'];
    stationId = json['station_id'] != null
        ? new StationId.fromJson(json['station_id'])
        : null;
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    address = json['address'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['staff_id'] = this.staffId;
    data['profile_image'] = this.profileImage;
    data['car_driver_id'] = this.carDriverId;
    if (this.stationId != null) {
      data['station_id'] = this.stationId!.toJson();
    }
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['address'] = this.address;
    data['status'] = this.status;
    return data;
  }
}

class StationId {
  dynamic stationId;
  dynamic name;
  dynamic image;
  dynamic status;

  StationId({this.stationId, this.name, this.image, this.status});

  StationId.fromJson(Map<String, dynamic> json) {
    stationId = json['station_id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['station_id'] = this.stationId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['status'] = this.status;
    return data;
  }
}

class ExtraService {
  dynamic serviceId;
  Category? category;
  CarSize? carSize;
  dynamic serviceName;
  dynamic servicePrice;
  dynamic serviceOfferPrice;
  dynamic timeDuration;
  dynamic showDashboard;

  ExtraService(
      {this.serviceId,
        this.category,
        this.carSize,
        this.serviceName,
        this.servicePrice,
        this.serviceOfferPrice,
        this.timeDuration,
        this.showDashboard});

  ExtraService.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    carSize = json['car_size'] != null
        ? new CarSize.fromJson(json['car_size'])
        : null;
    serviceName = json['service_name'];
    servicePrice = json['service_price'];
    serviceOfferPrice = json['service_offer_price'];
    timeDuration = json['time_duration'];
    showDashboard = json['show_dashboard'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.carSize != null) {
      data['car_size'] = this.carSize!.toJson();
    }
    data['service_name'] = this.serviceName;
    data['service_price'] = this.servicePrice;
    data['service_offer_price'] = this.serviceOfferPrice;
    data['time_duration'] = this.timeDuration;
    data['show_dashboard'] = this.showDashboard;
    return data;
  }
}

class UserAddress {
  dynamic userAddressId;
  dynamic userId;
  dynamic addLine1;
  dynamic addLine2;
  dynamic city;
  dynamic landmark;
  dynamic zipcode;
  dynamic status;

  UserAddress(
      {this.userAddressId,
        this.userId,
        this.addLine1,
        this.addLine2,
        this.city,
        this.landmark,
        this.zipcode,
        this.status});

  UserAddress.fromJson(Map<String, dynamic> json) {
    userAddressId = json['user_address_id'];
    userId = json['user_id'];
    addLine1 = json['add_line1'];
    addLine2 = json['add_line2'];
    city = json['city'];
    landmark = json['landmark'];
    zipcode = json['zipcode'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_address_id'] = this.userAddressId;
    data['user_id'] = this.userId;
    data['add_line1'] = this.addLine1;
    data['add_line2'] = this.addLine2;
    data['city'] = this.city;
    data['landmark'] = this.landmark;
    data['zipcode'] = this.zipcode;
    data['status'] = this.status;
    return data;
  }
}

class Rating {
  int? id;
  dynamic modelType;
  int? modelId;
  dynamic authorType;
  int? authorId;
  int? orderId;
  dynamic review;
  double? rating;
  int? activeStatus;
  dynamic createdAt;
  dynamic updatedAt;
  Null? deletedAt;

  Rating(
      {this.id,
        this.modelType,
        this.modelId,
        this.authorType,
        this.authorId,
        this.orderId,
        this.review,
        this.rating,
        this.activeStatus,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Rating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelType = json['model_type'];
    modelId = json['model_id'];
    authorType = json['author_type'];
    authorId = json['author_id'];
    orderId = json['order_id'];
    review = json['review'];
    rating = json['rating'];
    activeStatus = json['active_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['model_type'] = this.modelType;
    data['model_id'] = this.modelId;
    data['author_type'] = this.authorType;
    data['author_id'] = this.authorId;
    data['order_id'] = this.orderId;
    data['review'] = this.review;
    data['rating'] = this.rating;
    data['active_status'] = this.activeStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

*/
class ServicelistModel {
  List<Data>? data;

  ServicelistModel({this.data,});

  ServicelistModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  dynamic orderId;
  dynamic orderDisplayId;
  Category? category;
  Brand? brand;
  CarSize? carSize;
  CarModel? carModel;
  dynamic appointmentDate;
  dynamic timeslotId;
  dynamic slotStartTime;
  dynamic slotEndTime;
  Package? package;
  Vehicle? vehicle;
  dynamic remark;
  Staff? staff;
  dynamic entryFrom;
  dynamic totalExtraServicePrice;
  dynamic timeDuration;
  dynamic pickupAddress;
  UserAddress? userAddress;
  dynamic staffStatus;
  StaffOrderStatus? staffOrderStatus;
  dynamic orderStatus;
  dynamic paymentStatus;
  dynamic paymentMode;
  dynamic paymentDate;
  dynamic subTotal;
  dynamic tax;
  dynamic totalAmount;
  Rating? rating;

  Data(
      {this.orderId,
        this.orderDisplayId,
        this.category,
        this.brand,
        this.carSize,
        this.carModel,
        this.appointmentDate,
        this.timeslotId,
        this.slotStartTime,
        this.slotEndTime,
        this.package,
        this.vehicle,
        this.remark,
        this.staff,
        this.entryFrom,
        this.totalExtraServicePrice,
        this.timeDuration,
        this.pickupAddress,
        this.userAddress,
        this.staffStatus,
        this.orderStatus,
        this.paymentStatus,
        this.paymentMode,
        this.paymentDate,
        this.subTotal,
        this.tax,
        this.totalAmount,
        this.rating});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderDisplayId = json['order_display_id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    carSize = json['car_size'] != null
        ? new CarSize.fromJson(json['car_size'])
        : null;
    carModel = json['car_model'] != null
        ? new CarModel.fromJson(json['car_model'])
        : null;
    appointmentDate = json['appointment_date'];
    timeslotId = json['timeslot_id'];
    slotStartTime = json['slot_start_time'];
    slotEndTime = json['slot_end_time'];
    package =
    json['package'] != null ? new Package.fromJson(json['package']) : null;
    vehicle =
    json['vehicle'] != null ? new Vehicle.fromJson(json['vehicle']) : null;
    remark = json['remark'];
    staff = json['staff'] != null ? new Staff.fromJson(json['staff']) : null;
    entryFrom = json['entry_from'];

    totalExtraServicePrice = json['total_extra_service_price'];
    timeDuration = json['time_duration'];
    pickupAddress = json['pickup_address'];
    userAddress = json['user_address'] != null
        ? new UserAddress.fromJson(json['user_address'])
        : null;
    staffStatus = json['staff_status'];
    staffOrderStatus = json['staff_order_status'] != null
        ? new StaffOrderStatus.fromJson(json['staff_order_status'])
        : null;
    orderStatus = json['order_status'];
    paymentStatus = json['payment_status'];
    paymentMode = json['payment_mode'];
    paymentDate = json['payment_date'];
    subTotal = json['sub_total'];
    tax = json['tax'];
    totalAmount = json['total_amount'];
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_display_id'] = this.orderDisplayId;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.carSize != null) {
      data['car_size'] = this.carSize!.toJson();
    }
    if (this.carModel != null) {
      data['car_model'] = this.carModel!.toJson();
    }
    data['appointment_date'] = this.appointmentDate;
    data['timeslot_id'] = this.timeslotId;
    data['slot_start_time'] = this.slotStartTime;
    data['slot_end_time'] = this.slotEndTime;
    if (this.package != null) {
      data['package'] = this.package!.toJson();
    }
    if (this.vehicle != null) {
      data['vehicle'] = this.vehicle!.toJson();
    }
    data['remark'] = this.remark;
    if (this.staff != null) {
      data['staff'] = this.staff!.toJson();
    }
    data['entry_from'] = this.entryFrom;

    data['total_extra_service_price'] = this.totalExtraServicePrice;
    data['time_duration'] = this.timeDuration;
    data['pickup_address'] = this.pickupAddress;
    if (this.userAddress != null) {
      data['user_address'] = this.userAddress!.toJson();
    }
    data['staff_status'] = this.staffStatus;
    if (this.staffOrderStatus != null) {
      data['staff_order_status'] = this.staffOrderStatus!.toJson();
    }
    data['order_status'] = this.orderStatus;
    data['payment_status'] = this.paymentStatus;
    data['payment_mode'] = this.paymentMode;
    data['payment_date'] = this.paymentDate;
    data['sub_total'] = this.subTotal;
    data['tax'] = this.tax;
    data['total_amount'] = this.totalAmount;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}

class Category {
  dynamic categoryId;
  dynamic name;
  dynamic image;

  Category({this.categoryId, this.name, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class Brand {
  dynamic brandId;
  dynamic name;
  dynamic image;

  Brand({this.brandId, this.name, this.image});

  Brand.fromJson(Map<String, dynamic> json) {
    brandId = json['brand_id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand_id'] = this.brandId;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class CarSize {
  dynamic carSizeId;
  dynamic sizeName;

  CarSize({this.carSizeId, this.sizeName});

  CarSize.fromJson(Map<String, dynamic> json) {
    carSizeId = json['car_size_id'];
    sizeName = json['size_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['car_size_id'] = this.carSizeId;
    data['size_name'] = this.sizeName;
    return data;
  }
}

class CarModel {
  dynamic carModelId;
  dynamic carModelName;

  CarModel({this.carModelId, this.carModelName});

  CarModel.fromJson(Map<String, dynamic> json) {
    carModelId = json['car_model_id'];
    carModelName = json['car_model_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['car_model_id'] = this.carModelId;
    data['car_model_name'] = this.carModelName;
    return data;
  }
}

class Package {
  dynamic packageId;
  Category? category;
  CarSize? carSize;
  dynamic packageName;
  dynamic packageImage;
  dynamic packagePrice;
  dynamic packageOfferPrice;
  dynamic packageDiscount;
  dynamic timeDuration;
  dynamic showDashboard;
  List<PackageServices>? packageServices;
  dynamic packageRating;

  Package(
      {this.packageId,
        this.category,
        this.carSize,
        this.packageName,
        this.packageImage,
        this.packagePrice,
        this.packageOfferPrice,
        this.packageDiscount,
        this.timeDuration,
        this.showDashboard,
        this.packageServices,
        this.packageRating});

  Package.fromJson(Map<String, dynamic> json) {
    packageId = json['package_id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    carSize = json['car_size'] != null
        ? new CarSize.fromJson(json['car_size'])
        : null;
    packageName = json['package_name'];
    packageImage = json['package_image'];
    packagePrice = json['package_price'];
    packageOfferPrice = json['package_offer_price'];
    packageDiscount = json['package_discount'];
    timeDuration = json['time_duration'];
    showDashboard = json['show_dashboard'];
    if (json['package_services'] != null) {
      packageServices = <PackageServices>[];
      json['package_services'].forEach((v) {
        packageServices!.add(new PackageServices.fromJson(v));
      });
    }
    packageRating = json['package_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_id'] = this.packageId;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.carSize != null) {
      data['car_size'] = this.carSize!.toJson();
    }
    data['package_name'] = this.packageName;
    data['package_image'] = this.packageImage;
    data['package_price'] = this.packagePrice;
    data['package_offer_price'] = this.packageOfferPrice;
    data['package_discount'] = this.packageDiscount;
    data['time_duration'] = this.timeDuration;
    data['show_dashboard'] = this.showDashboard;
    if (this.packageServices != null) {
      data['package_services'] =
          this.packageServices!.map((v) => v.toJson()).toList();
    }
    data['package_rating'] = this.packageRating;
    return data;
  }
}

class PackageServices {
  dynamic serviceId;
  Category? category;
  CarSize? carSize;
  dynamic serviceName;
  dynamic servicePrice;
  dynamic serviceOfferPrice;
  dynamic timeDuration;
  dynamic showDashboard;

  PackageServices(
      {this.serviceId,
        this.category,
        this.carSize,
        this.serviceName,
        this.servicePrice,
        this.serviceOfferPrice,
        this.timeDuration,
        this.showDashboard});

  PackageServices.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    carSize = json['car_size'] != null
        ? new CarSize.fromJson(json['car_size'])
        : null;
    serviceName = json['service_name'];
    servicePrice = json['service_price'];
    serviceOfferPrice = json['service_offer_price'];
    timeDuration = json['time_duration'];
    showDashboard = json['show_dashboard'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.carSize != null) {
      data['car_size'] = this.carSize!.toJson();
    }
    data['service_name'] = this.serviceName;
    data['service_price'] = this.servicePrice;
    data['service_offer_price'] = this.serviceOfferPrice;
    data['time_duration'] = this.timeDuration;
    data['show_dashboard'] = this.showDashboard;
    return data;
  }
}

class Vehicle {
  dynamic userVehicleId;
  Category? category;
  Brand? brand;
  Fuel? fuel;
  CarSize? carSize;
  CarModel? carModel;

  Vehicle(
      {this.userVehicleId,
        this.category,
        this.brand,
        this.fuel,
        this.carSize,
        this.carModel});

  Vehicle.fromJson(Map<String, dynamic> json) {
    userVehicleId = json['user_vehicle_id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    fuel = json['fuel'] != null ? new Fuel.fromJson(json['fuel']) : null;
    carSize = json['car_size'] != null
        ? new CarSize.fromJson(json['car_size'])
        : null;
    carModel = json['car_model'] != null
        ? new CarModel.fromJson(json['car_model'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_vehicle_id'] = this.userVehicleId;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.fuel != null) {
      data['fuel'] = this.fuel!.toJson();
    }
    if (this.carSize != null) {
      data['car_size'] = this.carSize!.toJson();
    }
    if (this.carModel != null) {
      data['car_model'] = this.carModel!.toJson();
    }
    return data;
  }
}

class Fuel {
  dynamic fuelId;
  dynamic name;
  dynamic image;

  Fuel({this.fuelId, this.name, this.image});

  Fuel.fromJson(Map<String, dynamic> json) {
    fuelId = json['fuel_id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fuel_id'] = this.fuelId;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class Staff {
  dynamic staffId;
  dynamic profileImage;
  dynamic carDriverId;
  StationId? stationId;
  dynamic name;
  dynamic mobile;
  dynamic email;
  dynamic address;
  dynamic status;

  Staff(
      {this.staffId,
        this.profileImage,
        this.carDriverId,
        this.stationId,
        this.name,
        this.mobile,
        this.email,
        this.address,
        this.status});

  Staff.fromJson(Map<String, dynamic> json) {
    staffId = json['staff_id'];
    profileImage = json['profile_image'];
    carDriverId = json['car_driver_id'];
    stationId = json['station_id'] != null
        ? new StationId.fromJson(json['station_id'])
        : null;
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    address = json['address'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['staff_id'] = this.staffId;
    data['profile_image'] = this.profileImage;
    data['car_driver_id'] = this.carDriverId;
    if (this.stationId != null) {
      data['station_id'] = this.stationId!.toJson();
    }
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['address'] = this.address;
    data['status'] = this.status;
    return data;
  }
}

class StationId {
  dynamic stationId;
  dynamic name;
  dynamic image;
  dynamic status;

  StationId({this.stationId, this.name, this.image, this.status});

  StationId.fromJson(Map<String, dynamic> json) {
    stationId = json['station_id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['station_id'] = this.stationId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['status'] = this.status;
    return data;
  }
}

class UserAddress {
  dynamic userAddressId;
  dynamic userId;
  dynamic addLine1;
  dynamic addLine2;
  dynamic city;
  dynamic landmark;
  dynamic zipcode;
  dynamic status;

  UserAddress(
      {this.userAddressId,
        this.userId,
        this.addLine1,
        this.addLine2,
        this.city,
        this.landmark,
        this.zipcode,
        this.status});

  UserAddress.fromJson(Map<String, dynamic> json) {
    userAddressId = json['user_address_id'];
    userId = json['user_id'];
    addLine1 = json['add_line1'];
    addLine2 = json['add_line2'];
    city = json['city'];
    landmark = json['landmark'];
    zipcode = json['zipcode'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_address_id'] = this.userAddressId;
    data['user_id'] = this.userId;
    data['add_line1'] = this.addLine1;
    data['add_line2'] = this.addLine2;
    data['city'] = this.city;
    data['landmark'] = this.landmark;
    data['zipcode'] = this.zipcode;
    data['status'] = this.status;
    return data;
  }
}

class Rating {
  dynamic id;
  dynamic modelType;
  dynamic modelId;
  dynamic authorType;
  dynamic authorId;
  dynamic orderId;
  dynamic review;
  dynamic rating;
  dynamic activeStatus;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  Rating(
      {this.id,
        this.modelType,
        this.modelId,
        this.authorType,
        this.authorId,
        this.orderId,
        this.review,
        this.rating,
        this.activeStatus,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Rating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelType = json['model_type'];
    modelId = json['model_id'];
    authorType = json['author_type'];
    authorId = json['author_id'];
    orderId = json['order_id'];
    review = json['review'];
    rating = json['rating'];
    activeStatus = json['active_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['model_type'] = this.modelType;
    data['model_id'] = this.modelId;
    data['author_type'] = this.authorType;
    data['author_id'] = this.authorId;
    data['order_id'] = this.orderId;
    data['review'] = this.review;
    data['rating'] = this.rating;
    data['active_status'] = this.activeStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
class StaffOrderStatus {
  int? staffOrderStatusId;
  String? name;
  String? updateButton;
  String? jobStatusEng;
  String? image;

  StaffOrderStatus(
      {this.staffOrderStatusId,
        this.name,
        this.updateButton,
        this.jobStatusEng,
        this.image});

  StaffOrderStatus.fromJson(Map<String, dynamic> json) {
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