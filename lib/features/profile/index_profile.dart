import 'package:flutter/material.dart';
import 'package:w_vaccine/features/profile/page/family_members_page.dart';
import 'package:w_vaccine/features/profile/page/personal_data_page.dart';
import 'package:w_vaccine/features/profile/page/change_password_page.dart';
import 'package:w_vaccine/features/profile/view_model/profile_image_viewmodel.dart';

import '../../widgets/profile/list_menu.dart';
import 'package:provider/provider.dart';

class IndexProfile extends StatefulWidget {
  const IndexProfile({super.key});

  @override
  State<IndexProfile> createState() => _IndexProfileState();
}

class _IndexProfileState extends State<IndexProfile> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileImage>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          elevation: 0,
          toolbarHeight: 80,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Stack(
                          children: [
                            Consumer(
                              builder: (context, proider, _) =>
                                  (provider.image == null)
                                      ? const CircleAvatar(
                                          radius: 55,
                                          backgroundColor: Colors.blue,
                                        )
                                      : ClipOval(
                                          child: Image.file(
                                            provider.image!,
                                            width: 110,
                                            height: 110,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                            ),
                            Positioned(
                              right: -12,
                              bottom: -12,
                              child: SizedBox(
                                height: 65,
                                width: 65,
                                child: GestureDetector(
                                  onTap: () => provider.openGallery(),
                                  child: Image.asset('assets/addimage.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Halo, Afifah Cahyaningsih',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 18),
                            Text(
                              'NIK: 153424982422',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChangePasswordPage()));
                }),
              ),
              ListMenu(
                icon: Icons.exit_to_app_sharp,
                name: 'Keluar Akun',
                func: (() {}),
              ),
            ],
          ),
        ));
  }
}
