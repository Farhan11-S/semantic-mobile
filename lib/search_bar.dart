import 'package:flutter/material.dart';

class SearchBarComponent extends StatelessWidget {
  final void Function({required String val, bool isDropdown}) setInputValue;
  const SearchBarComponent({super.key, required this.setInputValue});

  @override
  Widget build(BuildContext context) {
    const List<String> jenisWisata = <String>[
      'Wisata Alam',
      'Wisata Budaya',
      'Wisata Kerajinan',
      'Wisata Kuliner',
      'Wisata Religi',
      'Wisata Sejarah'
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 190,
            child: DropdownButtonFormField<String>(
              items: jenisWisata.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: SizedBox(
                    width: 140,
                    child: Text(value),
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                setInputValue(val: value ?? '', isDropdown: true);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Jenis Wisata",
              ),
            )),
        const SizedBox(width: 5),
        SizedBox(
          width: 150,
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Cari Wisata",
            ),
            onChanged: (String value) {
              setInputValue(val: value ?? '');
            },
          ),
        ),
      ],
    );
  }
}
