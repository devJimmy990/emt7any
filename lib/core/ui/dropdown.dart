import 'package:flutter/material.dart';

class MyDropdownMenu<T> extends StatelessWidget {
  const MyDropdownMenu(
    this.list, {
    required this.value,
    required this.label,
    required this.onSelected,
    required this.labelBuilder,
    super.key,
  });
  final T? value;
  final List<T> list;
  final void Function(T?)? onSelected;
  final String Function(T) labelBuilder;
  final String label;

  @override
  Widget build(BuildContext context) => DropdownMenu<T>(
    initialSelection: value,
    onSelected: onSelected,
    width: double.infinity,
    textStyle: const TextStyle(fontSize: 16),
    label: Text(label),
    menuStyle: MenuStyle(
      backgroundColor: const WidgetStatePropertyAll(Colors.white),
      elevation: const WidgetStatePropertyAll(3),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
      ),
    ),
    dropdownMenuEntries: list
        .map(
          (item) =>
              DropdownMenuEntry<T>(value: item, label: labelBuilder(item)),
        )
        .toList(),
  );
}
