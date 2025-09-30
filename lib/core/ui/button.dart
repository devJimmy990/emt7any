import 'package:emt7any/core/style/text_style.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button._({
    required this.child,
    required this.onPressed,
    required _ButtonType type,
    super.key,
    this.style,
    this.icon,
  }) : _type = type;

  /// Filled (ElevatedButton)
  factory Button.filled({
    required String label,
    required VoidCallback? onPressed,
    Key? key,
    ButtonStyle? style,
    TextStyle? labelStyle,
  }) => Button._(
    key: key,
    style: style,
    onPressed: onPressed,
    type: _ButtonType.filled,
    child: Text(
      label,
      style: MyTextStyle.label.copyWith(color: Colors.white).merge(labelStyle),
    ),
  );

  /// Text (TextButton)
  factory Button.text({
    required String label,
    required VoidCallback? onPressed,
    Key? key,
    ButtonStyle? style,
  }) => Button._(
    key: key,
    onPressed: onPressed,
    style: style,
    type: _ButtonType.text,
    child: Text(label),
  );

  /// Outlined (OutlinedButton)
  factory Button.outlined({
    required String label,
    required VoidCallback? onPressed,
    Key? key,
    ButtonStyle? style,
  }) => Button._(
    key: key,
    style: style,
    onPressed: onPressed,
    type: _ButtonType.outlined,
    child: Text(label),
  );

  /// Icon (IconButton)
  factory Button.icon({
    required Widget icon,
    required VoidCallback? onPressed,
    Key? key,
    ButtonStyle? style,
  }) => Button._(
    key: key,
    icon: icon,
    style: style,
    onPressed: onPressed,
    type: _ButtonType.icon,
    child: const SizedBox.shrink(),
  );

  final Widget child;
  final _ButtonType _type;
  final Widget? icon;
  final ButtonStyle? style;
  final VoidCallback? onPressed;

  @override
  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case _ButtonType.filled:
        final defaultStyle = ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );

        return ElevatedButton(
          onPressed: onPressed,
          style: style == null ? defaultStyle : style!.merge(defaultStyle),
          child: child,
        );

      case _ButtonType.text:
        return TextButton(onPressed: onPressed, style: style, child: child);

      case _ButtonType.outlined:
        return OutlinedButton(onPressed: onPressed, style: style, child: child);

      case _ButtonType.icon:
        return IconButton(onPressed: onPressed, icon: icon!, style: style);
    }
  }
}

enum _ButtonType { filled, text, outlined, icon }
