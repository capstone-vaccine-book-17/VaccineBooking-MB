import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:w_vaccine/features/auth/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final ValueNotifier<bool> _isShowPass = ValueNotifier(true);
  final ValueNotifier<String> _selectedGender = ValueNotifier('');
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
        // width: double.infinity,
        // height: 375,
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
            /// Full Name
            const Text('Nama Lengkap'),
            const SizedBox(height: 12.0),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Masukan Nama Lengkap',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              validator: (value) {
                if (value == null) {
                  return "Silahkan masukan nama lengkap";
                }
                return null;
              },
            ),
            const SizedBox(height: 12.0),

            /// NIK
            const Text('NIK'),
            const SizedBox(height: 12.0),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Masukan Nomor NIK',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.length != 16) {
                  return "Silahkan masukan 16 digit angka";
                }
                return null;
              },
            ),
            const SizedBox(height: 12.0),

            /// Address / Alamat
            const Text('Alamat'),
            const SizedBox(height: 12.0),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Masukan Alamat',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              validator: (value) {
                if (value == null) {
                  return "Silahkan masukan Alamt";
                }
                return null;
              },
            ),
            const SizedBox(height: 12.0),

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

            /// Gender / Jenis Kelamin
            const Text('Jenis kelamin'),
            const SizedBox(height: 12.0),
            ValueListenableBuilder(
              valueListenable: _selectedGender,
              builder: (context, value, child) {
                return FormField<String>(
                  builder: (field) {
                    return InputDecorator(
                      decoration: const InputDecoration(
                          hintText: 'Pilih jenis kelamin',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          )),
                      isEmpty: _selectedGender.value == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedGender.value,
                          isDense: true,
                          items: ['', 'laki-laki', 'perempuan']
                              .map(
                                (e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            _selectedGender.value = value!;
                          },
                        ),
                      ),
                    );
                  },
                );
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

            /// Register Button
            const SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Daftar'),
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sudah punya akun WVaccine ?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Login',
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
