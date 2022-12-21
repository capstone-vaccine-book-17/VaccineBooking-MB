import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/dependency_injection/session_data.dart';

class DetailBookViewModel with ChangeNotifier {
  final bookData = getIt.get<SessionData>();

  String get queue => bookData.bookData?.queue ?? '';
  String get name => bookData.bookData?.name ?? '';
  String get nik => bookData.bookData?.nik ?? '';
  String get gender => bookData.bookData?.gender ?? '';
  String get vaccine => bookData.bookData?.vaccine ?? '';
  String get dosis => bookData.bookData?.dosis ?? '';
  String get date => bookData.bookData?.date ?? '';
  String get convDate => bookData.bookData?.convDate ?? '';
  String get startTime => bookData.bookData?.startTime ?? '';
  String get endTime => bookData.bookData?.endTime ?? '';
  String get rsName => bookData.bookData?.rsName ?? '';
}
