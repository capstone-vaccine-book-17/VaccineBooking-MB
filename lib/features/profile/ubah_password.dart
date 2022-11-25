import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/features/profile/ubah_password_viewmodel.dart';

class UbahPassword extends StatelessWidget {
  const UbahPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: const Offset(4, 4),
                    )
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 32,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Ubah Password',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
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
                          padding: EdgeInsets.only(
                              left: 14, right: 14, top: 8),
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
                              obscureText: provider.pwdlama,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    provider.pwdlama = !provider.pwdlama;
                                  },
                                  icon: provider.pwdlamaIcn,
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
                          padding: EdgeInsets.only(
                              left: 14, right: 14, top: 8),
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
                              obscureText: provider.pwdbaru,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    provider.pwdbaru = !provider.pwdbaru;
                                  },
                                  icon: provider.pwdbruIcn,
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
                          padding: EdgeInsets.only(
                              left: 14, right: 14, top: 8),
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
                              obscureText: provider.pwdkonfirm,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      provider.pwdkonfirm =
                                          !provider.pwdkonfirm;
                                    },
                                    icon: provider.pwdknfrmIcn),
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
