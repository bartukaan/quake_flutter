// To parse this JSON data, do
//
//     final building = buildingFromJson(jsonString);

import 'dart:convert';

Building buildingFromJson(String str) => Building.fromJson(json.decode(str));

String buildingToJson(Building data) => json.encode(data.toJson());

class Building {
  Building({
    this.sokak,
    this.ehir,
    this.mahalle,
    this.apartman,
    this.apartmanNo,
    this.postaKodu,
    this.yapilisYili,
    this.riskDurumu,
    this.yapiMalzemesi,
    this.hasarDurumu,
  });

  String sokak;
  String ehir;
  String mahalle;
  String apartman;
  String apartmanNo;
  String postaKodu;
  String yapilisYili;
  String riskDurumu;
  String yapiMalzemesi;
  String hasarDurumu;

  factory Building.fromJson(Map<String, dynamic> json) => Building(
    sokak: json["sokak"] == null ? null : json["sokak"],
    ehir: json["şehir"] == null ? null : json["şehir"],
    mahalle: json["mahalle"] == null ? null : json["mahalle"],
    apartman: json["apartman"] == null ? null : json["apartman"],
    apartmanNo: json["apartmanNo"] == null ? null : json["apartmanNo"],
    postaKodu: json["postaKodu"] == null ? null : json["postaKodu"],
    yapilisYili: json["yapilisYili"] == null ? null : json["yapilisYili"],
    riskDurumu: json["riskDurumu"] == null ? null : json["riskDurumu"],
    yapiMalzemesi: json["yapiMalzemesi"] == null ? null : json["yapiMalzemesi"],
    hasarDurumu: json["hasarDurumu"] == null ? null : json["hasarDurumu"],
  );

  Map<String, dynamic> toJson() => {
    "sokak": sokak == null ? null : sokak,
    "şehir": ehir == null ? null : ehir,
    "mahalle": mahalle == null ? null : mahalle,
    "apartman": apartman == null ? null : apartman,
    "apartmanNo": apartmanNo == null ? null : apartmanNo,
    "postaKodu": postaKodu == null ? null : postaKodu,
    "yapilisYili": yapilisYili == null ? null : yapilisYili,
    "riskDurumu": riskDurumu == null ? null : riskDurumu,
    "yapiMalzemesi": yapiMalzemesi == null ? null : yapiMalzemesi,
    "hasarDurumu": hasarDurumu == null ? null : hasarDurumu,
  };
}
