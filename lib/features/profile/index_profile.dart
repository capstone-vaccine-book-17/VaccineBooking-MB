import 'package:flutter/material.dart';
import 'package:w_vaccine/features/profile/family_group.dart';

import 'package:w_vaccine/features/profile/list_menu.dart';
import 'package:w_vaccine/features/profile/personal_data_page.dart';
import 'package:w_vaccine/features/profile/ubah_password.dart';

class IndexProfile extends StatelessWidget {
  const IndexProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                child: Text(
                  'Profile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(14),
                      bottomRight: Radius.circular(14)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.grey,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Halo, Afifah Cahyaningsih',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 18),
                          Text(
                            'NIK: 153424982422',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 35),
              ListMenu(
                icon: Icons.person,
                name: 'Data Diri',
                func: (() {
                  print('data diri ter click');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PersonalDataPage()));
                }),
              ),
              ListMenu(
                icon: Icons.people_sharp,
                name: 'Anggota Keluarga',
                func: (() {
                  print('Anggota Keluarga ter click');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AnggotaKeluarga()));
                }),
              ),
              ListMenu(
                icon: Icons.lock,
                name: 'Ubah Password',
                func: (() {
                  print('Ubah Password ter click');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UbahPassword()));
                }),
              ),
              ListMenu(
                icon: Icons.exit_to_app_sharp,
                name: 'Keluar Akun',
                func: (() {
                  print('Keluar Akun ter click');
                }),
              ),
            ],
          ),
        ));
  }
}
