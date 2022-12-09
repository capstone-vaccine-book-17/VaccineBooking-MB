import 'package:flutter/material.dart';
import 'package:w_vaccine/features/home/index_home.dart';
import 'package:w_vaccine/features/profile/index_profile.dart';
import 'package:w_vaccine/features/ticket/index_ticket.dart';
import 'package:w_vaccine/features/vaccine/index_vaccine.dart';
import 'package:w_vaccine/styles/Wvaccine_icons.dart';
import 'package:w_vaccine/styles/custom_color.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
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
        selectedItemColor: slctdcolor,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(WvaccineIcons.home_outlined),
            label: 'Beranda',
            tooltip: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(WvaccineIcons.vaccine_outlined),
            label: 'Vaksin',
            tooltip: 'Vaksin',
          ),
          BottomNavigationBarItem(
            icon: Icon(WvaccineIcons.ticket_outlined),
            label: 'Tiket',
            tooltip: 'Ticket',
          ),
          BottomNavigationBarItem(
            icon: Icon(WvaccineIcons.people_outlined),
            label: 'Profile',
            tooltip: 'Profile',
          ),
        ],
      ),
    );
  }
}
