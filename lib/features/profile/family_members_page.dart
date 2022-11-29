import 'package:flutter/material.dart';
import 'package:w_vaccine/features/profile/add_family_member_page.dart';
import 'package:w_vaccine/features/profile/detail_family_member.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/features/profile/detail_family_model.dart';
import 'package:w_vaccine/features/profile/familydata_viewmodel.dart';

class FamilyMembersPage extends StatefulWidget {
  const FamilyMembersPage({super.key});

  @override
  State<FamilyMembersPage> createState() => _FamilyMembersPageState();
}

class _FamilyMembersPageState extends State<FamilyMembersPage> {
  Widget build(BuildContext context) {
    final provider = Provider.of<FamilyData>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Anggota Keluarga',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: provider.datas.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailFamily(
                              data: provider.datas[index],
                            )));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 0,
                        blurRadius: 6,
                        offset: const Offset(0, 0),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              provider.datas[index].name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(provider.datas[index].relationship,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'NIK: ${provider.datas[index].nik}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            Text(provider.datas[index].age,
                                style: const TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff3366FF),
              padding:
                  const EdgeInsets.symmetric(horizontal: 145, vertical: 15),
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // <-- Radius
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddFamilyMemberPage()));
            },
            child: const Text(
              "Tambah",
              style: TextStyle(
                color: Color(0xffffffff),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
