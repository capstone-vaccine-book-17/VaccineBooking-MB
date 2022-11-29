import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/features/profile/change_address_view_model.dart';

class ChangeAddressPage extends StatefulWidget {
  const ChangeAddressPage({super.key});

  @override
  State<ChangeAddressPage> createState() => _ChangeAddressPageState();
}

class _ChangeAddressPageState extends State<ChangeAddressPage> {
  late ChangeAddressViewModel vm;

  /// Form and Text Controller
  final _formKey = GlobalKey<FormState>();
  final _newAddressCtl = TextEditingController();
  final _postalCodeCtl = TextEditingController();

  /// Controller for dropdown cities and provinces
  final _selectedCity = ValueNotifier<String>('');
  final _selectedProvince = ValueNotifier<String>('');

  final _initialFocus = FocusNode();

  void save() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    vm.submit(
      newAddress: _newAddressCtl.text.trim(),
      city: _selectedCity.value.trim(),
      province: _selectedProvince.value.trim(),
      postalCode: _postalCodeCtl.text.trim(),
    );
  }

  @override
  void initState() {
    vm = Provider.of<ChangeAddressViewModel>(context, listen: false);

    /// Run method on Widget build complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_initialFocus);
    });
    super.initState();
  }

  @override
  void dispose() {
    _newAddressCtl.dispose();
    _postalCodeCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alamat'),
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
            /// New Address
            const Text('Alamat Baru'),
            const SizedBox(height: 12.0),
            TextFormField(
              focusNode: _initialFocus,
              controller: _newAddressCtl,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value == '') {
                  return "Silahkan masukan alamat";
                }
                return null;
              },
            ),
            const SizedBox(height: 12.0),

            /// City
            const Text('Kota'),
            const SizedBox(height: 12.0),
            ValueListenableBuilder(
              valueListenable: _selectedCity,
              builder: (context, value, child) {
                return DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      hintText: 'Pilih kota',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    // value: vm.selectedGender.value,
                    isDense: true,
                    items: vm.cities
                        .map(
                          (e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      _selectedCity.value = value!;
                    },
                    validator: (value) {
                      if (value == null || value == '') {
                        return "Silahkan pilih kota";
                      }
                      return null;
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 12.0),

            /// Province
            const Text('Provinsi'),
            const SizedBox(height: 12.0),
            ValueListenableBuilder(
              valueListenable: _selectedProvince,
              builder: (context, value, child) {
                return DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      hintText: 'Pilih kota',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    // value: vm.selectedGender.value,
                    isDense: true,
                    items: vm.provinces
                        .map(
                          (e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      _selectedProvince.value = value!;
                    },
                    validator: (value) {
                      if (value == null || value == '') {
                        return "Silahkan pilih provinsi";
                      }
                      return null;
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 12.0),

            /// Postal Code
            const Text('Kode Pos'),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: _postalCodeCtl,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              onFieldSubmitted: (_) => save(),
              validator: (value) {
                if (value == null) {
                  return "Silahkan masukan kode pos dengan benar";
                }
                if (value.length != 5) {
                  return "Kode Pos 5 digits";
                }
                return null;
              },
            ),

            const SizedBox(height: 12.0),

            /// Save Button
            ElevatedButton(
              onPressed: () => save(),
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
