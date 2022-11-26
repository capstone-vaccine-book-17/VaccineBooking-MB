import 'package:flutter/material.dart';

class AddFamilyMemberPage extends StatefulWidget {
  const AddFamilyMemberPage({super.key});

  @override
  State<AddFamilyMemberPage> createState() => _AddFamilyMemberPageState();
}

class _AddFamilyMemberPageState extends State<AddFamilyMemberPage> {
  final ValueNotifier<String> _selectedGender = ValueNotifier('');
  final ValueNotifier<String> _selectedRelationship = ValueNotifier('');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Anggota'),
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
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12.0),

            /// NIK
            const Text('NIK'),
            const SizedBox(height: 12.0),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12.0),

            /// Age / Umur
            const Text('Umur'),
            const SizedBox(height: 12.0),
            TextField(
              decoration: InputDecoration(
                suffixIcon: TextButton(
                  onPressed: () {},
                  child: const Text('Ubah'),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12.0),

            /// Gender / Jenis Kelamin
            const Text('Jenis Kelamin'),
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

            /// Relationships / Hubungan
            const Text('Hubungan'),
            const SizedBox(height: 12.0),
            ValueListenableBuilder(
              valueListenable: _selectedRelationship,
              builder: (context, value, child) {
                return FormField<String>(
                  builder: (field) {
                    return InputDecorator(
                      decoration: const InputDecoration(
                          hintText: 'Pilih hubungan keluarga',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          )),
                      isEmpty: _selectedRelationship.value == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedRelationship.value,
                          isDense: true,
                          items: ['', 'ayah', 'ibu', 'anak']
                              .map(
                                (e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            _selectedRelationship.value = value!;
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 12.0),

            /// Save Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
