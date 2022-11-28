import 'package:aartas_design_system/const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData globalThemeData(context) => ThemeData(
      // primaryColor: burntUmberColor,
      colorScheme: ColorScheme.fromSwatch(accentColor: burntUmberColor),
      fontFamily: "Urbanist",
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(16),
          ),
          textStyle: MaterialStateProperty.all(
            textTheme(context).subtitle1?.apply(fontWeightDelta: 2),
          ),
          foregroundColor: MaterialStateProperty.all(
            themeData(context).scaffoldBackgroundColor,
          ),
          overlayColor: MaterialStateProperty.all(
            textTheme(context).headline6!.color!.withOpacity(0.05),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(16),
          ),
          textStyle: MaterialStateProperty.all(
            textTheme(context).subtitle1?.apply(
                  fontWeightDelta: 2,
                ),
          ),
          backgroundColor: MaterialStateProperty.all(
            textTheme(context).headline6!.color!,
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
              color: textTheme(context).headline6!.color!.withOpacity(0.5),
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
            textTheme(context).subtitle1?.apply(fontWeightDelta: 2),
          ),
          foregroundColor: MaterialStateProperty.all(
            themeData(context).scaffoldBackgroundColor,
          ),
          overlayColor: MaterialStateProperty.all(
            textTheme(context).headline6!.color!.withOpacity(0.05),
          ),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        fillColor:
            MaterialStateProperty.all(textTheme(context).headline6!.color!),
      ),
    );

ThemeData lightThemeData(context) => globalThemeData(context).copyWith(
      scaffoldBackgroundColor: seaShellColor,
      backgroundColor: pearlColor,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        backgroundColor: pearlColor,
        iconTheme: IconThemeData(color: charcoalColor),
      ),
      textTheme: TextTheme(
        headline1: textTheme(context).headline1!.copyWith(
            color: charcoalColor.withOpacity(0.9), fontFamily: "Urbanist"),
        headline2: textTheme(context).headline2!.copyWith(
            color: charcoalColor.withOpacity(0.9), fontFamily: "Urbanist"),
        headline3: textTheme(context).headline3!.copyWith(
            color: charcoalColor.withOpacity(0.9), fontFamily: "Urbanist"),
        headline4: textTheme(context).headline4!.copyWith(
            color: charcoalColor.withOpacity(0.9), fontFamily: "Urbanist"),
        headline5: textTheme(context).headline5!.copyWith(
            color: charcoalColor.withOpacity(0.9), fontFamily: "Urbanist"),
        headline6: textTheme(context).headline6!.copyWith(
            color: charcoalColor.withOpacity(0.9), fontFamily: "Urbanist"),
        subtitle1: textTheme(context).subtitle1!.copyWith(
            color: charcoalColor.withOpacity(0.9), fontFamily: "Urbanist"),
        subtitle2: textTheme(context).subtitle2!.copyWith(
            color: charcoalColor.withOpacity(0.9), fontFamily: "Urbanist"),
        bodyText1: textTheme(context).bodyText1!.copyWith(
            color: charcoalColor.withOpacity(0.6), fontFamily: "Urbanist"),
        bodyText2: textTheme(context).bodyText2!.copyWith(
            color: charcoalColor.withOpacity(0.6), fontFamily: "Urbanist"),
        caption: textTheme(context).caption!.copyWith(
            color: charcoalColor.withOpacity(0.4), fontFamily: "Urbanist"),
      ),
      iconTheme: IconThemeData(color: charcoalColor),
    );

ThemeData darkThemeData(context) => globalThemeData(context).copyWith(
      scaffoldBackgroundColor: charcoalColor,
      backgroundColor: graphiteColor,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        backgroundColor: graphiteColor,
        iconTheme: IconThemeData(color: seaShellColor),
      ),
      textTheme: TextTheme(
        headline1: textTheme(context).headline1!.copyWith(
            color: seaShellColor.withOpacity(0.9), fontFamily: "Urbanist"),
        headline2: textTheme(context).headline2!.copyWith(
            color: seaShellColor.withOpacity(0.9), fontFamily: "Urbanist"),
        headline3: textTheme(context).headline3!.copyWith(
            color: seaShellColor.withOpacity(0.9), fontFamily: "Urbanist"),
        headline4: textTheme(context).headline4!.copyWith(
            color: seaShellColor.withOpacity(0.9), fontFamily: "Urbanist"),
        headline5: textTheme(context).headline5!.copyWith(
            color: seaShellColor.withOpacity(0.9), fontFamily: "Urbanist"),
        headline6: textTheme(context).headline6!.copyWith(
            color: seaShellColor.withOpacity(0.9), fontFamily: "Urbanist"),
        subtitle1: textTheme(context).subtitle1!.copyWith(
            color: seaShellColor.withOpacity(0.9), fontFamily: "Urbanist"),
        subtitle2: textTheme(context).subtitle2!.copyWith(
            color: seaShellColor.withOpacity(0.9), fontFamily: "Urbanist"),
        bodyText1: textTheme(context).bodyText1!.copyWith(
              color: seaShellColor.withOpacity(0.6),
              fontFamily: "Urbanist",
            ),
        bodyText2: textTheme(context).bodyText2!.copyWith(
            color: seaShellColor.withOpacity(0.6), fontFamily: "Urbanist"),
        caption: textTheme(context).caption!.copyWith(
            color: seaShellColor.withOpacity(0.4), fontFamily: "Urbanist"),
      ),
      iconTheme: IconThemeData(color: seaShellColor.withOpacity(0.9)),
    );

class ThemeProvider extends ChangeNotifier {
  SharedPreferences? _sharedPreferences;
  final String _themeKey = "theme-key";
  bool? _isDarkTheme;

  bool get isDarkTheme => _isDarkTheme!;

  ThemeProvider() {
    _isDarkTheme = true;
    _load();
  }

  toggleTheme() {
    _isDarkTheme = !_isDarkTheme!;
    _save();
    notifyListeners();
  }

  _load() async {
    await _initSharedPreferences();
    _isDarkTheme = _sharedPreferences!.getBool(_themeKey) ?? true;
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
