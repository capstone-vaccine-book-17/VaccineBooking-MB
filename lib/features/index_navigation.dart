import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/features/home/index_home.dart';
import 'package:w_vaccine/features/profile/index_profile.dart';
import 'package:w_vaccine/features/profile/view_model/add_family_member_view_model.dart';
import 'package:w_vaccine/features/profile/view_model/change_address_view_model.dart';
import 'package:w_vaccine/features/profile/view_model/change_email_view_model.dart';
import 'package:w_vaccine/features/ticket/index_ticket.dart';
import 'package:w_vaccine/features/vaccine/index_vaccine.dart';
import 'package:provider/provider.dart';

class IndexNavigation extends StatefulWidget {
  const IndexNavigation({super.key});

  @override
  State<IndexNavigation> createState() => _IndexNavigationState();
}

class _IndexNavigationState extends State<IndexNavigation> {
  int _currentIndexNavigation = 0;

  List<Widget> pages = [
    const IndexHome(),
    const IndexVaccine(),
    const IndexTicket(),
    const IndexProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    print('Build Index Navigation');
    return Scaffold(
      body: IndexedStack(
        index: _currentIndexNavigation,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        /// No need for provider / ValueListenableBuilder cause it will render one widget eventually
        /// And that's Scaffold itself
        onTap: (value) => setState(() => _currentIndexNavigation = value),
        currentIndex: _currentIndexNavigation,
        // backgroundColor: Colors.blue,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
            tooltip: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Vaksin',
            tooltip: 'Vaksin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service),
            label: 'Tiket',
            tooltip: 'Ticket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            tooltip: 'Profile',
          ),
        ],
      ),
    );
  }
}
