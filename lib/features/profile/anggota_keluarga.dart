import 'package:flutter/material.dart';

class AnggotaKeluarga extends StatelessWidget {
  const AnggotaKeluarga({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 6,
                    offset: const Offset(4, 4),
                  )
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 32,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Anggota Keluarga',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Padding(
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
                              children: const [
                                Text(
                                  'Afifah Cahyaningsih',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('Pribadi',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'NIK: 1231432424',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text('Jawa Barat',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
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
                              children: const [
                                Text('Afifah Cahyaningsih',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text('Pribadi',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('NIK: 1231432424',
                                    style: TextStyle(color: Colors.grey)),
                                Text('Jawa Barat',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
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
                              children: const [
                                Text('Afifah Cahyaningsih',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text('Pribadi',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('NIK: 1231432424',
                                    style: TextStyle(color: Colors.grey)),
                                Text('Jawa Barat',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
    );
  }
}
