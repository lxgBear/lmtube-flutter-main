import 'package:flutter/material.dart';

class HInput extends StatelessWidget {
  const HInput({
    super.key,
    this.hint,
    this.onChanged,
    this.onObscureTap,
    this.obscureText = false,
  });

  final String? hint;
  final bool obscureText;
  final VoidCallback? onObscureTap;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    Widget? suffixIcon;
    if (onObscureTap != null) {
      suffixIcon = IconButton(
        icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
        onPressed: onObscureTap,
      );
    }

    return TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: suffixIcon,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        onChanged: onChanged,
        style: theme.textTheme.labelMedium?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ));
  }
}
