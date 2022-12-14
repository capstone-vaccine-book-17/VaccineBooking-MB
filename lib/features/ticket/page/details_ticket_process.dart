import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/features/ticket/model/ticket_model.dart';
import 'package:w_vaccine/features/ticket/page/index_ticket.dart';
import 'package:w_vaccine/features/ticket/page/ticket_all.dart';
import 'package:w_vaccine/features/ticket/view_model/detail_ticket_complete_view_model.dart';
import 'package:w_vaccine/features/ticket/view_model/detail_ticket_process_view_model.dart';
import 'package:w_vaccine/styles/custom_color.dart';

class TicketVaccineProcess extends StatefulWidget {
  const TicketVaccineProcess({super.key});

  @override
  State<TicketVaccineProcess> createState() => _TicketVaccineProcessState();
}

class _TicketVaccineProcessState extends State<TicketVaccineProcess> {
  @override
  Widget build(BuildContext context) {
    final vm =
        Provider.of<DetailTicketProcessViewModel>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: const [
              Text(
                textAlign: TextAlign.start,
                "Tiket Vaksin",
              ),
            ],
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [for (var data in vm.tickets) _cardDetailVaccine(data)],
            ),
          ),
        )));
  }

  Widget _cardDetailVaccine(TicketModel data) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    data.image,
                    width: 20,
                  ),
                  Text(
                    data.detail,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    data.number,
                    style: TextStyle(color: hometopbarclr),
                  ),
                  const SizedBox(height: 40),
                  Row(children: [
                    Text(
                      data.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ]),
                  const SizedBox(height: 6),
                  Row(children: [
                    Text(
                      data.description1,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ]),
                  const SizedBox(height: 12),
                  Row(children: [
                    Text(
                      data.nik,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ]),
                  const SizedBox(height: 6),
                  Row(children: [
                    Text(
                      data.description2,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ]),
                  const SizedBox(height: 12),
                  Row(children: [
                    Text(
                      data.gender,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ]),
                  const SizedBox(height: 6),
                  Row(children: [
                    Text(
                      data.description3,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ]),
                  const SizedBox(height: 12),
                  Row(children: [
                    Text(
                      data.type,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(width: 175),
                    Text(
                      data.vaccine,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ]),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        data.description4,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 198),
                      Text(
                        data.description10,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        data.date,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(width: 140),
                      Text(
                        data.time,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        data.description6,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 120),
                      Text(
                        data.description7,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(children: [
                    Text(
                      data.location,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ]),
                  const SizedBox(height: 6),
                  Row(children: [
                    Text(
                      data.description8,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ]),
                  const SizedBox(height: 25),
                  Column(children: [
                    Text(
                      textAlign: TextAlign.center,
                      data.description9,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ]),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 150, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const IndexTicket(),
                        ),
                      );
                    },
                    child: const Text(
                      "kembali",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
