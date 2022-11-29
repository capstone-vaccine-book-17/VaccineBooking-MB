import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:w_vaccine/features/auth/login_page.dart';
import 'package:w_vaccine/features/auth/register_view_model.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterViewModel vm;

  // Form and Text Controller
  final _registerFormKey = GlobalKey<FormState>();
  final _fullNameCtl = TextEditingController();
  final _nikCtl = TextEditingController();
  final _addressCtl = TextEditingController();
  final _emailCtl = TextEditingController();
  final _passwordCtl = TextEditingController();

  final _initialFocus = FocusNode();

  // Obsure Password hide and show
  final _isShowPass = ValueNotifier<bool>(true);

  // Controller for dropdown genders
  final _selectedGender = ValueNotifier<String>('');

  void register() {
    if (!_registerFormKey.currentState!.validate()) {
      return;
    }
    vm.submit(
      fullName: _fullNameCtl.text.trim(),
      nik: _nikCtl.text.trim(),
      address: _addressCtl.text.trim(),
      email: _emailCtl.text.trim(),
      gender: _selectedGender.value,
      pass: _passwordCtl.text.trim(),
    );
  }

  @override
  void initState() {
    vm = Provider.of<RegisterViewModel>(context, listen: false);

    /// Run method on Widget build complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_initialFocus);
    });
    super.initState();
  }

  @override
  void dispose() {
    _fullNameCtl.dispose();
    _nikCtl.dispose();
    _addressCtl.dispose();
    _emailCtl.dispose();
    _passwordCtl.dispose();
    super.dispose();
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
      key: _registerFormKey,
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
              focusNode: _initialFocus,
              controller: _fullNameCtl,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                hintText: 'Masukan Nama Lengkap',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
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
              controller: _nikCtl,
              textInputAction: TextInputAction.next,
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
              controller: _addressCtl,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                hintText: 'Masukan Alamat',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Silahkan masukan Alamat";
                }
                return null;
              },
            ),
            const SizedBox(height: 12.0),

            /// Email
            const Text('Email'),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: _emailCtl,
              textInputAction: TextInputAction.next,
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
                if (value == null ||
                    value.isEmpty ||
                    !EmailValidator.validate(value)) {
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
                return DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      hintText: 'Pilih jenis kelamin',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    // value: vm.selectedGender.value,
                    isDense: true,
                    items: vm.genders
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
                    validator: (value) {
                      if (value == null || value == '') {
                        return "Silahkan pilih jenis kelamin";
                      }
                      return null;
                    },
                  ),
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
                  controller: _passwordCtl,
                  textInputAction: TextInputAction.done,
                  obscureText: _isShowPass.value,
                  keyboardType: TextInputType.visiblePassword,
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
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                  onFieldSubmitted: (_) => register(),
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
              onPressed: () => register(),
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
