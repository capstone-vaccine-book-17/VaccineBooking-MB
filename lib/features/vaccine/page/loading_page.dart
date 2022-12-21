
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/features/vaccine/view_model/loading_view_model.dart';

class LoadingPageBookingVaccine extends StatefulWidget {
  const LoadingPageBookingVaccine({super.key});

  @override
  State<LoadingPageBookingVaccine> createState() =>
      _LoadingPageBookingVaccineState();
}

class _LoadingPageBookingVaccineState extends State<LoadingPageBookingVaccine> {
  @override
  void initState() {
    final vm = Provider.of<LoadBookViewModel>(context, listen: false);
    final data = vm.getBookTicket(context);
    print(data);
    

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 250),
              Text("Tunggu Sebentar",
                  style: Theme.of(context).textTheme.headline6),
              Container(
                width: double.infinity,
                height: 150,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(225),
                  ),
                ),
                child: SizedBox(
                  height: 9,
                  width: 9,
                  child: Lottie.asset("assets/vaccine/loading.json"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
