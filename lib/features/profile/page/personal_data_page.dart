import 'package:flutter/material.dart';
import 'package:w_vaccine/dependency_injection/profile_data.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/features/profile/page/change_address_page.dart';
import 'package:w_vaccine/features/profile/page/change_email_page.dart';

class PersonalDataPage extends StatefulWidget {
  const PersonalDataPage({super.key});

  @override
  State<PersonalDataPage> createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  final profileData = getIt.get<ProfileData>();

  final _addressCtl = TextEditingController();
  final _emailCtl = TextEditingController();

  @override
  void initState() {
    _addressCtl.text = profileData.address?.address ?? 'empty';
    _emailCtl.text = profileData.email ?? 'empty';
    super.initState();
  }

  @override
  void dispose() {
    _addressCtl.dispose();
    _emailCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Diri'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _form(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _form() {
    return Form(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Nama lengkap
            const Text('Nama Lengkap'),
            const SizedBox(height: 12.0),
            TextFormField(
              readOnly: true,
              initialValue: profileData.fullName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            const SizedBox(height: 12.0),

            /// NIK
            const Text('NIK'),
            const SizedBox(height: 12.0),
            TextFormField(
              readOnly: true,
              initialValue: profileData.nik,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            const SizedBox(height: 12.0),

            /// Alamat
            const Text('Alamat'),
            const SizedBox(height: 12.0),
            TextFormField(
              readOnly: true,
              controller: _addressCtl,
              decoration: InputDecoration(
                suffixIcon: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangeAddressPage(),
                      ),
                    ).whenComplete(() => _addressCtl.text =
                        profileData.address?.address ?? 'empty');
                  },
                  child: const Text('Ubah'),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12.0),

            /// Email
            const Text('Email'),
            const SizedBox(height: 12.0),
            TextFormField(
              readOnly: true,
              controller: _emailCtl,
              decoration: InputDecoration(
                suffixIcon: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangeEmailPage(),
                      ),
                    ).whenComplete(
                      () => _emailCtl.text = profileData.email ?? 'empty',
                    );
                  },
                  child: const Text('Ubah'),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12.0),

            /// Jenis Kelamin
            const Text('Jenis Kelamin'),
            const SizedBox(height: 12.0),
            TextFormField(
              readOnly: true,
              initialValue: profileData.gender,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }
}
