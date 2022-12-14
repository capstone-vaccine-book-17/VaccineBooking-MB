import 'package:flutter/material.dart';
import 'package:w_vaccine/features/ticket/page/ticket_all.dart';
import 'package:w_vaccine/features/ticket/page/ticket_complated.dart';
import 'package:w_vaccine/features/ticket/page/ticket_waiting_queue.dart';
import 'package:w_vaccine/styles/theme.dart';

class IndexTicket extends StatefulWidget {
  const IndexTicket({Key? key}) : super(key: key);

  @override
  State<IndexTicket> createState() => _IndexticketState();
}

class _IndexticketState extends State<IndexTicket> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: testTheme,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120),
            child: AppBar(
              title: const Text(
                'Tiket Vaksin',
              ),
              bottom: const TabBar(
                isScrollable: true,
                labelColor: Colors.black,
                unselectedLabelColor: Color.fromRGBO(96, 140, 206, 0.5),
                indicatorColor: Colors.blue,
                tabs: [
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Semua',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Menunggu Antrian',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      softWrap: true,
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Selesai',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              TicketAll(),
              WaitingQueue(),
              TicketCompleted(),
            ],
          ),
        ),
      ),
    );
  }
}
