import 'package:flutter/material.dart';
import 'package:w_vaccine/styles/custom_color.dart';

class TicketVaccineCompleted extends StatefulWidget {
  const TicketVaccineCompleted({super.key});

  @override
  State<TicketVaccineCompleted> createState() => _TicketVaccineCompletedState();
}

class _TicketVaccineCompletedState extends State<TicketVaccineCompleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: const [
            Text(
              textAlign: TextAlign.start,
              "Tiket Vaksin",
              style: TextStyle(color: blackColor),
            ),
          ],
        ),
      ),
      // ignore: prefer_const_constructors
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      "assets/worldvaksin.png",
                                      width: 20,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Column(
                                  children: const [
                                    Text(
                                      "Detail Pendaftaran",
                                      style: TextStyle(
                                        color: blackColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  children: const [
                                    Text(
                                      "Selesai",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 25),
                                Row(
                                  children: const [
                                    Text(
                                      "Nama Lengkap",
                                      style: TextStyle(
                                        color: greyColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: const [
                                    Text(
                                      "Afifah",
                                      style: TextStyle(
                                        color: blackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: const [
                                    Text(
                                      "No Nik",
                                      style: TextStyle(
                                        color: greyColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: const [
                                    Text(
                                      "157102170201011",
                                      style: TextStyle(
                                        color: blackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: const [
                                    Text(
                                      "Jenis Kelamin",
                                      style: TextStyle(
                                        color: greyColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: const [
                                    Text(
                                      "Perempuan",
                                      style: TextStyle(
                                        color: blackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: const [
                                      Text(
                                        "Jenis Vaksin",
                                        style: TextStyle(
                                          color: greyColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(width: 185),
                                      Text(
                                        "Dosis",
                                        style: TextStyle(
                                          color: greyColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ]),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          "Sinovac",
                                          style: TextStyle(
                                            color: blackColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(width: 200),
                                        Text(
                                          "Pertama",
                                          style: TextStyle(
                                            color: blackColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          "Tanggal Vaksinasi",
                                          style: TextStyle(
                                            color: greyColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(width: 155),
                                        Text(
                                          "Waktu",
                                          style: TextStyle(
                                            color: greyColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: const [
                                      Text(
                                        "17 November 2022",
                                        style: TextStyle(
                                          color: blackColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(width: 120),
                                      Text(
                                        "08.00 - 10.00",
                                        style: TextStyle(
                                          color: blackColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ]),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: const [
                                      Text(
                                        "Lokasi Vaksin",
                                        style: TextStyle(
                                          color: greyColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ]),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          "Rs. Abdi Waluyo",
                                          style: TextStyle(
                                            color: blackColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(children: const [
                                      Text(
                                        textAlign: TextAlign.center,
                                        "Silahkan datang ke lokasi yang telah \n ditentukan tepat waktu",
                                        style: TextStyle(
                                          color: greyColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  primary: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                onPressed: () {},
                child: const Text(
                  "Proses",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
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
