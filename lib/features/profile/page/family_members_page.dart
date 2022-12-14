import 'package:flutter/material.dart';
import 'package:w_vaccine/dependency_injection/family_data.dart';
import 'package:w_vaccine/features/profile/page/add_family_member_page.dart';
import 'package:w_vaccine/features/profile/page/detail_family_member_page.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/features/profile/view_model/family_member_view_model.dart';
import 'package:w_vaccine/widgets/button_form_custom.dart';

class FamilyMembersPage extends StatefulWidget {
  const FamilyMembersPage({super.key});

  @override
  State<FamilyMembersPage> createState() => _FamilyMembersPageState();
}

class _FamilyMembersPageState extends State<FamilyMembersPage> {
  late FamilyMemberViewModel vm;

  @override
  void initState() {
    vm = Provider.of<FamilyMemberViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Anggota Keluarga',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<FamilyMemberViewModel>(
            builder: (context, value, child) {
              return Column(
                children: <Widget>[
                  const SizedBox(height: 20),

                  for (var data in value.family) _cardFamilyMember(data),

                  /// Add Button
                  const SizedBox(height: 30),
                  child!,
                ],
              );
            },
            child: ButtonFormCustom(
              text: 'Tambah',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddFamilyMemberPage(),
                  ),
                ).whenComplete(
                  () => vm.getFamilyMemberAgain(context: context),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _cardFamilyMember(FamilyMember data) {
    print(data.id);
    return Card(
      elevation: 6,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return DetailFamilyMemberPage(data: data);
            },
          )).whenComplete(
            () => vm.getFamilyMemberAgain(context: context),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text('NIK: ${data.nik}')
                  ],
                ),
              ),
              Container(
                constraints: const BoxConstraints(minWidth: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.relationship,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(data.age.toString())
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
