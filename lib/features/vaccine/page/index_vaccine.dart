import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/features/vaccine/page/vaccine.dart';
import 'package:w_vaccine/features/vaccine/view_model/vaccine_view_model.dart';

class IndexVaccine extends StatefulWidget {
  const IndexVaccine({super.key});

  @override
  State<IndexVaccine> createState() => _IndexVaccineState();
}

class _IndexVaccineState extends State<IndexVaccine> {
  late VaccineViewModel vm;
  final String _valueSort = "";
  final searchController = TextEditingController();

  @override
  void initState() {
    vm = Provider.of<VaccineViewModel>(context, listen: false);
    vm.getMedFacilitys();
    super.initState();
  }

  void searchMedical() {
    vm.searchMedFacilitys(searchtxt: searchController.text.trim());
  }

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
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "\t\tCari Lokasi Faskes",
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: () {
                            print('Search ${searchController.text}');
                            searchMedical();
                          },
                          child: Image(
                            width: 3,
                            height: 3,
                            image: AssetImage(
                              "assets/vaccine/ic_search.png",
                            ),
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
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(32),
                            ),
                          ),
                          builder: (context) => Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  const Text(
                                    "Sort",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  RadioListTile(
                                    value: "Dosis Pertama",
                                    title: const Text("Dosis Pertama"),
                                    groupValue: _valueSort,
                                    onChanged: (dosis) {},
                                  ),
                                  RadioListTile(
                                    value: "Dosis Kedua",
                                    title: const Text("Dosis Kedua"),
                                    groupValue: _valueSort,
                                    onChanged: (dosis) {},
                                  ),
                                ],
                              )),
                        );
                      },
                      icon: Image.asset(
                        "assets/vaccine/ic_filter.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const Text(
                      "Sort By",
                      style: TextStyle(
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
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: _daftarFaskes(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _daftarFaskes(BuildContext context) {
    /// Later will be replaced with model within this view model
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Consumer<VaccineViewModel>(
        builder: (context, value, child) {
          final data = value.vaccine;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final medfac = data[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FaskesPage()));
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
                              child: Image.network(
                                medfac.image!,
                                width: 100,
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    medfac.name!,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  Text(
                                    '${medfac.address} ${medfac.city} ${medfac.province}',
                                    softWrap: false,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Dosis ${medfac.dosis!}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Tersedia',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green)),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_city,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 6),
                            Text(
                              '${medfac.city}, ${medfac.province}',
                              style: TextStyle(color: Colors.black54),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
