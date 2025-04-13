import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HalamanDaftarNegara extends StatefulWidget {
  const HalamanDaftarNegara({super.key});

  @override
  _HalamanDaftarNegaraState createState() => _HalamanDaftarNegaraState();
}

class _HalamanDaftarNegaraState extends State<HalamanDaftarNegara> {
  List negaraList = [];
  bool loading = true;

  Future<void> fetchDaftarNegara() async {
    setState(() {
      loading = true;
    });

    final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      // Urutkan berdasarkan nama negara
      data.sort((a, b) {
        String namaA = a['name']['common'];
        String namaB = b['name']['common'];
        return namaA.compareTo(namaB);
      });

      setState(() {
        negaraList = data;
        loading = false;
      });
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDaftarNegara();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: negaraList.length,
      itemBuilder: (context, index) {
        final negara = negaraList[index];
        final nama = negara['name']['common'] ?? 'Tidak diketahui';
        final ibukota = (negara['capital'] != null && negara['capital'].isNotEmpty)
            ? negara['capital'][0]
            : 'Tidak ada';
        final region = negara['region'] ?? 'Tidak diketahui';
        final benderaUrl = negara['flags']['png'] ?? '';

        return Card(
          margin: EdgeInsets.only(bottom: 16),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: Image.network(benderaUrl, width: 50),
            title: Text(nama, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Ibukota: $ibukota\nRegion: $region'),
          ),
        );
      },
    );
  }
}
