import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/features/vaccine/page/vaccine_session_page.dart';
import 'package:w_vaccine/features/vaccine/view_model/vaccine_view_model.dart';

class IndexVaccine extends StatefulWidget {
  const IndexVaccine({super.key});

  @override
  State<IndexVaccine> createState() => _IndexVaccineState();
}

class _IndexVaccineState extends State<IndexVaccine> {
  final searchController = TextEditingController();
  late VaccineViewModel vm;

  final ValueNotifier<bool> _dosisOne = ValueNotifier(true);
  final ValueNotifier<bool> _dosisTwo = ValueNotifier(false);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm = Provider.of<VaccineViewModel>(context, listen: false);
      vm.getMedFacilitys();
    });

    super.initState();
  }

  void searchMedical() {
    vm.searchMedFacilitys(
        searchtxt: searchController.text.trim(),
        dosis: getDosis(_dosisOne.value, _dosisTwo.value),
        context: context);
  }

  String getDosis(bool a, bool b) {
    String? temp;
    if (a) {
      String a = 'pertama';
      temp = a;
    }
    if (b) {
      String b = 'kedua';
      temp = b;
    }
    return temp!;
  }

  Widget _daftarFaskes(BuildContext context) {
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FaskesPage(
                                data: medfac,
                                id: medfac.medicalFacilitysId!,
                              )));
                },
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
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
                            const Text('Tersedia',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green)),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_city,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '${medfac.city}, ${medfac.province}',
                              style: const TextStyle(color: Colors.black54),
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
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: () {
                            print('Search ${searchController.text}');
                            FocusScope.of(context).unfocus();
                            searchMedical();
                          },
                          child: const Image(
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
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff888888),
                      ),
                      border: const OutlineInputBorder(
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
                                top: Radius.circular(25.0)),
                          ),
                          builder: (BuildContext context) {
                            // return your layout
                            return SizedBox(
                              height: 260,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/png/draghandle.png',
                                        cacheHeight: 6,
                                        cacheWidth: 45,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 30, top: 30, bottom: 8),
                                    child: Text(
                                      'Sort By',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  const Divider(thickness: 2),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Dosis Pertama',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const Spacer(),
                                        ValueListenableBuilder(
                                          valueListenable: _dosisOne,
                                          builder: ((context, value, child) =>
                                              IconButton(
                                                onPressed: () {
                                                  _dosisOne.value =
                                                      !_dosisOne.value;
                                                  _dosisTwo.value =
                                                      !_dosisTwo.value;
                                                },
                                                icon: (_dosisOne.value)
                                                    ? const Icon(
                                                        Icons
                                                            .radio_button_checked,
                                                        size: 35,
                                                        color: Colors.blue,
                                                      )
                                                    : const Icon(
                                                        Icons
                                                            .radio_button_off_outlined,
                                                        size: 35,
                                                        color: Colors.blue,
                                                      ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Dosis Kedua',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const Spacer(),
                                        ValueListenableBuilder(
                                          valueListenable: _dosisTwo,
                                          builder: ((context, value, child) =>
                                              IconButton(
                                                onPressed: () {
                                                  _dosisOne.value =
                                                      !_dosisOne.value;
                                                  _dosisTwo.value =
                                                      !_dosisTwo.value;
                                                },
                                                icon: (_dosisTwo.value)
                                                    ? const Icon(
                                                        Icons
                                                            .radio_button_checked,
                                                        size: 35,
                                                        color: Colors.blue,
                                                      )
                                                    : const Icon(
                                                        Icons
                                                            .radio_button_off_outlined,
                                                        size: 35,
                                                        color: Colors.blue,
                                                      ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
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
                Text(
                  'Jalan di dekat rumahmu ',
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
            )
          ],
        ),
      ),
    );
  }
}
