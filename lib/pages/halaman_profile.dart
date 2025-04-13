import 'package:flutter/material.dart';

class HalamanProfile extends StatelessWidget {
  const HalamanProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: const [
              ProfileCard(
                imagePath: 'assets/images/Jimly.JPG',
                nama: 'Jimly Asidiq Anwar',
                ttl: 'Bekasi, 1 Juni 2004',
                alamat: 'Depok',
              ),
              SizedBox(height: 20),
              ProfileCard(
                imagePath: 'assets/images/farhan.jpg',
                nama: 'Muhamad Farhan',
                ttl: 'Depok, 1 Februari 2002',
                alamat: 'Depok',
              ),
              SizedBox(height: 20),
              ProfileCard(
                imagePath: 'assets/images/galih.png',
                nama: 'Rizky Galih Dwiyanto',
                ttl: 'Bogor, 23 September 2003',
                alamat: 'Cibinong',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String imagePath;
  final String nama;
  final String ttl;
  final String alamat;

  const ProfileCard({
    super.key,
    required this.imagePath,
    required this.nama,
    required this.ttl,
    required this.alamat,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300, // Ukuran tetap dan seragam
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: 220,
                  height: 160,
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 16),
              Text('Nama', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(nama, style: TextStyle(fontSize: 18)),
              const SizedBox(height: 12),
              Text('Tempat & Tanggal Lahir', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(ttl, style: TextStyle(fontSize: 18)),
              const SizedBox(height: 12),
              Text('Alamat', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(alamat, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
