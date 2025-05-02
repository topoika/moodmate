part of "helper.dart";

ThemeData lightTheme = ThemeData(
  primaryColor: primaryColor,
  primarySwatch: primarySwatch,
  primaryColorLight: secondaryColor,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Poppins',
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
);

const primarySwatch = MaterialColor(0xFF7D4CDB, <int, Color>{
  50: Color(0xFFEDE7F6),
  100: Color(0xFFC5CAE9),
  200: Color(0xFF9FA8DA),
  300: Color(0xFF7986CB),
  400: Color(0xFF5C6BC0),
  500: Color(0xFF3F51B5),
  600: Color(0xFF3949AB),
  700: Color(0xFF303F9F),
  800: Color(0xFF283593),
  900: Color(0xFF1A237E),
});

// extension of build context
extension ThemeExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get secondaryColor => Theme.of(this).primaryColorLight;

  // fontFamily
  String get fontFamily => "Kaleko";
}
