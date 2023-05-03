import 'dart:io';

import 'package:contact_dairy_app/controller/controller_provider.dart';
import 'package:contact_dairy_app/path/globals.dart';
import 'package:contact_dairy_app/path/utils.dart';
import 'package:contact_dairy_app/screens/add_contact_page.dart';
import 'package:contact_dairy_app/screens/home_page.dart';
import 'package:contact_dairy_app/screens/login/details_page.dart';
import 'package:contact_dairy_app/screens/login/singin.dart';
import 'package:contact_dairy_app/screens/login/singup.dart';
import 'package:contact_dairy_app/screens/intro_screens/intro_screen_01.dart';
import 'package:contact_dairy_app/screens/intro_screens/intro_screen_02.dart';
import 'package:contact_dairy_app/screens/logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();

  bool isDarkMode = await preferences.getBool('isDarkMode') ?? false;
  bool singUpPage01 = await preferences.getBool('SingUpPage01') ?? false;
  bool singUpPage02 = await preferences.getBool('SingUpPage02') ?? false;
  bool singUpAccessScreen = await preferences.getBool('SingUpAccess') ?? false;
  allEmail= await preferences.getStringList('listOfEmail') ?? [];
  allPassWord = await preferences.getStringList('listOfPassWord') ?? [];

  String firstName = await preferences.getString('firstName') ?? "";
  String lastName = await preferences.getString('lastName') ?? "";
  String phoneNumber = await preferences.getString('phoneNumber') ?? "";
  String alternativePhoneNumber = await preferences.getString('alternativePhoneNumber') ?? "";
  String email = await preferences.getString('email') ?? "";
  String password = await preferences.getString('password') ?? "";
  String confirmPassword = await preferences.getString('confirmPassword') ?? "";
  String address1 = await preferences.getString('address1') ?? "";
  String address2 = await preferences.getString('address2') ?? "";
  List<String> allContact = await preferences.getStringList('allContact') ?? [];


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(globals: Globals(isDarkMode: isDarkMode)),),
        ChangeNotifierProvider(create: (context) => OneTimeProvider(oneTimeScreen_Modal: OneTimeScreen_Modal(introScreen01: singUpPage01, introScreen02: singUpPage02))),
        ChangeNotifierProvider(create: (context) => SingUpAccessProvider(singUpAccess_Modal: SingUpAccess_Modal(screen: singUpAccessScreen))),
        ChangeNotifierProvider(create: (context) => AddPageVariableProvider(addPageVariable: AddPageVariable(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, alternativePhoneNumber: alternativePhoneNumber, email: email, password: password, confirmPassword: confirmPassword, address1: address1, address2: address2))),
        ChangeNotifierProvider(create: (context) => LoginProvider(singUp: SingUp(email: allEmail, passWord: allPassWord))),
        // ChangeNotifierProvider(create: (context) => ImagePickerProvider(imagePicker_Model: ImagePicker_Model(image: File(" ")))),
        ChangeNotifierProvider(create: (context) => CurrentStepProvider()),
        // ChangeNotifierProvider(create: (context) => ImagePickerProvider(imagePicker_Model: ImagePicker_Model(image: )))
      ],
      builder: (context, _) => MaterialApp(
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: (Provider.of<ThemeProvider>(context).globals.isDarkMode == false) ? ThemeMode.light : ThemeMode.dark,
        initialRoute: 'logo_Screen',
        routes: {
          'add_contact_page': (context) => AddContactPage(),
          'logo_Screen': (context) => Logo(),
          'IntroPage01': (context) => IntroPage01(),
          'IntroPage02': (context) => IntroPage02(),
          'SingUpPage': (context) => SingUpPage(),
          'SingInPage': (context) => SingInPage(),
          'DetailsPage' : (context) => DetailPage(),
          '/': (context) => HomePage(),
        },
      ),
    ),
  );
}
