import 'package:flutter/material.dart';
import 'package:w_vaccine/styles/custom_color.dart';

class FaskesPage extends StatelessWidget {
  const FaskesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/vaccine/detail_faskes2.png",
                width: double.infinity,
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Rs. Abdi Waluyo",
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Image.asset(
                          "assets/vaccine/ic_loc.png",
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          "Jl. HOS. Cokroaminoto No.31-33, RT.1/RW.3, \nGondangdia, Kec. Menteng, Kota Jakarta Pusat, \nDaerah Khusus Ibukota Jakarta 10350",
                          style: TextStyle(
                            fontSize: 14,
                            color: greyColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 13),
                    const Text(
                      "Jadwal",
                      style: TextStyle(
                        fontSize: 16,
                        color: greyColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 13),
                    Container(
                      width: double.infinity,
                      child: const TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "\t\t17 November 2022",
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Image(
                              width: 3,
                              height: 3,
                              image: AssetImage(
                                "assets/vaccine/ic_date.png",
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xff888888),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/vaccine/ic_suntik.png",
                                      width: 20,
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      "Dosis Pertama",
                                      style: TextStyle(
                                        color: blackColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Corona Vac",
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/vaccine/ic_jam.png",
                                  width: 20,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "08:00 - 10:00",
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/vaccine/ic_kuota.png",
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  "1.2 km dari rumah",
                                  style: TextStyle(
                                    color: greyColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Tersisa 70",
                                  style: TextStyle(
                                    color: redColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xff3366FF),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "Pilih",
                                    style: TextStyle(
                                      color: Color(0xffffffff),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/vaccine/ic_suntik.png",
                                      width: 20,
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      "Dosis Kedua",
                                      style: TextStyle(
                                        color: blackColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "AstraZaneca",
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/vaccine/ic_jam.png",
                                  width: 20,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "08:00 - 10:00",
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/vaccine/ic_kuota.png",
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  "1.2 km dari rumah",
                                  style: TextStyle(
                                    color: greyColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Tersisa 70",
                                  style: TextStyle(
                                    color: redColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xff3366FF),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "Pilih",
                                    style: TextStyle(
                                      color: Color(0xffffffff),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100)
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                ),
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Pilih Anggota",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/vaccine/ic_down.png",
                                    width: 25,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    "assets/vaccine/ic_person.png",
                                    width: 25,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Text(
                                            "Afifah",
                                            style: TextStyle(
                                              color: blackColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            "(Pribadi)",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Text(
                                        "NIK : 15781027102010011",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: greyColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          "assets/vaccine/ic_edit.png",
                                          width: 20,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          "assets/vaccine/ic_delete.png",
                                          width: 20,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 21),
                          Container(
                            width: double.infinity,
                            child: const TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "\t\tTambah Keluarga",
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Image(
                                    width: 20,
                                    height: 20,
                                    image: AssetImage(
                                      "assets/vaccine/ic_add_person.png",
                                    ),
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff888888),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 120),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff3366FF),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Pesan Vaksin",
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Pilih Anggota",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Image.asset(
                    "assets/vaccine/ic_up.png",
                    width: 25,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
