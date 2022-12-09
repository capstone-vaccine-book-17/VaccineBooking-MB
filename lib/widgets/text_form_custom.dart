import 'package:flutter/material.dart';

class TextFormCustom extends StatelessWidget {
  const TextFormCustom({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.onFieldSubmitted,
    this.valueListenablePass,
    this.onTap,
  });
  final TextEditingController controller;
  final String hintText;
  final String? Function(String? value) validator;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final void Function(String value)? onFieldSubmitted;
  final ValueNotifier<bool>? valueListenablePass;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Widget? suffixIcon() {
      if (valueListenablePass == null) {
        return null;
      }
      return IconButton(
        onPressed: () {
          valueListenablePass!.value = !valueListenablePass!.value;
        },
        icon: Icon(
          valueListenablePass!.value ? Icons.visibility_off : Icons.visibility,
        ),
      );
    }

    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      obscureText: valueListenablePass?.value ?? false,
      onTap: onTap,
      readOnly: onTap != null ? true : false,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        suffixIcon: suffixIcon(),
      ),
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
    );
  }
}
