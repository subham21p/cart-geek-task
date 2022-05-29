// To parse this JSON data, do
//
//     final homeDataResponse = homeDataResponseFromJson(jsonString);

import 'dart:convert';

HomeDataResponse homeDataResponseFromJson(String str) =>
    HomeDataResponse.fromJson(json.decode(str));

String homeDataResponseToJson(HomeDataResponse data) =>
    json.encode(data.toJson());

class HomeDataResponse {
  HomeDataResponse({
    this.currentBookings,
    this.packages,
  });

  CurrentBookings? currentBookings;
  List<Package>? packages;

  factory HomeDataResponse.fromJson(Map<String, dynamic> json) =>
      HomeDataResponse(
        currentBookings: json["current_bookings"] == null
            ? null
            : CurrentBookings.fromJson(json["current_bookings"]),
        packages: json["packages"] == null
            ? null
            : List<Package>.from(
                json["packages"].map((x) => Package.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "current_bookings":
            currentBookings == null ? null : currentBookings!.toJson(),
        "packages": packages == null
            ? null
            : List<dynamic>.from(packages!.map((x) => x.toJson())),
      };
}

class CurrentBookings {
  CurrentBookings({
    this.packageLabel,
    this.fromDate,
    this.fromTime,
    this.toDate,
    this.toTime,
  });

  String? packageLabel;
  String? fromDate;
  String? fromTime;
  String? toDate;
  String? toTime;

  factory CurrentBookings.fromJson(Map<String, dynamic> json) =>
      CurrentBookings(
        packageLabel:
            json["package_label"] == null ? null : json["package_label"],
        fromDate: json["from_date"] == null ? null : json["from_date"],
        fromTime: json["from_time"] == null ? null : json["from_time"],
        toDate: json["to_date"] == null ? null : json["to_date"],
        toTime: json["to_time"] == null ? null : json["to_time"],
      );

  Map<String, dynamic> toJson() => {
        "package_label": packageLabel == null ? null : packageLabel,
        "from_date": fromDate == null ? null : fromDate,
        "from_time": fromTime == null ? null : fromTime,
        "to_date": toDate == null ? null : toDate,
        "to_time": toTime == null ? null : toTime,
      };
}

class Package {
  Package({
    this.id,
    this.packageName,
    this.price,
    this.description,
  });

  int? id;
  String? packageName;
  int? price;
  String? description;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"] == null ? null : json["id"],
        packageName: json["package_name"] == null ? null : json["package_name"],
        price: json["price"] == null ? null : json["price"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "package_name": packageName == null ? null : packageName,
        "price": price == null ? null : price,
        "description": description == null ? null : description,
      };
}
