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
  });
  final TextEditingController controller;
  final String hintText;
  final String? Function(String? value) validator;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final void Function(String value)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
    );
  }
}
