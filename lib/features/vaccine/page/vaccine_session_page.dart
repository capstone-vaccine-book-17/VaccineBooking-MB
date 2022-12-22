import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/dependency_injection/vaccine_data.dart';
import 'package:w_vaccine/features/profile/view_model/index_profile_view_model.dart';
import 'package:w_vaccine/features/vaccine/view_model/session_view_model.dart';
import 'package:w_vaccine/widgets/button_form_custom.dart';

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
  final selectDate = TextEditingController();
  String searchDate = DateFormat('y-MM-d').format(DateTime.now());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm = Provider.of<SessionViewModel>(context, listen: false);
      print(searchDate);
      vm.getSession(id: widget.id, context: context);
      vm.searchses(searchDate);
      print(widget.id);
    });
    super.initState();
  }

  Future _selectDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2024),
    );
    if (date == null) {
      selectDate.text = DateFormat('\t\td MMMM y').format(DateTime.now());
      searchDate = DateFormat('y-MM-d').format(DateTime.now());
      print(searchDate);
      return;
    }
    selectDate.text = DateFormat('\t\td MMMM y').format(date);
    searchDate = DateFormat('y-MM-d').format(date);
    print(searchDate);
  }

  Widget _daftarVaksin(BuildContext context) {
    return Consumer<SessionViewModel>(
      builder: ((context, value, child) {
        final data = value.vaccineSessionDisplay;
        return ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            final session = data[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                            '${session.name}',
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
                            'Tersisa ${session.kuota}',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.red),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              showBottomSheet(context, session.sessionId!);
                            },
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
                      Consumer<IndexProfileViewModel>(
                        builder: (context, value, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(value.name!),
                            const SizedBox(width: 5),
                            Text(
                              "NIK : ${value.nik}",
                            ),
                          ],
                        ),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    widget.data.image!,
                    width: double.infinity,
                  ),
                  Positioned(
                    left: 2,
                    top: 8,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.white.withOpacity(0.4),
                      ),
                      child: const Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.name!,
                      style: const TextStyle(
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
                            style: const TextStyle(
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
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: TextField(
                        // onSubmitted: ((searchDate) => vm.searchses(searchDate)),
                        readOnly: true,
                        onTap: () async {
                          await _selectDate();
                          vm.searchses(searchDate);
                        },
                        controller: selectDate,
                        decoration: InputDecoration(
                          hintText:
                              DateFormat('\t\td MMMM y').format(DateTime.now()),
                          suffixIcon: const Padding(
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
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _daftarVaksin(context),
              const SizedBox(height: 100),
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
              // showBottomSheet(context);
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
                      fontWeight: FontWeight.w800,
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

  Future<dynamic> showBottomSheet(BuildContext context, int sessionId) {
    final vm = Provider.of<SessionViewModel>(context, listen: false);
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Padding(
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
                    decoration: InputDecoration(
                      hintText: 'Tambahkan Anggota Keluarga',
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
                const SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  child: ButtonFormCustom(
                      text: 'Pesan Vaksin',
                      onPressed: () {
                        print(sessionId);
                        vm.booking(context: context, sessionId: sessionId);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
