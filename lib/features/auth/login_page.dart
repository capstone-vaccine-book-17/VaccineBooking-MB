import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:w_vaccine/features/auth/login_view_model.dart';
import 'package:w_vaccine/features/auth/register_page.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/widgets/text_form_custom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginViewModel vm;

  // Form and Text Controller
  final _loginFormKey = GlobalKey<FormState>();
  final _emailCtl = TextEditingController();
  final _passwordCtl = TextEditingController();

  final _initialFocus = FocusNode();

  /// Obsure Password hide and show
  final ValueNotifier<bool> _isShowPass = ValueNotifier(true);

  void login() {
    if (!_loginFormKey.currentState!.validate()) {
      return;
    }
    vm.submit(
      email: _emailCtl.text.trim(),
      pass: _passwordCtl.text.trim(),
    );
  }

  @override
  void initState() {
    super.initState();
    vm = Provider.of<LoginViewModel>(context, listen: false);

    /// Run method on Widget build complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_initialFocus);
    });
  }

  @override
  void dispose() {
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
      key: _loginFormKey,
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
            TextFormCustom(
              controller: _emailCtl,
              focusNode: _initialFocus,
              keyboardType: TextInputType.emailAddress,
              hintText: 'Masukan Alamat Email',
              validator: (value) {
                if (value == null || !EmailValidator.validate(value)) {
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
                return TextFormCustom(
                  controller: _passwordCtl,
                  hintText: 'Masukan Password',
                  valueListenablePass: _isShowPass,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  onFieldSubmitted: (_) => login(),
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
              onPressed: () => login(),
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
