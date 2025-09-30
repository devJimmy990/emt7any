import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  const TextInputField({
    required this.label,
    super.key,
    this.icon,
    this.hint,
    this.onChanged,
    this.validator,
    this.lines = 1,
    this.controller,
    this.clear = true,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.maxLength,
  });
  final int lines;
  final int? maxLength;
  final String label;
  final String? hint;
  final IconData? icon;
  final bool enabled, clear;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) => Column(
    spacing: 6,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        widget.label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
      TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        onChanged: (val) {
          widget.onChanged?.call(val);
          setState(() {});
        },
        maxLength: widget.maxLength,
        enabled: widget.enabled,
        maxLines: widget.lines,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey,
          hintText: widget.hint,
          hintStyle: const TextStyle(color: Colors.white),
          border: _roundedBorder(),
          enabledBorder: _roundedBorder(),
          focusedBorder: _roundedBorder(),
          errorBorder: _errorBorder(),
        ),
      ),
    ],
  );
}

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({
    required this.label,
    this.controller,
    this.validator,
    this.icon,
    super.key,
  });
  final Icon? icon;
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) => Column(
    spacing: 6,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        widget.label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
      TextFormField(
        obscureText: obscureText,
        validator: widget.validator,
        controller: widget.controller,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey,
          border: _roundedBorder(),
          enabledBorder: _roundedBorder(),
          focusedBorder: _roundedBorder(),
          errorBorder: _errorBorder(),
          suffixIcon: IconButton(
            icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
            onPressed: () => setState(() => obscureText = !obscureText),
          ),
        ),
      ),
    ],
  );
}

InputBorder _roundedBorder() => OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: const BorderSide(color: Colors.grey, width: 1.5),
);

InputBorder _errorBorder() => OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: const BorderSide(color: Colors.red, width: 1.5),
);
