import 'package:contact_dairy_app/controller/controller_provider.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 20,
        color: Color(0xff1478f8),
        fontWeight: FontWeight.w400,
      )
    ),
    // appBarTheme: AppBarTheme(
    //   backgroundColor: Colors.white,
    //   foregroundColor: Colors.black,
    // ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,  // main colour
      brightness: Brightness.light,
      ),
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
        bodyMedium: TextStyle(
          fontSize: 20,
          color: Color(0xff1478f8),
          fontWeight: FontWeight.w400,
        )
    ),
    // appBarTheme: AppBarTheme(
    //   backgroundColor: Colors.black,
    //   foregroundColor: Colors.white,
    // ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
    ),
  );
}

List<String> allEmail = [];
List<String> allPassWord = [];

String? email;
String? passWord;

String? emailIn;
String? passWordIn;

//changing point

GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
// String? firstName;
TextEditingController fc = TextEditingController();
TextEditingController sc = TextEditingController();
TextEditingController pnc = TextEditingController();
TextEditingController anc = TextEditingController();
TextEditingController ec = TextEditingController();
TextEditingController pc = TextEditingController();
TextEditingController cpc = TextEditingController();
TextEditingController s1 = TextEditingController();
TextEditingController s2 = TextEditingController();
