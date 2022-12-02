import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/features/profile/view_model/change_password_viewmodel.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Ubah Password',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                    width: double.infinity,
                    height: 375,
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
                      key: formKey,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 14, right: 14, top: 8),
                          child: Text(
                            "Password lama",
                            style: TextStyle(
                              color: Color(0xff888888),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 14, right: 14, top: 8),
                          child: Consumer<ObscureSwitcher>(
                            builder: (context, provider, _) => TextFormField(
                              obscureText: provider.oldpwd,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    provider.oldpwd = !provider.oldpwd;
                                  },
                                  icon: provider.oldpwdIcn,
                                ),
                                hintText: "\tabcd1234",
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
                              validator: (value) {
                                if (value == null || value.length < 2) {
                                  return 'Silakan input nama yang valid';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 14, right: 14, top: 8),
                          child: Text(
                            "Password baru",
                            style: TextStyle(
                              color: Color(0xff888888),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 14, right: 14, top: 8),
                          child: Consumer<ObscureSwitcher>(
                            builder: (context, provider, child) =>
                                TextFormField(
                              obscureText: provider.newpwd,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    provider.newpwd = !provider.newpwd;
                                  },
                                  icon: provider.newpwdIcn,
                                ),
                                hintText: "\tabcd0000",
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
                              validator: (value) {
                                if (value == null || value.length < 2) {
                                  return 'Silakan input nama yang valid';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 14, right: 14, top: 8),
                          child: Text(
                            "Konfirmasi password baru",
                            style: TextStyle(
                              color: Color(0xff888888),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 14, right: 14, top: 8),
                          child: Consumer<ObscureSwitcher>(
                            builder: (context, provider, child) =>
                                TextFormField(
                              obscureText: provider.pwdconfirm,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      provider.pwdconfirm =
                                          !provider.pwdconfirm;
                                    },
                                    icon: provider.pwdcnfrmIcn),
                                hintText: "\tabcd0000",
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
                              validator: (value) {
                                if (value == null || value.length < 2) {
                                  return 'Silakan input nama yang valid';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff3366FF),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 12),
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10), // <-- Radius
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Simpan",
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
