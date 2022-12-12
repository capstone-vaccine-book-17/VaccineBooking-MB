import 'package:flutter/material.dart';
import 'package:w_vaccine/dependency_injection/family_data.dart';
import 'package:w_vaccine/features/profile/view_model/detail_family_member_view_model.dart';
import 'package:w_vaccine/styles/Wvaccine_icons.dart';
import 'package:provider/provider.dart';

class DetailFamilyMemberPage extends StatefulWidget {
  const DetailFamilyMemberPage({super.key, required this.data});

  final FamilyMember data;

  @override
  State<DetailFamilyMemberPage> createState() => _DetailFamilyMemberState();
}

class _DetailFamilyMemberState extends State<DetailFamilyMemberPage> {
  late DetailFamilyMemberViewModel vm;

  @override
  void initState() {
    vm = Provider.of<DetailFamilyMemberViewModel>(context, listen: false);
    super.initState();
  }

  void deteleConfiration(context) async {
    bool? isDelete = await showModalBottomSheet<bool>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        // return your layout
        return SizedBox(
          height: 260,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Image.asset(
                  'assets/png/draghandle.png',
                  cacheHeight: 6,
                  cacheWidth: 45,
                ),
                const SizedBox(height: 27),
                const Text(
                  'Apa anda yakin ingin menghapus anggota keluarga?',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),

                /// Cancel Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(500, 40),
                    backgroundColor: const Color(0xff3366FF),
                    textStyle: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Batal'),
                ),
                const SizedBox(height: 5),

                /// Delete Button
                OutlinedButton(
                  onPressed: () {
                    vm
                        .deleteFamilyMember(
                          context: context,
                          id: widget.data.id,
                        )

                        /// Close Bottom Sheet and return value to then below
                        .then((value) => Navigator.pop(context, true));
                  },
                  style: OutlinedButton.styleFrom(
                    fixedSize: const Size(500, 40),
                    side:
                        const BorderSide(width: 1.5, color: Color(0xff3366FF)),
                    textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // <-- Radius
                    ),
                  ),
                  child: const Text('Hapus'),
                )
              ],
            ),
          ),
        );
      },
    );

    if (isDelete != null && isDelete == true) {
      Navigator.pop(context);
    }
  }

  Widget _listTileCustome({
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, top: 15),
          child: Text(
            label,
            style: const TextStyle(
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
              hintText: value,
              hintStyle: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Anggota Keluarga',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(WvaccineIcons.delete),
            color: Colors.red,
            onPressed: () => deteleConfiration(context),
          ),
        ],
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
              _listTileCustome(
                label: 'Nama Lengkap',
                value: widget.data.name,
              ),
              _listTileCustome(
                label: 'NIK',
                value: widget.data.nik,
              ),
              _listTileCustome(
                label: 'Umur',
                value: widget.data.age.toString(),
              ),
              _listTileCustome(
                label: 'Jenis Kelamin',
                value: widget.data.nik,
              ),
              _listTileCustome(
                label: 'Hubungan',
                value: widget.data.relationship,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
