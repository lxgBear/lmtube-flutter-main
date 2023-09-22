import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

class HThemeData {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: _textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.surface,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        // contentTextStyle: _textTheme.titleMedium!.apply(color: _darkFillColor),
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFC0000F),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFFFDAD5),
    onPrimaryContainer: Color(0xFF410002),
    secondary: Color(0xFF775652),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFFFDAD5),
    onSecondaryContainer: Color(0xFF2C1512),
    tertiary: Color(0xFF715B2E),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFDDFA6),
    onTertiaryContainer: Color(0xFF261A00),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    outline: Color(0xFF857370),
    background: Color(0xFFFFFBFF),
    onBackground: Color(0xFF201A19),
    surface: Color(0xFFFFF8F7),
    onSurface: Color(0xFF201A19),
    surfaceVariant: Color(0xFFF5DDDA),
    onSurfaceVariant: Color(0xFF534341),
    inverseSurface: Color(0xFF362F2E),
    onInverseSurface: Color(0xFFFBEEEC),
    inversePrimary: Color(0xFFFFB4AA),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFC0000F),
    outlineVariant: Color(0xFFD8C2BF),
    scrim: Color(0xFF000000),
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFFFB4AA),
    onPrimary: Color(0xFF690004),
    primaryContainer: Color(0xFF930009),
    onPrimaryContainer: Color(0xFFFFDAD5),
    secondary: Color(0xFFE7BDB7),
    onSecondary: Color(0xFF442926),
    secondaryContainer: Color(0xFF5D3F3C),
    onSecondaryContainer: Color(0xFFFFDAD5),
    tertiary: Color(0xFFDFC38C),
    onTertiary: Color(0xFF3F2E04),
    tertiaryContainer: Color(0xFF574419),
    onTertiaryContainer: Color(0xFFFDDFA6),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    outline: Color(0xFFA08C8A),
    background: Color(0xFF201A19),
    onBackground: Color(0xFFEDE0DE),
    surface: Color(0xFF181211),
    onSurface: Color(0xFFD0C4C2),
    surfaceVariant: Color(0xFF534341),
    onSurfaceVariant: Color(0xFFD8C2BF),
    inverseSurface: Color(0xFFEDE0DE),
    onInverseSurface: Color(0xFF201A19),
    inversePrimary: Color(0xFFC0000F),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFFFB4AA),
    outlineVariant: Color(0xFF534341),
    scrim: Color(0xFF000000),
  );

  static const TextTheme _textTheme = TextTheme();

  static Color getSurfaceDim(ThemeData theme) {
    CorePalette p = CorePalette.of(theme.primaryColor.value);
    return Color(p.neutral.get(theme.brightness == Brightness.dark ? 6 : 87));
  }

  static Color getSurfaceBright(ThemeData theme) {
    CorePalette p = CorePalette.of(theme.primaryColor.value);
    return Color(p.neutral.get(theme.brightness == Brightness.dark ? 24 : 98));
  }

  static Color getSurfaceContainerLowest(ThemeData theme) {
    CorePalette p = CorePalette.of(theme.primaryColor.value);
    return Color(p.neutral.get(theme.brightness == Brightness.dark ? 4 : 100));
  }

  static Color getSurfaceContainerLow(ThemeData theme) {
    CorePalette p = CorePalette.of(theme.primaryColor.value);
    return Color(p.neutral.get(theme.brightness == Brightness.dark ? 10 : 96));
  }

  static Color getSurfaceContainer(ThemeData theme) {
    CorePalette p = CorePalette.of(theme.primaryColor.value);
    return Color(p.neutral.get(theme.brightness == Brightness.dark ? 12 : 94));
  }

  static Color getSurfaceContainerHigh(ThemeData theme) {
    CorePalette p = CorePalette.of(theme.primaryColor.value);
    return Color(p.neutral.get(theme.brightness == Brightness.dark ? 17 : 92));
  }

  static Color getSurfaceContainerHighest(ThemeData theme) {
    CorePalette p = CorePalette.of(theme.primaryColor.value);
    return Color(p.neutral.get(theme.brightness == Brightness.dark ? 22 : 90));
  }
}
