import 'package:flutter/material.dart';

class DetailFamily extends StatelessWidget {
  const DetailFamily(
      {super.key,
      required this.name,
      required this.nik,
      required this.age,
      required this.gender,
      required this.hub});

  final String name;
  final String nik;
  final String age;
  final String gender;
  final String hub;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: (hub == 'Pribadi')
          ? AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              title: const Text(
                'Anggota Keluarga',
                style: TextStyle(color: Colors.black),
              ),
            )
          : AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              title: const Text(
                'Anggota Keluarga',
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.delete_forever_outlined),
                  color: Colors.red,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25.0)),
                      ),
                      builder: (BuildContext context) {
                        // return your layout
                        return SizedBox(
                          height: 260,
                          child: Padding(
                            padding: const EdgeInsets.all(25),
                            child: Column(
                              children: [
                                const Icon(Icons.line_axis_sharp),
                                const SizedBox(height: 27),
                                const Text(
                                  'Apa anda yakin ingin menghapus anggota keluarga?',
                                  style: TextStyle(fontSize: 20),
                                ),
                                const SizedBox(height: 12),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(500, 40),
                                    backgroundColor: const Color(0xff3366FF),
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10), // <-- Radius
                                    ),
                                  ),
                                  child: const Text('Batal'),
                                ),
                                const SizedBox(height: 5),
                                OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    fixedSize: const Size(500, 40),
                                    side: const BorderSide(
                                        width: 1.5, color: Color(0xff3366FF)),
                                    textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10), // <-- Radius
                                    ),
                                  ),
                                  child: const Text('Hapus'),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          width: double.infinity,
          height: 480,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 6,
                offset: const Offset(0, 0),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 14, right: 14, top: 15),
                    child: Text(
                      "Nama Lengkap",
                      style: TextStyle(
                        color: Color(0xff888888),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14, top: 8),
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: name,
                        hintStyle: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 14, right: 14, top: 15),
                    child: Text(
                      "NIK",
                      style: TextStyle(
                        color: Color(0xff888888),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14, top: 8),
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: nik,
                        hintStyle: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 14, right: 14, top: 15),
                    child: Text(
                      "Umur",
                      style: TextStyle(
                        color: Color(0xff888888),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14, top: 8),
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: age,
                        hintStyle: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 14, right: 14, top: 15),
                    child: Text(
                      "Jenis Kelamin",
                      style: TextStyle(
                        color: Color(0xff888888),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14, top: 8),
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: gender,
                        hintStyle: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 14, right: 14, top: 15),
                    child: Text(
                      "Hubungan",
                      style: TextStyle(
                        color: Color(0xff888888),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14, top: 8),
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: hub,
                        hintStyle: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}