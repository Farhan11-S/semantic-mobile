import 'dart:convert';

List<Wisata> wisataFromJson(String str) => List<Wisata>.from(
    json.decode(str)["results"]["bindings"].map((x) => Wisata.fromJson(x)));

String wisataToJson(List<Wisata> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

abstract class OverallWisata {
  String? obyekWisata;
  String? jenisWisata;
  String? deskripsi;
  String? desa;
  String? kecamatan;
  String? telpon;
  String? gambar;
  String? toilet;
  String? wifi;
  String? mushola;

  OverallWisata({
    this.obyekWisata,
    this.jenisWisata,
    this.deskripsi,
    this.desa,
    this.kecamatan,
    this.telpon,
    this.gambar,
    this.toilet,
    this.wifi,
    this.mushola,
  });

  Map<String, dynamic> toJson() => {
        "ObyekWisata": obyekWisata,
      };
  String lokasiBuilder() => "${desa ?? ''}, ${kecamatan ?? ''}";
  String fasilitasBuilder() =>
      "${toilet ?? ''}, ${mushola ?? ''}, ${wifi ?? ''}";
}

class Wisata extends OverallWisata {
  Wisata({
    super.obyekWisata,
    super.jenisWisata,
    super.deskripsi,
    super.desa,
    super.kecamatan,
    super.telpon,
    super.gambar,
    super.toilet,
    super.wifi,
    super.mushola,
    this.broader,
    this.narrower,
    this.related,
  });

  Broader? broader;
  Narrower? narrower;
  Related? related;

  factory Wisata.fromJson(Map<String, dynamic> json) => Wisata(
        obyekWisata: json["ObyekWisata"]?["value"],
        jenisWisata: json["JenisWisata"]?["value"],
        deskripsi: json["Deskripsi"]?["value"],
        desa: json["Desa"]?["value"],
        kecamatan: json["Kecamatan"]?["value"],
        telpon: json["Telpon"]?["value"],
        gambar: json["Gambar"]?["value"],
        toilet: json["Toilet"]?["value"],
        wifi: json["Wifi"]?["value"],
        mushola: json["Mushola"]?["value"],
        broader: Broader.fromJson(json),
        narrower: Narrower.fromJson(json),
        related: Related.fromJson(json),
      );
}

class Broader extends OverallWisata {
  Broader({
    super.obyekWisata,
    super.jenisWisata,
    super.deskripsi,
    super.desa,
    super.kecamatan,
    super.telpon,
    super.gambar,
    super.toilet,
    super.wifi,
    super.mushola,
  });

  factory Broader.fromJson(Map<String, dynamic> json) => Broader(
        obyekWisata: json["Broader"]?["value"],
        jenisWisata: json["JenisWisata2"]?["value"],
        deskripsi: json["Deskripsi2"]?["value"],
        desa: json["Desa2"]?["value"],
        kecamatan: json["Kecamatan2"]?["value"],
        telpon: json["Telpon2"]?["value"],
        gambar: json["Gambar2"]?["value"],
        toilet: json["Toilet2"]?["value"],
        wifi: json["Wifi2"]?["value"],
        mushola: json["Mushola2"]?["value"],
      );
}

class Narrower extends OverallWisata {
  Narrower({
    super.obyekWisata,
    super.jenisWisata,
    super.deskripsi,
    super.desa,
    super.kecamatan,
    super.telpon,
    super.gambar,
    super.toilet,
    super.wifi,
    super.mushola,
  });

  factory Narrower.fromJson(Map<String, dynamic> json) => Narrower(
        obyekWisata: json["Narrower"]?["value"],
        jenisWisata: json["JenisWisata3"]?["value"],
        deskripsi: json["Deskripsi3"]?["value"],
        desa: json["Desa3"]?["value"],
        kecamatan: json["Kecamatan3"]?["value"],
        telpon: json["Telpon3"]?["value"],
        gambar: json["Gambar3"]?["value"],
        toilet: json["Toilet3"]?["value"],
        wifi: json["Wifi3"]?["value"],
        mushola: json["Mushola3"]?["value"],
      );
}

class Related extends OverallWisata {
  Related({
    super.obyekWisata,
    super.jenisWisata,
    super.deskripsi,
    super.desa,
    super.kecamatan,
    super.telpon,
    super.gambar,
    super.toilet,
    super.wifi,
    super.mushola,
  });

  factory Related.fromJson(Map<String, dynamic> json) => Related(
        obyekWisata: json["Related"]?["value"],
        jenisWisata: json["JenisWisata4"]?["value"],
        deskripsi: json["Deskripsi4"]?["value"],
        desa: json["Desa4"]?["value"],
        kecamatan: json["Kecamatan4"]?["value"],
        telpon: json["Telpon4"]?["value"],
        gambar: json["Gambar4"]?["value"],
        toilet: json["Toilet4"]?["value"],
        wifi: json["Wifi4"]?["value"],
        mushola: json["Mushola4"]?["value"],
      );
}

class DetailDisplayer {
  DetailDisplayer({required this.label, required this.value});
  String label;
  String value;
}
