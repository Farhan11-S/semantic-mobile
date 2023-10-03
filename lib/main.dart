import 'package:flutter/material.dart';
import 'package:semantic_mobile/base_client.dart';
import 'package:semantic_mobile/card_builder.dart';
import 'package:semantic_mobile/search_bar.dart';
import 'package:semantic_mobile/wisata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DAFTAR WISATA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'DAFTAR WISATA KABUPATEN PATI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Wisata>? _wisatas;
  String _jenisWisata = "";
  String _search = "";
  String _url = "";

  void _getWisata() async {
    var response = await BaseClient()
        .post(url: _url, jenisWisata: _jenisWisata, search: _search);

    setState(() {
      if (response != null) _wisatas = wisataFromJson(response);
    });
  }

  void _setURL(String val) {
    setState(() {
      _url = val;
    });
  }

  void _setInputValue({required String val, bool isDropdown = false}) {
    setState(() {
      if (!isDropdown) {
        _search = val;
      } else {
        _jenisWisata = val;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(children: [
        const SizedBox(height: 50),
        SizedBox(
          width: 345,
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Fuseki URL",
            ),
            onChanged: _setURL,
          ),
        ),
        const SizedBox(height: 10),
        SearchBarComponent(setInputValue: _setInputValue),
        const SizedBox(height: 10),
        SizedBox(
          width: 300,
          child: TextButton(
            onPressed: _getWisata,
            child: const Text('Cari'),
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: _wisatas?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            Wisata? wisata = _wisatas?[index];
            return CardBuilder(wisata: wisata);
          },
        ))
      ]),
    );
  }
}
