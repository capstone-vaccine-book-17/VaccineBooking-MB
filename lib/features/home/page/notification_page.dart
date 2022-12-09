import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/features/home/model/notification_model.dart';
import 'package:w_vaccine/features/home/view_model/notification_view_model.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NotificationViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifikasi',

        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [for (var data in vm.notif) _cardNotif(data)],
            ),
          ),
        ),
      ),
    );
  }

  Widget _cardNotif(NotificationModel data) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 76, maxHeight: 76),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.message),
              // child: const FlutterLogo(size: 76),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.when),
                  const SizedBox(height: 4.0),
                  Text(
                    data.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.blue),
                  ),
                  const SizedBox(height: 4.0),
                  Text(data.description, maxLines: 1),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
