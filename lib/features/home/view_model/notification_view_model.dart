import 'package:flutter/widgets.dart';
import 'package:w_vaccine/features/home/model/notification_model.dart';

class NotificationViewModel with ChangeNotifier {
  List<NotificationModel> get notif {
    return [
      NotificationModel(
          when: 'Hari ini, 07:00 pagi',
          title: 'Booking Vaksin Berhasil !',
          description:
              'Hai Afifah, Kamu berhasil booking vaksin di rumahmu sendiri wawakkawkwa'),
      NotificationModel(
          when: 'Hari ini, 07:00 pagi',
          title: 'Booking Vaksin Berhasil !',
          description:
              'Hai Afifah, Kamu berhasil booking vaksin di rumahmu sendiri wawakkawkwa'),
      NotificationModel(
          when: 'Hari ini, 07:00 pagi',
          title: 'Booking Vaksin Berhasil !',
          description:
              'Hai Afifah, Kamu berhasil booking vaksin di rumahmu sendiri wawakkawkwa'),
      NotificationModel(
          when: 'Hari ini, 07:00 pagi',
          title: 'Booking Vaksin Berhasil !',
          description:
              'Hai Afifah, Kamu berhasil booking vaksin di rumahmu sendiri wawakkawkwa'),
    ];
  }
}
