import 'package:flutter/material.dart';
import 'package:w_vaccine/features/profile/detail_family_group.dart';

class AnggotaKeluarga extends StatelessWidget {
  const AnggotaKeluarga({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> datas = [
      {
        'nama': 'Afifah Cahyaningsih',
        'nik': '1312432423423',
        'hub': 'Pribadi',
        'dom': 'Jakarta',
        'gender': 'Wanita',
        'age': '20'
      },
      {
        'nama': 'AfGGGifah Cahyani',
        'nik': '1312432423423',
        'hub': 'Bapak',
        'dom': 'JWakarta',
        'gender': 'Wanita',
        'age': '212'
      },
      {
        'nama': 'AWAfifah Cah',
        'nik': '12432423423',
        'hub': 'Ibu',
        'dom': 'Jakarta',
        'gender': 'Wanita',
        'age': '22'
      },
      {
        'nama': 'Afifah C',
        'nik': '1312432423423',
        'hub': 'Kakak',
        'dom': 'Jak32arta',
        'gender': 'Wanita',
        'age': '29'
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Anggota Keluarga',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              for (var data in datas)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailFamily(
                                name: data['nama']!,
                                nik: data['nik']!,
                                age: data['age']!,
                                gender: data['gender']!,
                                hub: data['hub']!)));
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 6,
                            offset: const Offset(0, 0),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data['nama']!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(data['hub']!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'NIK: ${data['nik']!}',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                Text(data['dom']!,
                                    style: const TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff3366FF),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 145, vertical: 15),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Tambah",
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
