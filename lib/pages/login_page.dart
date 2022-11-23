import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 62),
            Image.asset(
              "assets/images/Frame.png",
              width: 200,
            ),
            const Text(
              "Selamat Datang",
              style: TextStyle(
                color: Color(0xff888888),
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 24),
            Form(
              child: Container(
                width: double.infinity,
                height: 375,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: Offset(0, 0),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  key: formKey,
                  children: [
                    const Padding(
                      padding:
                          const EdgeInsets.only(left: 14, right: 14, top: 8),
                      child: Text(
                        "Email",
                        style: TextStyle(
                          color: Color(0xff888888),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 14, right: 14, top: 8),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "\tMasukan Alamat Email",
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xff888888),
                          ),
                          border: OutlineInputBorder(
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
                    const Padding(
                      padding:
                          const EdgeInsets.only(left: 14, right: 14, top: 8),
                      child: Text(
                        "Password",
                        style: TextStyle(
                          color: Color(0xff888888),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 14, right: 14, top: 8),
                      child: TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "\tMasukan Password",
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xff888888),
                          ),
                          border: OutlineInputBorder(
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
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff3366FF),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Belum Punya Akun ? ",
                          style: TextStyle(
                            color: Color(0xff050505),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Daftar",
                            style: TextStyle(
                              color: Color(0xff0057FF),
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
