import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:w_vaccine/features/auth/model/register_model.dart';
import 'package:w_vaccine/features/auth/page/login_page.dart';
import 'package:w_vaccine/features/auth/view_model/register_view_model.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/widgets/button_form_custom.dart';
import 'package:w_vaccine/widgets/dropdown_button_custom.dart';
import 'package:w_vaccine/widgets/text_form_custom.dart';
import 'package:intl/intl.dart';

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
  final _dateOfBirth = TextEditingController();
  final _emailCtl = TextEditingController();
  final _passwordCtl = TextEditingController();

  final _initialFocus = FocusNode();

  // Obsure Password hide and show
  final _isShowPass = ValueNotifier<bool>(true);

  // Controller for dropdown genders
  final _selectedGender = ValueNotifier<String>('');

  Future _selectDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );
    if (date == null) {
      _dateOfBirth.text = '';
      return;
    }
    _dateOfBirth.text = DateFormat('yyyy-MM-dd').format(date);
  }

  void register(context) {
    if (!_registerFormKey.currentState!.validate()) {
      return;
    }
    vm.submit(
      context: context,
      registerModel: RegisterModel(
        fullName: _fullNameCtl.text.trim(),
        nik: _nikCtl.text.trim(),
        address: _addressCtl.text.trim(),
        gender: _selectedGender.value,
        dateOfBirth: _dateOfBirth.text.trim(),
        email: _emailCtl.text.trim(),
        pass: _passwordCtl.text.trim(),
      ),
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
    _dateOfBirth.dispose();
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
                  child: _form(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _form(context) {
    return Form(
      key: _registerFormKey,
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
            /// Full Name
            const Text('Nama Lengkap'),
            const SizedBox(height: 12.0),
            TextFormCustom(
              focusNode: _initialFocus,
              controller: _fullNameCtl,
              hintText: "Masukan Nama Lengkap",
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
            TextFormCustom(
              controller: _nikCtl,
              hintText: 'Masukan Nomor NIK',
              keyboardType: TextInputType.number,
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
            TextFormCustom(
              controller: _addressCtl,
              hintText: 'Masukan Alamat',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Silahkan masukan Alamat";
                }
                return null;
              },
            ),
            const SizedBox(height: 12.0),

            /// Gender / Jenis Kelamin
            const Text('Jenis kelamin'),
            const SizedBox(height: 12.0),
            DropdownButtonCustom(
              valueListenable: _selectedGender,
              hintText: 'Pilih jenis kelamin',
              errorMsg: "Silahkan pilih jenis kelamin",
              items: vm.genders,
            ),
            const SizedBox(height: 12.0),

            /// Date of birth
            const Text('Tanggal lahir'),
            const SizedBox(height: 12.0),
            TextFormCustom(
              controller: _dateOfBirth,
              hintText: 'Silahkan pilih tanggal lahir',
              onTap: () {
                // FocusScope.of(context).requestFocus(FocusNode());
                _selectDate();
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Silahkan pilih tanggal lahir';
                }
                return null;
              },
            ),
            const SizedBox(height: 12.0),

            /// Email
            const Text('Email'),
            const SizedBox(height: 12.0),
            TextFormCustom(
              controller: _emailCtl,
              hintText: 'Masukan Alamat Email',
              keyboardType: TextInputType.emailAddress,
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

            /// Password
            const Text('Password'),
            const SizedBox(height: 12.0),
            ValueListenableBuilder(
              valueListenable: _isShowPass,
              builder: (_, __, ___) {
                return TextFormCustom(
                  controller: _passwordCtl,
                  hintText: 'Masukan Password',
                  valueListenablePass: _isShowPass,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  onFieldSubmitted: (_) => register(context),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return "Silahkan masukan password min 6 digit";
                    }
                    return null;
                  },
                );
              },
            ),

            /// Register Button
            const SizedBox(height: 12.0),
            ButtonFormCustom(
              text: 'Daftar',
              onPressed: () => register(context),
            ),

            /// Go to Login Page
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
