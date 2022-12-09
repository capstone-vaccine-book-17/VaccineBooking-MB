import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:w_vaccine/features/profile/view_model/change_email_view_model.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/widgets/button_form_custom.dart';
import 'package:w_vaccine/widgets/text_form_custom.dart';

class ChangeEmailPage extends StatefulWidget {
  const ChangeEmailPage({super.key});

  @override
  State<ChangeEmailPage> createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailCtl = TextEditingController();

  late ChangeEmailViewModel vm;

  void save(context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    vm.submit(context: context, email: _emailCtl.text.trim());
  }

  @override
  void initState() {
    vm = Provider.of<ChangeEmailViewModel>(context, listen: false);
    _emailCtl.text = vm.email;
    super.initState();
  }

  @override
  void dispose() {
    _emailCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Email'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _form(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _form(context) {
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
            const Text('Email'),
            const SizedBox(height: 12.0),
            TextFormCustom(
              controller: _emailCtl,
              textInputAction: TextInputAction.done,
              hintText: 'Masukan email baru',
              onFieldSubmitted: (_) => save(context),
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

            /// Save Button
            ButtonFormCustom(text: 'Simpan', onPressed: () => save(context)),
          ],
        ),
      ),
    );
  }
}
