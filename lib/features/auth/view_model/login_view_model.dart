import 'package:flutter/material.dart';
import 'package:w_vaccine/data/repository/auth_repository.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/features/index_navigation.dart';
import 'package:w_vaccine/styles/nofication.dart';

class LoginViewModel with ChangeNotifier {
  final _authRepo = getIt.get<AuthRepository>();

  void submit({
    required BuildContext context,
    required String email,
    required String pass,
  }) {
    _authRepo.login(
      email: email,
      password: pass,
      onSuccess: (msg) {
        snackbarMessage(context, msg);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const IndexNavigation();
          },
        ));
      },
      onError: (msg) => snackbarMessage(context, msg),
    );
  }
}
