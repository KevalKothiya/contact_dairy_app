// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:image_picker/image_picker.dart';

class OneTimeScreen_Modal {
  bool introScreen01;
  bool introScreen02;

  OneTimeScreen_Modal({
    required this.introScreen01,
    required this.introScreen02,
  });
}

class SingUpAccess_Modal {
  bool screen;

  SingUpAccess_Modal({
    required this.screen,
  });
}

class Globals {
  bool isDarkMode;

  Globals({required this.isDarkMode});
}

class SingUp {
  List<String> email;
  List<String> passWord;

  SingUp({
    required this.email,
    required this.passWord,
  });
}

class SingIn {
  List<String> email;
  List<String> passWord;

  SingIn({
    required this.email,
    required this.passWord,
  });
}

class AddPageVariable {

  int currentStep = 0;
  bool error = false;
  // String? image;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? alternativePhoneNumber;
  String? email;
  String? password;
  String? confirmPassword;
  String? address1;
  String? address2;

  AddPageVariable(
      {
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.alternativePhoneNumber,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.address1,
    required this.address2,
  });
}

class Global {
  List allContact;

  Global({
    required this.allContact,
  });
}

class ImagePicker_Model {
  File? image;

  ImagePicker_Model({
     this.image,
});
  //
  // Future<void> getImageFromCamera() async {
  //   ImagePicker pick = ImagePicker();
  //   XFile? _image = await pick.pickImage(source: ImageSource.camera);
  //
  //   String? path = _image!.path;
  //
  //   if (_image != null) {
  //     image = File(path);
  //   }
  // }
  //
  // Future<void> getImageFromGallery() async {
  //   ImagePicker pick = ImagePicker();
  //   XFile? _image = await pick.pickImage(source: ImageSource.gallery);
  //
  //   String? path = _image!.path;
  //
  //   if (_image != null) {
  //     image = File(path);
  //   }
  // }
}
class CurrentStep_model {
  int currentStep;

  CurrentStep_model({
    required this.currentStep,
});
}


