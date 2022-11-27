import 'package:flutter/material.dart';
import 'package:w_vaccine/styles/custom_color.dart';

class IndexVaccine extends StatelessWidget {
  const IndexVaccine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Booking Vaccine",
          style: TextStyle(color: blackColor),
        ),
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
                        padding: EdgeInsets.all(8.0),
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
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/vaccine/faskes2.png",
                          width: 100,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Rs. Abdi Waluyo",
                              style: TextStyle(
                                color: deepBlackColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Jl. HOS. Cokroaminoto No.31-33, \nRT.1/RW.3, Gondangdia, Kec.......",
                              style: TextStyle(
                                fontSize: 14,
                                color: greyColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Dosis Pertama dan Kedua",
                          style: TextStyle(
                            color: deepBlackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Tersedia",
                          style: TextStyle(
                            color: greenColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Image.asset(
                          "assets/vaccine/ic_loc.png",
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          "1.2 km dari rumah",
                          style: TextStyle(
                            color: greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/vaccine/faskes1.png",
                          width: 100,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Rsud Mattaher",
                              style: TextStyle(
                                color: deepBlackColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Jl. HOS. Cokroaminoto No.31-33, \nRT.1/RW.3, Gondangdia, Kec.......",
                              style: TextStyle(
                                fontSize: 14,
                                color: greyColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Dosis Kedua",
                          style: TextStyle(
                            color: deepBlackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Tersedia",
                          style: TextStyle(
                            color: greenColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Image.asset(
                          "assets/vaccine/ic_loc.png",
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          "1.2 km dari rumah",
                          style: TextStyle(
                            color: greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
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
    );
  }
}
