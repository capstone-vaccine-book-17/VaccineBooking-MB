import 'package:flutter/material.dart';

class DropdownButtonCustom extends StatelessWidget {
  const DropdownButtonCustom({
    super.key,
    required this.valueListenable,
    required this.hintText,
    required this.errorMsg,
    required this.items,
  });

  final ValueNotifier<String> valueListenable;
  final String hintText;
  final String errorMsg;
  final List<String>? items;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueListenable,
      builder: (context, value, child) {
        return DropdownButtonHideUnderline(
          child: DropdownButtonFormField<String?>(
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
            // value: valueListenable.value,
            isDense: true,
            items: items
                ?.map(
                  (e) => DropdownMenuItem<String?>(
                    value: e,
                    child: Text(e),
                  ),
                )
                .toList(),
            onChanged: (value) {
              valueListenable.value = value!;
            },
            validator: (value) {
              if (value == null || value == '') {
                return errorMsg;
              }
              return null;
            },
          ),
        );
      },
    );
  }
}
