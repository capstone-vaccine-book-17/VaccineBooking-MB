import 'package:flutter/material.dart';
import 'package:w_vaccine/features/profile/family_members_page.dart';
import 'package:w_vaccine/features/profile/personal_data_page.dart';
import 'package:w_vaccine/features/profile/change_password_page.dart';

import '../../widgets/profile/list_menu.dart';

class IndexProfile extends StatelessWidget {
  const IndexProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: _body(context));
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Card Header
            _cardHeader(),

            /// List All Menu for Navigation
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
                        builder: (context) => const FamilyMembersPage()));
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
                        builder: (context) => const ChangePasswordPage()));
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
      ),
    );
  }

  Widget _cardHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 0,
            blurRadius: 6,
            offset: Offset(4, 4),
          ),
        ],
      ),
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
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 18),
              Text(
                'NIK: 153424982422',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
