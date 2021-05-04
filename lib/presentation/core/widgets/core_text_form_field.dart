import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CoreTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String Function(String) validator;
  final void Function(String) onChanged;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final String labelText;
  final Widget prefixIcon;
  final int maxLength;
  final int minLines;
  final int maxLines;
  final double borderRadius;
  final EdgeInsetsGeometry contentPadding;
  final String counterText;
  final bool autocorrect;
  final bool obscureText;

  const CoreTextFormField({
    Key key,
    this.controller,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.labelText,
    this.prefixIcon,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.borderRadius = 32,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.counterText,
    this.autocorrect = true,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autocorrect: autocorrect,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        counterText: counterText,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).backgroundColor,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: contentPadding,
      ),
      maxLines: maxLines,
      minLines: minLines,
      textAlign: TextAlign.justify,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      maxLength: maxLength,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
    );
  }
}
