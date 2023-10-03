import 'package:flutter/material.dart';
import 'package:semantic_mobile/wisata.dart';

class RelatedDetailPage extends StatelessWidget {
  final OverallWisata wisata;

  const RelatedDetailPage({super.key, required this.wisata});

  @override
  Widget build(BuildContext context) {
    List<DetailDisplayer> listOfLabel = [
      DetailDisplayer(label: "Nama Wisata", value: wisata.obyekWisata ?? ''),
      DetailDisplayer(label: "Kategori", value: wisata.jenisWisata ?? ''),
      DetailDisplayer(label: "Deskripsi", value: wisata.deskripsi ?? ''),
      DetailDisplayer(label: "Lokasi", value: wisata.lokasiBuilder()),
      DetailDisplayer(label: "Narahubung", value: wisata.telpon ?? ''),
      DetailDisplayer(label: "Fasilitas", value: wisata.fasilitasBuilder()),
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Wisata'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 185,
                    minHeight: 185,
                    maxWidth: 185,
                    maxHeight: 185,
                  ),
                  child: Image.network(wisata?.gambar ?? '', fit: BoxFit.fill),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  children: [
                    ...listOfLabel
                        .map((item) => Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        item.label,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Flexible(child: Text(item.value ?? ''))
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                )
                              ],
                            ))
                        .toList(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
