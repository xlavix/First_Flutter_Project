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
                imagePath: 'images/Jimly.JPG',
                nama: 'Jimly Assidiq Anwar',
                npm: '4522210003',
                alamat: 'Depok',
              ),
              SizedBox(height: 20),
              ProfileCard(
                imagePath: 'images/farhan.jpg',
                nama: 'Muhamad Farhan',
                npm: '4522210057',
                alamat: 'Depok',
              ),
              SizedBox(height: 20),
              ProfileCard(
                imagePath: 'images/galih.png',
                nama: 'Rizky Galih Dwiyanto',
                npm: '4522210074',
                alamat: 'Depok',
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
  final String npm;
  final String alamat;

  const ProfileCard({
    super.key,
    required this.imagePath,
    required this.nama,
    required this.npm,
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
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(imagePath),
              ),
              const SizedBox(height: 16),
              Text('Nama', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(nama, style: TextStyle(fontSize: 18)),
              const SizedBox(height: 12),
              Text('NPM', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(npm, style: TextStyle(fontSize: 18)),
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
