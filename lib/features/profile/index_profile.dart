import 'package:flutter/material.dart';
import 'package:w_vaccine/data/service/local/shared_pref.dart';
import 'package:w_vaccine/features/profile/page/family_members_page.dart';
import 'package:w_vaccine/features/profile/page/personal_data_page.dart';
import 'package:w_vaccine/features/profile/page/change_password_page.dart';
import 'package:w_vaccine/features/profile/view_model/index_profile_view_model.dart';
import 'package:w_vaccine/features/splash/splash_screen.dart';
import 'package:w_vaccine/styles/Wvaccine_icons.dart';
import '../../widgets/profile/list_menu.dart';
import 'package:provider/provider.dart';

class IndexProfile extends StatefulWidget {
  const IndexProfile({super.key});

  @override
  State<IndexProfile> createState() => _IndexProfileState();
}

class _IndexProfileState extends State<IndexProfile> {
  late IndexProfileViewModel vm;

  @override
  void initState() {
    vm = Provider.of<IndexProfileViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
        toolbarHeight: 80,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                        padding: const EdgeInsets.only(left: 16),
                        child: Stack(
                          children: [
                            Consumer(
                              builder: (context, proider, _) {
                                if (vm.image == null) {
                                  return const CircleAvatar(
                                    radius: 55,
                                    backgroundColor: Colors.blue,
                                  );
                                }
                                return ClipOval(
                                  child: Image.file(
                                    vm.image!,
                                    width: 110,
                                    height: 110,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                            Positioned(
                              right: -12,
                              bottom: -12,
                              child: SizedBox(
                                height: 65,
                                width: 65,
                                child: GestureDetector(
                                  onTap: () => vm.openGallery(),
                                  child: Image.asset('assets/png/addimage.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Halo, ${vm.name}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              'NIK: ${vm.nik}',
                              style: const TextStyle(
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
                icon: WvaccineIcons.people,
                name: 'Data Diri',
                func: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PersonalDataPage()));
                }),
              ),
              ListMenu(
                icon: WvaccineIcons.peoples,
                name: 'Anggota Keluarga',
                size: 18,
                func: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FamilyMembersPage()));
                }),
              ),
              ListMenu(
                icon: WvaccineIcons.lock,
                name: 'Ubah Password',
                func: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChangePasswordPage()));
                }),
              ),
              ListMenu(
                icon: WvaccineIcons.exit_app,
                name: 'Keluar Akun',
                func: (() async {
                  //temporary logout

                  SharedPref token = SharedPref();
                  await token.deleteToken();

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SplashScreen()),
                      (route) => false);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
