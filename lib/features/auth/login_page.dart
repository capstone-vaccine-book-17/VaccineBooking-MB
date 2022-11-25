import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:w_vaccine/features/auth/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ValueNotifier<bool> _isShowPass = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/Frame.png', width: 200),
                const Text(
                  'Selamat Datang',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _form(),
                ),
              ],
            ),
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
            /// Email
            const Text('Email'),
            const SizedBox(height: 12.0),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Masukan Alamat Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || EmailValidator.validate(value)) {
                  return "Silahkan masukan alamat email dengan benar";
                }
                return null;
              },
            ),
            const SizedBox(height: 12.0),

            /// Password
            const Text('Password'),
            const SizedBox(height: 12.0),
            ValueListenableBuilder(
              valueListenable: _isShowPass,
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: _isShowPass.value,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Masukan Password',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _isShowPass.value = !_isShowPass.value;
                      },
                      icon: Icon(_isShowPass.value
                          ? Icons.enhanced_encryption_outlined
                          : Icons.no_encryption_gmailerrorred_outlined),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return "Silahkan masukan password lebih dari 6";
                    }
                    return null;
                  },
                );
              },
            ),

            const SizedBox(height: 12.0),

            /// Login Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Login'),
            ),
            const SizedBox(height: 12.0),

            /// Go to Register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Belum punya akun?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    'Daftar',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
