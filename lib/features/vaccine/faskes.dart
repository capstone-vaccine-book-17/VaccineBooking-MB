import 'package:flutter/material.dart';
import 'package:w_vaccine/features/vaccine/loading_page.dart';

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
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 13),
                    const SizedBox(
                      width: double.infinity,
                      child: TextField(
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
                    _daftarVaksin(context),
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
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8),
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
                                  "assets/vaccine/ic_down.png",
                                  width: 25,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        _daftarAnggota(context),
                        const SizedBox(height: 21),
                        const SizedBox(
                          width: double.infinity,
                          child: TextField(
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
                        const SizedBox(height: 100),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const LoadingPageBookingVaccine(),
                                ),
                              );
                            },
                            child: const Text("Pesan Vaksin"),
                          ),
                        ),
                      ],
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

  Widget _daftarVaksin(BuildContext context) {
    /// Later will be replaced with model within this view model
    List<Map<String?, String?>> datas = [
      {
        'dosis': 'Dosis Pertama',
        'nama': 'Corona Vac',
        'waktu': '08:00 - 10:00',
        'kuota': '200 Kuota',
        'sisaKuota': 'Tersisa 70',
      },
      {
        'dosis': 'Dosis Kedua',
        'nama': 'AstraZaneca',
        'waktu': '08:00 - 10:00',
        'kuota': '200 Kuota',
        'sisaKuota': 'Tersisa 70',
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          for (var data in datas)
            InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const FaskesPage(),
                //   ),
                // );
              },
              child: Card(
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
                              Text(
                                data['dosis'].toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            data['nama'].toString(),
                            style: const TextStyle(
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
                          Text(
                            data['waktu'].toString(),
                            style: const TextStyle(
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
                          Text(
                            data['kuota'].toString(),
                            style: const TextStyle(
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
                          Text(
                            data['sisaKuota'].toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          ElevatedButton(
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
            ),
        ],
      ),
    );
  }

  Widget _daftarAnggota(BuildContext context) {
    /// Later will be replaced with model within this view model
    List<Map<String?, String?>> datas = [
      {
        'name': 'Afifah',
        'hubunganKeluarga': 'Pribadi',
        'nik': '1578102710200011',
        'status': 'Tersedia',
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          for (var data in datas)
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FaskesPage(),
                  ),
                );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/vaccine/ic_person.png",
                        width: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(data['name'].toString()),
                              const SizedBox(width: 5),
                              Text(data['hubunganKeluarga'].toString()),
                            ],
                          ),
                          Text(
                            "NIK : ${data['nik'].toString()}",
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
            ),
        ],
      ),
    );
  }
}
