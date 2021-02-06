// To parse this JSON data, do
//
//     final quakeModel = quakeModelFromJson(jsonString);

import 'dart:convert';

QuakeModel quakeModelFromJson(String str) => QuakeModel.fromJson(json.decode(str));

String quakeModelToJson(QuakeModel data) => json.encode(data.toJson());

class QuakeModel {
  QuakeModel({
    this.status,
    this.result,
  });

  bool status;
  List<Result> result;

  factory QuakeModel.fromJson(Map<String, dynamic> json) => QuakeModel(
    status: json["status"] == null ? null : json["status"],
    result: json["result"] == null ? null : List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "result": result == null ? null : List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.mag,
    this.lng,
    this.lat,
    this.lokasyon,
    this.depth,
    this.coordinates,
    this.title,
    this.rev,
    this.timestamp,
    this.dateStamp,
    this.date,
    this.hash,
    this.hash2,
  });

  double mag;
  double lng;
  double lat;
  String lokasyon;
  double depth;
  List<double> coordinates;
  String title;
  dynamic rev;
  int timestamp;
  DateTime dateStamp;
  String date;
  String hash;
  String hash2;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    mag: json["mag"] == null ? null : json["mag"].toDouble(),
    lng: json["lng"] == null ? null : json["lng"].toDouble(),
    lat: json["lat"] == null ? null : json["lat"].toDouble(),
    lokasyon: json["lokasyon"] == null ? null : json["lokasyon"],
    depth: json["depth"] == null ? null : json["depth"].toDouble(),
    coordinates: json["coordinates"] == null ? null : List<double>.from(json["coordinates"].map((x) => x.toDouble())),
    title: json["title"] == null ? null : json["title"],
    rev: json["rev"],
    timestamp: json["timestamp"] == null ? null : json["timestamp"],
    dateStamp: json["date_stamp"] == null ? null : DateTime.parse(json["date_stamp"]),
    date: json["date"] == null ? null : json["date"],
    hash: json["hash"] == null ? null : json["hash"],
    hash2: json["hash2"] == null ? null : json["hash2"],
  );

  Map<String, dynamic> toJson() => {
    "mag": mag == null ? null : mag,
    "lng": lng == null ? null : lng,
    "lat": lat == null ? null : lat,
    "lokasyon": lokasyon == null ? null : lokasyon,
    "depth": depth == null ? null : depth,
    "coordinates": coordinates == null ? null : List<dynamic>.from(coordinates.map((x) => x)),
    "title": title == null ? null : title,
    "rev": rev,
    "timestamp": timestamp == null ? null : timestamp,
    "date_stamp": dateStamp == null ? null : "${dateStamp.year.toString().padLeft(4, '0')}-${dateStamp.month.toString().padLeft(2, '0')}-${dateStamp.day.toString().padLeft(2, '0')}",
    "date": date == null ? null : date,
    "hash": hash == null ? null : hash,
    "hash2": hash2 == null ? null : hash2,
  };
}
