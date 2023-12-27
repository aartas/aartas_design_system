import 'package:aartas_design_system/const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData globalThemeData(context) => ThemeData(
      // primaryColor: burntUmberColor,
      useMaterial3: false,
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
              color: charcoalColor,
              fontFamily: "Urbanist",
            ),
        displayMedium: textTheme(context).displayMedium!.copyWith(
              color: charcoalColor,
              fontFamily: "Urbanist",
            ),
        displaySmall: textTheme(context).displaySmall!.copyWith(
              color: charcoalColor,
              fontFamily: "Urbanist",
            ),
        headlineLarge: textTheme(context).headlineLarge!.copyWith(
              color: charcoalColor,
              fontFamily: "Urbanist",
            ),
        headlineMedium: textTheme(context).headlineMedium!.copyWith(
              color: charcoalColor,
              fontFamily: "Urbanist",
            ),
        headlineSmall: textTheme(context).headlineSmall!.copyWith(
              color: charcoalColor,
              fontFamily: "Urbanist",
            ),
        titleLarge: textTheme(context).titleLarge!.copyWith(
              color: charcoalColor,
              fontFamily: "Urbanist",
            ),
        titleMedium: textTheme(context).titleMedium!.copyWith(
              color: charcoalColor,
              fontFamily: "Urbanist",
            ),
        titleSmall: textTheme(context).titleSmall!.copyWith(
              color: charcoalColor,
              fontFamily: "Urbanist",
            ),
        bodyLarge: textTheme(context).bodyLarge!.copyWith(
              color: charcoalColor,
              fontFamily: "Urbanist",
            ),
        bodyMedium: textTheme(context).bodyMedium!.copyWith(
              color: charcoalColor,
              fontFamily: "Urbanist",
            ),
        bodySmall: textTheme(context).bodySmall!.copyWith(
              color: charcoalColor,
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
              color: seaShellColor,
              fontFamily: "Urbanist",
            ),
        displayMedium: textTheme(context).displayMedium!.copyWith(
              color: seaShellColor,
              fontFamily: "Urbanist",
            ),
        displaySmall: textTheme(context).displaySmall!.copyWith(
              color: seaShellColor,
              fontFamily: "Urbanist",
            ),
        headlineLarge: textTheme(context).headlineLarge!.copyWith(
              color: seaShellColor,
              fontFamily: "Urbanist",
            ),
        headlineMedium: textTheme(context).headlineMedium!.copyWith(
              color: seaShellColor,
              fontFamily: "Urbanist",
            ),
        headlineSmall: textTheme(context).headlineSmall!.copyWith(
              color: seaShellColor,
              fontFamily: "Urbanist",
            ),
        titleLarge: textTheme(context).titleLarge!.copyWith(
              color: seaShellColor,
              fontFamily: "Urbanist",
            ),
        titleMedium: textTheme(context).titleMedium!.copyWith(
              color: seaShellColor,
              fontFamily: "Urbanist",
            ),
        titleSmall: textTheme(context).titleSmall!.copyWith(
              color: seaShellColor,
              fontFamily: "Urbanist",
            ),
        bodyLarge: textTheme(context).bodyLarge!.copyWith(
              color: seaShellColor,
              fontFamily: "Urbanist",
            ),
        bodyMedium: textTheme(context).bodyMedium!.copyWith(
              color: seaShellColor,
              fontFamily: "Urbanist",
            ),
        bodySmall: textTheme(context).bodySmall!.copyWith(
              color: seaShellColor,
              fontFamily: "Urbanist",
            ),
      ),
      iconTheme: IconThemeData(color: seaShellColor),
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
