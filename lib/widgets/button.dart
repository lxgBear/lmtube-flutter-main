import 'package:flutter/material.dart';
import 'package:mobile/styles/theme.dart';

enum HButtonThemes {
  normal,
  primary;

  HButtonTheme getTheme(BuildContext context) {
    var theme = Theme.of(context);

    switch (this) {
      case HButtonThemes.primary:
        return HButtonTheme(
          color: theme.colorScheme.primary,
          textStyle: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        );
      case HButtonThemes.normal:
      default:
        return HButtonTheme(
          color: HThemeData.getSurfaceContainer(theme),
          textStyle: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        );
    }
  }
}

class HButton extends StatelessWidget {
  const HButton(
    this.text, {
    super.key,
    this.onTap,
    this.theme = HButtonThemes.normal,
  });

  final String text;
  final HButtonThemes theme;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    var _theme = theme.getTheme(context);

    return Ink(
      decoration: BoxDecoration(
          color: _theme.color,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          gradient: _theme.gradient),
      child: InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 16),
            constraints: const BoxConstraints.tightFor(width: double.infinity),
            child: Text(text, style: _theme.textStyle),
          )),
    );
  }
}

class HButtonTheme {
  final Color? color;
  final Gradient? gradient;
  final TextStyle? textStyle;

  const HButtonTheme({this.gradient, this.color, this.textStyle});
}
