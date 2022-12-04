import 'package:flutter/material.dart';
import 'package:w_vaccine/features/vaccine/faskes.dart';
import 'package:w_vaccine/styles/custom_color.dart';

class IndexVaccine extends StatelessWidget {
  const IndexVaccine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Vaccine"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 300,
                  child: const TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "\t\tCari Lokasi Faskes",
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Image(
                          width: 3,
                          height: 3,
                          image: AssetImage(
                            "assets/vaccine/ic_search.png",
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
                const SizedBox(width: 8),
                Column(
                  children: [
                    Image.asset(
                      "assets/vaccine/ic_filter.png",
                      color: greyColor,
                      width: 20,
                      height: 20,
                    ),
                    const Text(
                      "Sort By",
                      style: TextStyle(
                        color: greyColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 9),
            Row(
              children: [
                Image.asset(
                  "assets/vaccine/ic_loc.png",
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 12),
                const Text(
                  "Jl. Yanuar akbar, Jawa barat",
                  style: TextStyle(
                    color: greyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "Faskes Terdekat",
              style: TextStyle(
                color: blackColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            _daftarFaskes(context),
          ],
        ),
      ),
    );
  }

  Widget _daftarFaskes(BuildContext context) {
    /// Later will be replaced with model within this view model
    List<Map<String?, String?>> datas = [
      {
        'image': 'assets/vaccine/faskes2.png',
        'name': 'Rs. Abdi Waluyo',
        'address':
            'Jl. HOS. Cokroaminoto No.31-33, \nRT.1/RW.3, Gondangdia, Kec.......',
        'dosis': 'Dosis Pertama dan Kedua',
        'status': 'Tersedia',
        'city': 'Jakarta Pusat, DKI Jakarta',
      },
      {
        'image': 'assets/vaccine/faskes1.png',
        'name': 'Rsud Mattaher',
        'address':
            'Jl. HOS. Cokroaminoto No.31-33, \nRT.1/RW.3, Gondangdia, Kec.......',
        'dosis': 'Dosis Kedua',
        'status': 'Tersedia',
        'city': 'Jakarta Pusat, DKI Jakarta',
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
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              data['image']!,
                              width: 100,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['name'].toString(),
                              ),
                              Text(
                                data['address'].toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(data['dosis'].toString()),
                          Text(data['status'].toString()),
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
}
