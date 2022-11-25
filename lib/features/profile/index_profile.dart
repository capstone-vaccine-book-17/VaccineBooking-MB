import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:w_vaccine/features/profile/list_menu.dart';

class IndexProfile extends StatelessWidget {
  const IndexProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 17),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back),
                ),
                Text('Profile'),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Halo, Afifah Cahyaningsih',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
          SizedBox(height: 35),
          ListMenu(
            icon: Icons.people,
            name: 'Data Diri',
            func: (() {
              print('data diri ter click');
            }),
          ),
          ListMenu(
            icon: Icons.people_outline_outlined,
            name: 'Anggota Keluarga',
            func: (() {
              print('Anggota Keluarga ter click');
            }),
          ),
          ListMenu(
            icon: Icons.lock,
            name: 'Ubah Password',
            func: (() {
              print('Ubah Password ter click');
            }),
          ),
          ListMenu(
            icon: Icons.exit_to_app,
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
