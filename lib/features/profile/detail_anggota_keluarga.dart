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
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Anggota Keluarga',
          style: TextStyle(color: Colors.black),
        ),
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
                  Padding(
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
                        hintStyle: TextStyle(
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
                  Padding(
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
                        hintStyle: TextStyle(
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
                  Padding(
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
                        hintStyle: TextStyle(
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
                  Padding(
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
                        hintStyle: TextStyle(
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
                  Padding(
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
                        hintStyle: TextStyle(
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
