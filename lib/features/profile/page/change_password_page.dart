import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/features/profile/view_model/change_password_view_model.dart';
import 'package:w_vaccine/widgets/button_form_custom.dart';
import 'package:w_vaccine/widgets/text_form_custom.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late ChangePasswordViewModel vm;

  /// Form and Text Controller
  final _formKey = GlobalKey<FormState>();
  final _oldPass = TextEditingController();
  final _newPass = TextEditingController();
  final _confirmNewPass = TextEditingController();

  /// Obsure Password hide and show
  final _isShowOldPass = ValueNotifier<bool>(true);
  final _isShowNewPass = ValueNotifier<bool>(true);
  final _isShowConfirmNewPass = ValueNotifier<bool>(true);

  final _initialFocus = FocusNode();

  void save() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    vm.submit(
      oldPass: _oldPass.text.trim(),
      newPass: _newPass.text.trim(),
      confirmNewPass: _confirmNewPass.text.trim(),
    );
  }

  @override
  void initState() {
    vm = Provider.of<ChangePasswordViewModel>(context, listen: false);

    /// Run method on Widget build complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_initialFocus);
    });
    super.initState();
  }

  @override
  void dispose() {
    _oldPass.dispose();
    _newPass.dispose();
    _confirmNewPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Password'),
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
      key: _formKey,
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
            /// Old Password
            const Text('Password Lama'),
            const SizedBox(height: 12.0),
            ValueListenableBuilder(
              valueListenable: _isShowOldPass,
              builder: (_, __, ___) {
                return TextFormCustom(
                  focusNode: _initialFocus,
                  valueListenablePass: _isShowOldPass,
                  controller: _oldPass,
                  hintText: 'Masukan password lama',
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silahkan masukan password lama';
                    }
                    return null;
                  },
                );
              },
            ),

            const SizedBox(height: 12.0),

            /// New Password
            const Text('Password Baru'),
            const SizedBox(height: 12.0),
            ValueListenableBuilder(
              valueListenable: _isShowNewPass,
              builder: (_, __, ___) {
                return TextFormCustom(
                  controller: _newPass,
                  valueListenablePass: _isShowNewPass,
                  hintText: 'Masukan password baru',
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return "Silahkan masukan password min 6 digit";
                    }
                    if (value != _confirmNewPass.text) {
                      return 'Password tidak cocok';
                    }
                    return null;
                  },
                );
              },
            ),

            const SizedBox(height: 12.0),

            /// Confirm New Password
            const Text('Konfirmasi Password Baru'),
            const SizedBox(height: 12.0),
            ValueListenableBuilder(
              valueListenable: _isShowConfirmNewPass,
              builder: (_, __, ___) {
                return TextFormCustom(
                  controller: _confirmNewPass,
                  valueListenablePass: _isShowConfirmNewPass,
                  hintText: 'Masukan password lagi',
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => save(),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return "Silahkan masukan password min 6 digit";
                    }
                    if (value != _newPass.text) {
                      return 'Password tidak cocok';
                    }
                    return null;
                  },
                );
              },
            ),
            const SizedBox(height: 12.0),

            /// Save Button
            ButtonFormCustom(text: 'Simpan', onPressed: () => save())
          ],
        ),
      ),
    );
  }
}
