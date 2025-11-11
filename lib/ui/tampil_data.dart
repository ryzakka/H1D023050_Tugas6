import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TampilData extends StatelessWidget {
  final String nama;
  final String nim;
  final DateTime tanggalLahir;

  const TampilData({
    Key? key,
    required this.nama,
    required this.nim,
    required this.tanggalLahir,
  }) : super(key: key);

  int _calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month && currentDate.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    final int umur = _calculateAge(tanggalLahir);
    final String tanggalLahirFormatted = DateFormat('d MMMM yyyy').format(tanggalLahir);

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text("Perkenalan"),
        backgroundColor: Colors.blue[800],
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                  colors: [Colors.blue[700]!, Colors.blue[900]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person_pin_rounded, color: Colors.white, size: 40),
                      const SizedBox(width: 12),
                      const Text(
                        "Halo, Kenalin!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 30, thickness: 1, color: Colors.white54),
                  Text(
                    'Perkenalkan, nama saya $nama. Saya adalah seorang mahasiswa dengan Nomor Induk Mahasiswa $nim.',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Saya lahir pada tanggal $tanggalLahirFormatted, saat ini saya berusia $umur tahun.',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
