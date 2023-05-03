// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:contact_dairy_app/path/globals.dart';
import 'package:contact_dairy_app/path/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  Globals globals;

  ThemeProvider({required this.globals});

  void changeMode() async {
    globals.isDarkMode = !globals.isDarkMode;
    notifyListeners();

    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setBool('isDarkMode', globals.isDarkMode);
  }
}

class OneTimeProvider extends ChangeNotifier {
  OneTimeScreen_Modal oneTimeScreen_Modal;

  OneTimeProvider({
    required this.oneTimeScreen_Modal,
  });

  void OneTimeScreen01Access() async {
    oneTimeScreen_Modal.introScreen01 = true;
    oneTimeScreen_Modal.introScreen02 = true;
    notifyListeners();

    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setBool(
        'SingUpPage01', oneTimeScreen_Modal.introScreen01);
    await preferences.setBool(
        'SingUpPage02', oneTimeScreen_Modal.introScreen02);
  }
}

class SingUpAccessProvider extends ChangeNotifier {
  SingUpAccess_Modal singUpAccess_Modal;

  SingUpAccessProvider({
    required this.singUpAccess_Modal,
  });

  void SingUpAccessProviderTrueMode() async {
    singUpAccess_Modal.screen = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setBool('SingUpAccess', singUpAccess_Modal.screen);
  }

  void SingUpAccessProviderFalseMode() async {
    singUpAccess_Modal.screen = false;

    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setBool('SingUpAccess', singUpAccess_Modal.screen);
  }
}

class LoginProvider extends ChangeNotifier {
  SingUp singUp;

  LoginProvider({required this.singUp});

  LoginProviderLogic() async {
    allEmail.add(email!);
    allPassWord.add(passWord!);

    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setStringList('listOfEmail', singUp.email);
    await preferences.setStringList('listOfPassWord', singUp.passWord);
    notifyListeners();
  }
}

class AddPageVariableProvider extends ChangeNotifier {
  List<AddPageVariable> allContact = [];
  List saveAllContact = [];
  AddPageVariable addPageVariable;


  AddPageVariableProvider({required this.addPageVariable});

  void initialization() async {

    addPageVariable.firstName = fc.text;
    addPageVariable.lastName = sc.text;
    addPageVariable.phoneNumber = pnc.text;
    addPageVariable.alternativePhoneNumber = anc.text;
    addPageVariable.email = ec.text;
    addPageVariable.password = pc.text;
    addPageVariable.confirmPassword = cpc.text;
    addPageVariable.address1 = s1.text;
    addPageVariable.address2 = s2.text;
    notifyListeners();

    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString('firstName', addPageVariable.firstName!);
    await preferences.setString('lastName', addPageVariable.lastName!);
    await preferences.setString('phoneNumber', addPageVariable.phoneNumber!);
    await preferences.setString('alternativePhoneNumber', addPageVariable.alternativePhoneNumber!);
    await preferences.setString('email', addPageVariable.email!);
    await preferences.setString('password', addPageVariable.password!);
    await preferences.setString('confirmPassword', addPageVariable.confirmPassword!);
    await preferences.setString('address1', addPageVariable.address1!);
    await preferences.setString('address2', addPageVariable.address2!);
  }

  void AddAllContactInitialization() async {
    allContact.add(AddPageVariable(
      firstName: fc.text,
      lastName: sc.text,
      phoneNumber: pnc.text,
      alternativePhoneNumber: anc.text,
      email: ec.text,
      password: pc.text,
      confirmPassword: cpc.text,
      address1: s1.text,
      address2: s2.text,
    ));

    fc.clear();
    sc.clear();
    pnc.clear();
    anc.clear();
    ec.clear();
    pc.clear();
    cpc.clear();
    s1.clear();
    s2.clear();

    notifyListeners();
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setStringList('allContact', saveAllContact as List<String>);
  }

  void ContactRemove(AddPageVariable contact) async {
    allContact.remove(contact);
    notifyListeners();
  }
}

// class ImagePickerProvider extends ChangeNotifier{
//   ImagePicker_Model imagePicker_Model = ImagePicker_Model(image: "");
//
//
//
//   Future<void> getImageFromCamera() async {
//     ImagePicker picker = ImagePicker();
//     notifyListeners();
//
//     XFile? _image = await picker.pickImage(source: ImageSource.camera);
//
//     String? path = _image!.path;
//
//     if(_image != null){
//       imagePicker_Model.image = File(path);
//     }
//   }
//
//   Future<void> getImageFromGallery() async {
//
//     ImagePicker picker = ImagePicker();
//     notifyListeners();
//
//     XFile? _image = await picker.pickImage(source: ImageSource.gallery);
//
//     String? path = _image!.path;
//
//     if(_image!= null ){
//       imagePicker_Model.image = File(path);
//     }
//
//   }
// }


class CurrentStepProvider extends ChangeNotifier{
  CurrentStep_model currentStep_model = CurrentStep_model(currentStep: 0);

  void currentStepValueIncress() {
    currentStep_model.currentStep++;
    notifyListeners();
  }
  void currentStepValueDecress() {
    currentStep_model.currentStep--;
    notifyListeners();
  }
}


