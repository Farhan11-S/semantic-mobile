import 'package:flutter/material.dart';
import 'package:semantic_mobile/detail_page.dart';
import 'package:semantic_mobile/wisata.dart';

class CardBuilder extends StatelessWidget {
  final Wisata? wisata;

  const CardBuilder({super.key, this.wisata});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 84,
            minHeight: 84,
            maxWidth: 84,
            maxHeight: 84,
          ),
          child: Image.network(wisata?.gambar ?? '', fit: BoxFit.fill),
        ),
        title: Text(wisata?.obyekWisata ?? ''),
        subtitle: Text(wisata?.lokasiBuilder() ?? ''),
        isThreeLine: true,
        onTap: () {
          if (wisata != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(wisata: wisata!)),
            );
          }
        },
      ),
    );
  }
}
