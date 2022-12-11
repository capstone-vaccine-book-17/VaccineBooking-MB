// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:w_vaccine/dependency_injection/vaccine_data.dart';
import 'package:w_vaccine/features/vaccine/loading_page.dart';
import 'package:w_vaccine/features/vaccine/view_model/session_view_model.dart';

class FaskesPage extends StatefulWidget {
  const FaskesPage({
    Key? key,
    required this.data,
    required this.id,
  }) : super(key: key);

  final VaccineData data;
  final int id;

  @override
  State<FaskesPage> createState() => _FaskesPageState();
}

class _FaskesPageState extends State<FaskesPage> {
  late SessionViewModel vm;

  @override
  void initState() {
    vm = Provider.of<SessionViewModel>(context, listen: false);

    vm.getSession(id: widget.id);
    print(widget.id);
    super.initState();
  }

  Widget _daftarVaksin(BuildContext context) {
    /// Later will be replaced with model within this view model
    // List<Map<String?, String?>> datas = [
    //   {
    //     'dosis': 'Dosis Pertama',
    //     'nama': 'Corona Vac',
    //     'waktu': '08:00 - 10:00',
    //     'kuota': '200 Kuota',
    //     'sisaKuota': 'Tersisa 70',
    //   },
    //   {
    //     'dosis': 'Dosis Kedua',
    //     'nama': 'AstraZaneca',
    //     'waktu': '08:00 - 10:00',
    //     'kuota': '200 Kuota',
    //     'sisaKuota': 'Tersisa 70',
    //   },
    // ];

    return Consumer<SessionViewModel>(
      builder: ((context, value, child) {
        final data = value.vaccineSession;
        return ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            final session = data[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Card(
                elevation: 3,
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
                                'Dosis ${session.dosis}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            session.vaccine!,
                            maxLines: 2,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54),
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
                            '${session.startTime} - ${session.endTime}',
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
                            '${session.kuota!} Kuota',
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
                            'Tersisa ${session.sessionId}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
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
            );
          },
        );
      }),
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
              onTap: () {},
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              widget.data.image!,
              width: double.infinity,
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.name!,
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
                      Expanded(
                        child: Text(
                          '${widget.data.address!} ${widget.data.city!} ${widget.data.province} ${widget.data.medicalFacilitysId}',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54),
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
                      readOnly: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "\t\tFitur belum tersedia hehe",
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
                ],
              ),
            ),
            _daftarVaksin(context),
            SizedBox(height: 100),
          ],
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
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
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
                            readOnly: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "\t\t(Fitur tidak tersedia hehe)",
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
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
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
}
