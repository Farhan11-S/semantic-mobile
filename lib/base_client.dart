import 'dart:convert';

import 'package:http/http.dart' as http;

class BaseClient {
  var client = http.Client();

  Future<dynamic> post(
      {required String jenisWisata,
      required String search,
      required String url}) async {
    var parsedURL = Uri.parse(url);
    var payload = """
PREFIX schema: <http://schema.org/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX data: <http://www.semanticweb.org/asus/ontologies/2021/1/wisata#> 

SELECT ?ObyekWisata ?JenisWisata ?JenisWisata2 ?JenisWisata3 ?JenisWisata4 ?Deskripsi ?Deskripsi2 ?Deskripsi3 ?Deskripsi4 ?Desa ?Desa2 ?Desa3 ?Desa4 ?Kecamatan ?Kecamatan2 ?Kecamatan3 ?Kecamatan4 ?Telpon ?Telpon2 ?Telpon3 ?Telpon4 ?Broader ?Narrower ?Related ?Gambar ?Gambar2 ?Gambar3 ?Gambar4 ?Toilet ?Toilet2 ?Toilet3 ?Toilet4 ?Wifi ?Wifi2 ?Wifi3 ?Wifi4 ?Mushola ?Mushola2 ?Mushola3 ?Mushola4
WHERE { 
  ?wisata data:beradaDi ?Tempat;
          data:namaObyek ?ObyekWisata;
          data:deskripsiWisata ?Deskripsi;
          data:telpon ?Telpon;
          schema:image ?Gambar.
  ?Tempat data:dimiliki ?wisata;
          data:jenisWisata ?JenisWisata;
          data:desa ?Desa;
          data:kecamatan ?Kecamatan.
  
  OPTIONAL {?wisata skos:broader ?broader.
      ?broader data:beradaDi ?Tempat1;
              data:namaObyek ?Broader;
              data:deskripsiWisata ?Deskripsi2;
              data:telpon ?Telpon2;
              schema:image ?Gambar2.
      ?Tempat1 data:dimiliki ?broader;
              data:jenisWisata ?JenisWisata2;
              data:desa ?Desa2;
              data:kecamatan ?Kecamatan2.
      
      OPTIONAL{?broader data:memiliki ?fasilitas2.
          ?fasilitas2 data:toilet ?Toilet2.}
      OPTIONAL {?broader data:memiliki ?fasilitas2.
          ?fasilitas2 data:wifi ?Wifi2.}
      OPTIONAL {?broader data:memiliki ?fasilitas2.
          ?fasilitas2 data:mushola ?Mushola2.}}
  
  OPTIONAL {?wisata skos:narrower ?narrower.
      ?narrower data:beradaDi ?Tempat2;
              data:namaObyek ?Narrower;
              data:deskripsiWisata ?Deskripsi3;
              data:telpon ?Telpon3;
              schema:image ?Gambar3.
      ?Tempat2 data:dimiliki ?narrower;
              data:jenisWisata ?JenisWisata3;
              data:desa ?Desa3;
              data:kecamatan ?Kecamatan3.
      
      OPTIONAL{?narrower data:memiliki ?fasilitas3.
      ?fasilitas3 data:toilet ?Toilet3.}
      OPTIONAL {?narrower data:memiliki ?fasilitas3.
      ?fasilitas3 data:wifi ?Wifi3.}
      OPTIONAL {?narrower data:memiliki ?fasilitas3.
      ?fasilitas3 data:mushola ?Mushola3.}}
  
  OPTIONAL {?wisata skos:related ?related.
      ?related data:beradaDi ?Tempat3;
              data:namaObyek ?Related;
              data:deskripsiWisata ?Deskripsi4;
              data:telpon ?Telpon4;
              schema:image ?Gambar4.
      ?Tempat3 data:dimiliki ?related;
              data:jenisWisata ?JenisWisata4;
              data:desa ?Desa4;
              data:kecamatan ?Kecamatan4.
      
      OPTIONAL{?related data:memiliki ?fasilitas4.
      ?fasilitas4 data:toilet ?Toilet4.}
      OPTIONAL {?related data:memiliki ?fasilitas4.
      ?fasilitas4 data:wifi ?Wifi4.}
      OPTIONAL {?related data:memiliki ?fasilitas4.
      ?fasilitas4 data:mushola ?Mushola4.}}
  
  OPTIONAL{?wisata data:memiliki ?fasilitas.
      ?fasilitas data:toilet ?Toilet.}
  OPTIONAL {?wisata data:memiliki ?fasilitas.
      ?fasilitas data:wifi ?Wifi.}
  OPTIONAL {?wisata data:memiliki ?fasilitas.
      ?fasilitas data:mushola ?Mushola.}
      FILTER (regex(?JenisWisata,'$jenisWisata') && regex(?ObyekWisata,'$search', 'i'))
}
    """;
    var headers = <String, String>{
      'Accept': 'application/sparql-results+json',
      'Content-Type': 'application/sparql-query',
    };

    var response =
        await client.post(parsedURL, body: payload, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }
}
