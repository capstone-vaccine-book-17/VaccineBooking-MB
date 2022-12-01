import 'package:flutter/material.dart';
import 'package:w_vaccine/features/profile/model/detail_family_model.dart';
import 'package:w_vaccine/features/profile/page/add_family_member_page.dart';
import 'package:w_vaccine/features/profile/page/detail_family_member.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/features/profile/view_model/familydata_viewmodel.dart';
import 'package:w_vaccine/widgets/button_form_custom.dart';

class FamilyMembersPage extends StatefulWidget {
  const FamilyMembersPage({super.key});

  @override
  State<FamilyMembersPage> createState() => _FamilyMembersPageState();
}

class _FamilyMembersPageState extends State<FamilyMembersPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FamilyData>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Anggota Keluarga',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),

              for (var data in provider.datas) _cardFamilyMember(data),

              /// Add Button
              const SizedBox(height: 30),
              ButtonFormCustom(
                text: 'Tambah',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddFamilyMemberPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardFamilyMember(ModelDetailFamily data) {
    return Card(
      elevation: 6,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return DetailFamily(data: data);
            },
          ));
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
                    Text(data.age)
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

          // ListView.builder(
          //     shrinkWrap: true,
          //     itemCount: provider.datas.length,
          //     itemBuilder: (context, index) {
          //       return GestureDetector(
          //         onTap: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => DetailFamily(
          //                         data: provider.datas[index],
          //                       )));
          //         },
          //         child: Padding(
          //           padding:
          //               const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          //           child: Container(
          //             width: double.infinity,
          //             height: 100,
          //             decoration: BoxDecoration(
          //               borderRadius:
          //                   const BorderRadius.all(Radius.circular(10)),
          //               color: Colors.white,
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: Colors.grey.withOpacity(0.3),
          //                   spreadRadius: 0,
          //                   blurRadius: 6,
          //                   offset: const Offset(0, 0),
          //                 )
          //               ],
          //             ),
          //             child: Padding(
          //               padding: const EdgeInsets.symmetric(
          //                   vertical: 10, horizontal: 12),
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     children: [
          //                       Text(
          //                         provider.datas[index].name,
          //                         style: const TextStyle(
          //                             fontWeight: FontWeight.bold),
          //                       ),
          //                       Text(provider.datas[index].relationship,
          //                           style: const TextStyle(
          //                               fontWeight: FontWeight.bold)),
          //                     ],
          //                   ),
          //                   const SizedBox(
          //                     height: 12,
          //                   ),
          //                   Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     children: [
          //                       Text(
          //                         'NIK: ${provider.datas[index].nik}',
          //                         style: const TextStyle(color: Colors.grey),
          //                       ),
          //                       Text(provider.datas[index].age,
          //                           style: const TextStyle(color: Colors.grey)),
          //                     ],
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       );
          //     }),