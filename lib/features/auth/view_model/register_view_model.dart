import 'package:flutter/material.dart';
import 'package:w_vaccine/data/repository/auth_repository.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/features/auth/model/register_model.dart';
import 'package:w_vaccine/features/auth/page/login_page.dart';
import 'package:w_vaccine/styles/nofication.dart';

class RegisterViewModel with ChangeNotifier {
  final _authRepo = getIt.get<AuthRepository>();
  List<String> get genders => List.unmodifiable(['laki-laki', 'perempuan']);

  void submit({
    required BuildContext context,
    required RegisterModel registerModel,
  }) {
    _authRepo.register(
      registerModel: registerModel,
      onSuccess: (msg) {
        snackbarMessage(context, msg);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const LoginPage();
          },
        ));
      },
      onError: (msg) => snackbarMessage(context, msg),
    );
  }
}
