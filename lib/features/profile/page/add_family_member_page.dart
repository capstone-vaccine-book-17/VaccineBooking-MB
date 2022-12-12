import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/dependency_injection/family_data.dart';
import 'package:w_vaccine/features/profile/view_model/add_family_member_view_model.dart';
import 'package:w_vaccine/widgets/button_form_custom.dart';
import 'package:w_vaccine/widgets/dropdown_button_custom.dart';
import 'package:w_vaccine/widgets/text_form_custom.dart';

class AddFamilyMemberPage extends StatefulWidget {
  const AddFamilyMemberPage({super.key});

  @override
  State<AddFamilyMemberPage> createState() => _AddFamilyMemberPageState();
}

class _AddFamilyMemberPageState extends State<AddFamilyMemberPage> {
  late AddFamilyMemberViewModel vm;

  /// Form and Text Controller
  final _formKey = GlobalKey<FormState>();
  final _fullNameCtl = TextEditingController();
  final _nikCtl = TextEditingController();
  final _ageCtl = TextEditingController();

  /// Controller for dropdown genders and relationships
  final ValueNotifier<String> _selectedGender = ValueNotifier('');
  final ValueNotifier<String> _selectedRelationship = ValueNotifier('');

  final _initialFocus = FocusNode();

  void save() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    vm.submit(
      context: context,
      familyMember: FamilyMember(
        id: 0, // Generated ID by Server actually
        name: _fullNameCtl.text.trim(),
        nik: _nikCtl.text.trim(),
        age: int.parse(_ageCtl.text),
        gender: _selectedGender.value,
        relationship: _selectedRelationship.value,
      ),
    );
  }

  @override
  void initState() {
    vm = Provider.of<AddFamilyMemberViewModel>(context, listen: false);

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
    _ageCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<FamilyData>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Anggotaa'),
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
            /// Full Name / Nama lengkap
            const Text('Nama Lengkap'),
            const SizedBox(height: 12.0),
            TextFormCustom(
              focusNode: _initialFocus,
              controller: _fullNameCtl,
              hintText: "Masukan Nama Lengkap",
              validator: (value) {
                if (value == null || value == '') {
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
              keyboardType: TextInputType.number,
              hintText: "Masukan nomor NIK",
              validator: (value) {
                if (value == null || value.length != 16) {
                  return "Silahkan masukan 16 digit angka";
                }
                return null;
              },
            ),
            const SizedBox(height: 12.0),

            /// Age / Umur
            const Text('Umur'),
            const SizedBox(height: 12.0),
            TextFormCustom(
              controller: _ageCtl,
              keyboardType: TextInputType.number,
              hintText: 'Masukan umur',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Silahkan masukan umur';
                }
                return null;
              },
            ),
            const SizedBox(height: 12.0),

            /// Gender / Jenis Kelamin
            const Text('Jenis Kelamin'),
            const SizedBox(height: 12.0),
            DropdownButtonCustom(
              valueListenable: _selectedGender,
              hintText: 'Pilih jenis kelamin',
              errorMsg: 'Silahkan pilih jenis kelamin',
              items: vm.genders,
            ),
            const SizedBox(height: 12.0),

            /// Relationships / Hubungan
            const Text('Hubungan'),
            const SizedBox(height: 12.0),
            DropdownButtonCustom(
              valueListenable: _selectedRelationship,
              hintText: 'Pilih hubungan keluarga',
              errorMsg: 'Silahkan pilih hubungan',
              items: vm.relationships,
            ),
            const SizedBox(height: 12.0),

            /// Save Button
            ButtonFormCustom(
              text: 'Simpan',
              onPressed: () => save(),
            ),
          ],
        ),
      ),
    );
  }
}
