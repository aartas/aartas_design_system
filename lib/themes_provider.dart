import 'package:aartas_design_system/const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData globalThemeData(context) => ThemeData(
      // primaryColor: burntUmberColor,
      colorScheme: ColorScheme.fromSwatch(
          accentColor: burntUmberColor, backgroundColor: pearlColor),
      fontFamily: "Urbanist",
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(16),
          ),
          textStyle: MaterialStateProperty.all(
            textTheme(context).titleMedium?.apply(fontWeightDelta: 2),
          ),
          foregroundColor: MaterialStateProperty.all(
            themeData(context).scaffoldBackgroundColor,
          ),
          overlayColor: MaterialStateProperty.all(
            textTheme(context).titleLarge!.color!.withOpacity(0.05),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(16),
          ),
          textStyle: MaterialStateProperty.all(
            textTheme(context).titleMedium?.apply(
                  fontWeightDelta: 2,
                ),
          ),
          backgroundColor: MaterialStateProperty.all(
            textTheme(context).titleLarge!.color!,
          ),
          foregroundColor: MaterialStateProperty.all(
            themeData(context).scaffoldBackgroundColor,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(16),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              color: textTheme(context).titleLarge!.color!.withOpacity(0.5),
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          textStyle: MaterialStateProperty.all(
            textTheme(context).titleMedium?.apply(fontWeightDelta: 2),
          ),
          foregroundColor: MaterialStateProperty.all(
            themeData(context).scaffoldBackgroundColor,
          ),
          overlayColor: MaterialStateProperty.all(
            textTheme(context).titleLarge!.color!.withOpacity(0.05),
          ),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        fillColor:
            MaterialStateProperty.all(textTheme(context).titleLarge!.color!),
      ),
    );

ThemeData lightThemeData(context) => globalThemeData(context).copyWith(
      scaffoldBackgroundColor: seaShellColor,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: burntUmberColor,
        backgroundColor: pearlColor,
      ),
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        backgroundColor: pearlColor,
        iconTheme: IconThemeData(color: charcoalColor),
      ),
      textTheme: TextTheme(
        displayLarge: textTheme(context).displayLarge!.copyWith(
              color: charcoalColor.withOpacity(0.9),
              fontFamily: "Urbanist",
            ),
        displayMedium: textTheme(context).displayMedium!.copyWith(
              color: charcoalColor.withOpacity(0.9),
              fontFamily: "Urbanist",
            ),
        displaySmall: textTheme(context).displaySmall!.copyWith(
              color: charcoalColor.withOpacity(0.9),
              fontFamily: "Urbanist",
            ),
        headlineLarge: textTheme(context).headlineLarge!.copyWith(
              color: charcoalColor.withOpacity(0.9),
              fontFamily: "Urbanist",
            ),
        headlineMedium: textTheme(context).headlineMedium!.copyWith(
              color: charcoalColor.withOpacity(0.9),
              fontFamily: "Urbanist",
            ),
        headlineSmall: textTheme(context).headlineSmall!.copyWith(
              color: charcoalColor.withOpacity(0.9),
              fontFamily: "Urbanist",
            ),
        titleLarge: textTheme(context).titleLarge!.copyWith(
              color: charcoalColor.withOpacity(0.9),
              fontFamily: "Urbanist",
            ),
        titleMedium: textTheme(context).titleMedium!.copyWith(
              color: charcoalColor.withOpacity(0.9),
              fontFamily: "Urbanist",
            ),
        titleSmall: textTheme(context).titleSmall!.copyWith(
              color: charcoalColor.withOpacity(0.9),
              fontFamily: "Urbanist",
            ),
        bodyLarge: textTheme(context).bodyLarge!.copyWith(
              color: charcoalColor.withOpacity(0.6),
              fontFamily: "Urbanist",
            ),
        bodyMedium: textTheme(context).bodyMedium!.copyWith(
              color: charcoalColor.withOpacity(0.6),
              fontFamily: "Urbanist",
            ),
        bodySmall: textTheme(context).bodySmall!.copyWith(
              color: charcoalColor.withOpacity(0.4),
              fontFamily: "Urbanist",
            ),
      ),
      iconTheme: IconThemeData(color: charcoalColor),
    );

ThemeData darkThemeData(context) => globalThemeData(context).copyWith(
      scaffoldBackgroundColor: charcoalColor,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: burntUmberColor,
        backgroundColor: graphiteColor,
      ),
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        backgroundColor: graphiteColor,
        iconTheme: IconThemeData(color: seaShellColor),
      ),
      textTheme: TextTheme(
        displayLarge: textTheme(context).displayLarge!.copyWith(
              color: seaShellColor.withOpacity(0.9),
              fontFamily: "Urbanist",
            ),
        displayMedium: textTheme(context).displayMedium!.copyWith(
              color: seaShellColor.withOpacity(0.9),
              fontFamily: "Urbanist",
            ),
        displaySmall: textTheme(context).displaySmall!.copyWith(
              color: seaShellColor.withOpacity(0.9),
              fontFamily: "Urbanist",
            ),
        headlineLarge: textTheme(context).headlineLarge!.copyWith(
              color: seaShellColor.withOpacity(0.9),
              fontFamily: "Urbanist",
            ),
        headlineMedium: textTheme(context).headlineMedium!.copyWith(
              color: seaShellColor.withOpacity(0.9),
              fontFamily: "Urbanist",
            ),
        headlineSmall: textTheme(context).headlineSmall!.copyWith(
              color: seaShellColor.withOpacity(0.9),
              fontFamily: "Urbanist",
            ),
        titleLarge: textTheme(context).titleLarge!.copyWith(
              color: seaShellColor.withOpacity(0.9),
              fontFamily: "Urbanist",
            ),
        titleMedium: textTheme(context).titleMedium!.copyWith(
              color: seaShellColor.withOpacity(0.9),
              fontFamily: "Urbanist",
            ),
        titleSmall: textTheme(context).titleSmall!.copyWith(
              color: seaShellColor.withOpacity(0.9),
              fontFamily: "Urbanist",
            ),
        bodyLarge: textTheme(context).bodyLarge!.copyWith(
              color: seaShellColor.withOpacity(0.6),
              fontFamily: "Urbanist",
            ),
        bodyMedium: textTheme(context).bodyMedium!.copyWith(
              color: seaShellColor.withOpacity(0.6),
              fontFamily: "Urbanist",
            ),
        bodySmall: textTheme(context).bodySmall!.copyWith(
              color: seaShellColor.withOpacity(0.4),
              fontFamily: "Urbanist",
            ),
      ),
      iconTheme: IconThemeData(color: seaShellColor.withOpacity(0.9)),
    );

class ThemeProvider extends ChangeNotifier {
  SharedPreferences? _sharedPreferences;
  final String _themeKey = "theme-key";
  bool? _isDarkTheme;

  bool get isDarkTheme => _isDarkTheme!;

  ThemeProvider() {
    _isDarkTheme = false;
    _load();
  }
//
  toggleTheme() {
    _isDarkTheme = !_isDarkTheme!;
    _save();
    notifyListeners();
  }

  _load() async {
    await _initSharedPreferences();
    _isDarkTheme = _sharedPreferences!.getBool(_themeKey) ?? false;
    notifyListeners();
  }

  _save() async {
    await _initSharedPreferences();
    _sharedPreferences!.setBool(_themeKey, _isDarkTheme!);
  }

  _initSharedPreferences() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }
}
