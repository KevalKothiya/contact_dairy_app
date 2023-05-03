import 'dart:io';
import 'package:contact_dairy_app/controller/controller_provider.dart';
import 'package:contact_dairy_app/path/globals.dart';
import 'package:contact_dairy_app/path/utils.dart';
import 'package:fa_stepper/fa_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey3 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey4 = GlobalKey<FormState>();
  // int currentStep = 0;
  bool error = false;
  bool error1 = false;
  bool error2 = false;
  bool error3 = false;
  bool error4 = false;
  File? image;

  // String? firstName;
  String? lastName;
  String? phoneNumber;
  String? alternativePhoneNumber;
  String? email;
  String? password;
  String? confirmPassword;
  String? address1;
  String? address2;

  // TextEditingController _fc = TextEditingController();
  // TextEditingController _sc = TextEditingController();
  // TextEditingController _pnc = TextEditingController();
  // TextEditingController _anc = TextEditingController();
  // TextEditingController _ec = TextEditingController();
  // TextEditingController _pc = TextEditingController();
  // TextEditingController _cpc = TextEditingController();
  // TextEditingController _s1 = TextEditingController();
  // TextEditingController _s2 = TextEditingController();

  FAStepperType _faStepperType = FAStepperType.vertical;

  // _type() {
  //   setState(() {
  //     _stepperType == FAStepperType.vertical
  //         ? _stepperType = FAStepperType.horizontal
  //         : _stepperType = FAStepperType.vertical;
  //   });
  // }

  Future<void> getImageFromCamera() async {
    ImagePicker pick = ImagePicker();
    XFile? _image = await pick.pickImage(source: ImageSource.camera);

    String? path = _image!.path;

    if (_image != null) {
      setState(() {
        image = File(path);
      });
    }
  }

  Future<void> getImageFromGallery() async {
    ImagePicker pick = ImagePicker();
    XFile? _image = await pick.pickImage(source: ImageSource.gallery);

    String? path = _image!.path;

    if (_image != null) {
      setState(() {
        image = File(path);
      });
    }
  }

  delete() {
    if (image != null) {
      setState(() {
        image = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double hh = size.height;
    double ww = size.width;
    final canCancel = Provider.of<CurrentStepProvider>(context , listen: false).currentStep_model.currentStep > 0;
    final canContinue = Provider.of<CurrentStepProvider>(context , listen: false).currentStep_model.currentStep < 4;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add"),
        actions: [
          IconButton(
            onPressed: () {
              if (formKey4.currentState!.validate()) {
                formKey4.currentState!.save();
                setState(() {
                  error4 = false;
                });

                Provider.of<AddPageVariableProvider>(context,listen: false).initialization();
                Provider.of<AddPageVariableProvider>(context,listen: false).AddAllContactInitialization();

                print("${Provider.of<AddPageVariableProvider>(context,listen: false).addPageVariable.firstName}");
                print("${Provider.of<AddPageVariableProvider>(context,listen: false).allContact}");

                Provider.of<CurrentStepProvider>(context,listen: false).currentStep_model.currentStep = 0;

                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false).then((value) => setState((){}));
              } else {
                setState(() {
                  error4 = true;
                });
              }
            },
            icon: Icon(
              CupertinoIcons.checkmark_alt_circle,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: FAStepper(
            type: _faStepperType,
            currentStep: Provider.of<CurrentStepProvider>(context).currentStep_model.currentStep,
            controlsBuilder: (context, details) {
              return Container(
                padding:
                    EdgeInsets.only(top: 26, bottom: 16, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                        onPressed: canCancel
                            ? () => setState(() => Provider.of<CurrentStepProvider>(context,listen: false).currentStepValueDecress())
                            : null,
                        child: Text("Cancel")),
                    ElevatedButton(
                        onPressed: canContinue
                            ? () => setState(() {
                                  // if (currentStep == 0 && image == null) {
                                  //   error = true;
                                  // } else if (currentStep == 1) {
                                  //   if (formKey1.currentState!.validate()) {
                                  //     formKey1.currentState!.save();
                                  //     setState(() {
                                  //       currentStep++;
                                  //     });
                                  //   }
                                  // } else if (currentStep == 2) {
                                  //   if (formKey2.currentState!.validate()) {
                                  //     formKey2.currentState!.save();
                                  //     setState(() {
                                  //       currentStep++;
                                  //     });
                                  //   }
                                  // } else if (currentStep == 3) {
                                  //   if (formKey3.currentState!.validate()) {
                                  //     formKey3.currentState!.save();
                                  //     setState(() {
                                  //       currentStep++;
                                  //     });
                                  //   }
                                  // } else if (currentStep == 4) {
                                  //   if (formKey4.currentState!.validate()) {
                                  //     formKey4.currentState!.save();
                                  //     setState(() {
                                  //       error4 = false;
                                  //       currentStep++;
                                  //     });
                                  //   }
                                  // } else {
                                  //   setState(() {
                                  //     currentStep++;
                                  //   });
                                  // }
                                  if (image == null) {
                                    error = true;
                                  } else if (Provider.of<CurrentStepProvider>(context , listen: false).currentStep_model.currentStep == 1) {
                                    if (formKey1.currentState!.validate()) {
                                      formKey1.currentState!.save();
                                      setState(() {
                                        print(
                                            "========================================================");
                                        print(
                                            "${Provider.of<AddPageVariableProvider>(context, listen: false).addPageVariable.firstName}");

                                        print(
                                            "==========================================================");
                                        error1 = false;
                                        Provider.of<CurrentStepProvider>(context , listen: false).currentStepValueIncress();
                                      });
                                    } else {
                                      setState(() {
                                        error1 = true;
                                      });
                                    }
                                  } else if (Provider.of<CurrentStepProvider>(context , listen: false).currentStep_model.currentStep  == 2) {
                                    if (formKey2.currentState!.validate()) {
                                      formKey2.currentState!.save();
                                      setState(() {
                                        error2 = false;
                                        Provider.of<CurrentStepProvider>(context , listen: false).currentStepValueIncress();
                                      });
                                    } else {
                                      setState(() {
                                        error2 = true;
                                      });
                                    }
                                  } else if (Provider.of<CurrentStepProvider>(context , listen: false).currentStep_model.currentStep  == 3) {
                                    if (formKey3.currentState!.validate()) {
                                      formKey3.currentState!.save();
                                      setState(() {
                                        error3 = false;
                                        Provider.of<CurrentStepProvider>(context , listen: false).currentStepValueIncress();
                                      });
                                    } else {
                                      setState(() {
                                        error3 = true;
                                      });
                                    }
                                  } else if (Provider.of<CurrentStepProvider>(context , listen: false).currentStep_model.currentStep == 4) {
                                    if (formKey4.currentState!.validate()) {
                                      formKey4.currentState!.save();
                                      setState(() {
                                        error4 = false;
                                        Provider.of<CurrentStepProvider>(context , listen: false).currentStepValueIncress();
                                      });
                                    } else {
                                      setState(() {
                                        error4 = true;
                                      });
                                    }
                                  } else {
                                    error = false;
                                    Provider.of<CurrentStepProvider>(context , listen: false).currentStepValueIncress();
                                  }
                                })
                            : null,
                        child: Text("Continue")),
                  ],
                ),
              );
            },
            physics: BouncingScrollPhysics(),
            steps: [
              FAStep(
                isActive: (Provider.of<CurrentStepProvider>(context , listen: false).currentStep_model.currentStep >= 0) ? true : false,
                state: (Provider.of<CurrentStepProvider>(context , listen: false).currentStep_model.currentStep > 0)
                    ? FAStepstate.complete
                    : (error == false)
                        ? FAStepstate.editing
                        : FAStepstate.error,
                title: Text("Image Picker"),
                content: Column(
                  children: [
                    Stack(
                      alignment: FractionalOffset.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey.shade700.withOpacity(
                            0.3,
                          ),
                          // foregroundImage:
                          //     (Provider.of<ImagePickerProvider>(context,listen: false).imagePicker_Model.image != null) ? FileImage(Provider.of<ImagePickerProvider>(context).imagePicker_Model.image as File) : null,
                         foregroundImage: (image!=null) ?FileImage(image as File) : null,
                          child: Text(
                            "Add",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        FloatingActionButton.small(
                          onPressed: () {
                            showModalBottomSheet(
                              context: (context),
                              builder: (context) => StatefulBuilder(
                                builder: (context, setState) =>
                                    CupertinoActionSheet(
                                  actions: [
                                    CupertinoActionSheetAction(
                                      onPressed: () {
                                        error = true;
                                        Navigator.pop(context);
                                        delete();
                                      },
                                      isDestructiveAction: true,
                                      isDefaultAction: true,
                                      child: Text(
                                        "Delete Photo",
                                      ),
                                    ),
                                    cupertinoActionSheet1(
                                      context1: "Use Avatar",
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    // CupertinoActionSheetAction(
                                    //   onPressed: () {
                                    //     Navigator.pop(context);
                                    //   },
                                    //   child: Text(
                                    //     "Use Avatar",
                                    //     style: Theme.of(context)
                                    //         .textTheme
                                    //         .bodyMedium,
                                    //   ),
                                    // ),
                                    cupertinoActionSheet1(
                                      context1: "Take Photo",
                                      onPressed: () {
                                        error = false;
                                        // Provider.of<AddPageVariableProvider>(context,listen: false).getImageFromCamera();
                                        // print('${Provider.of<AddPageVariableProvider>(context,listen: false).addPageVariable.image.toString()}');
                                        // getImageFromCamera();
                                        // Provider.of<ImagePickerProvider>(context,listen: false).getImageFromCamera();
                                        Navigator.pop(context);
                                      },
                                    ),
                                    // CupertinoActionSheetAction(
                                    //   onPressed: () {
                                    //     getImageFromCamera();
                                    //     Navigator.pop(context);
                                    //   },
                                    //   child: Text("Take Photo",
                                    //       style: Theme.of(context)
                                    //           .textTheme
                                    //           .bodyMedium),
                                    // ),
                                    cupertinoActionSheet1(
                                      context1: "Choose Photo",
                                      onPressed: () {
                                        error = false;
                                        getImageFromGallery();
                                        Navigator.pop(context);
                                      },
                                    ),
                                    // CupertinoActionSheetAction(
                                    //   onPressed: () {
                                    //     getImageFromGallery();
                                    //     Navigator.pop(context);
                                    //   },
                                    //   child: Text("Choose Photo",
                                    //       style: Theme.of(context)
                                    //           .textTheme
                                    //           .bodyMedium),
                                    // ),
                                  ],
                                  cancelButton: CupertinoActionSheetAction(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    isDefaultAction: true,
                                    child: Text(
                                      "Cancel",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 24,
                                          ),
                                    ),
                                  ),
                                  // cancelButton: GestureDetector(
                                  //
                                  //   child: Container(
                                  //     height: 50,
                                  //     alignment: Alignment.center,
                                  //     child: Text(
                                  //       "Cancel",
                                  //       style: Theme.of(context)
                                  //           .textTheme
                                  //           .bodyMedium!
                                  //           .copyWith(
                                  //               fontSize: 24,
                                  //               fontWeight: FontWeight.w800),
                                  //     ),
                                  //   ),
                                  // ),
                                  // builder: (context) => Container(
                                  //   height: 350,
                                  //   width: double.infinity,
                                  //   child: Column(
                                  //     children: [
                                  //       Text("Delete Photo"),
                                  //       Text("Use Avatar"),
                                  //       Text("Take Photo"),
                                  //       Text("Choose Photo"),
                                  //     ],
                                  //   ),
                                  // ),
                                ),
                              ),
                            );
                          },
                          // onPressed: () {
                          //   showModalBottomSheet(
                          //     context: context,
                          //     builder: (context) {
                          //       return Wrap(
                          //         children: [
                          //           GestureDetector(
                          //             onTap: (){},
                          //             child: ListTile(
                          //               leading: Icon(Icons.share),
                          //               title: Text('Use Avatar'),
                          //             ),
                          //           ),
                          //           GestureDetector(
                          //             onTap: (){},
                          //             child: ListTile(
                          //               leading: Icon(Icons.copy),
                          //               title: Text('Take Photo'),
                          //             ),
                          //           ),
                          //           GestureDetector(
                          //             onTap: (){},
                          //             child: ListTile(
                          //               leading: Icon(Icons.edit),
                          //               title: Text('Choose Photo'),
                          //             ),
                          //           ),
                          //           GestureDetector(
                          //             onTap: (){},
                          //             child: ListTile(
                          //               leading: Icon(Icons.edit),
                          //               title: Text('Cancel'),
                          //             ),
                          //           ),
                          //         ],
                          //       );
                          //     },
                          //   );
                          // },
                          child: Icon(
                            CupertinoIcons.add,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              FAStep(
                isActive: (Provider.of<CurrentStepProvider>(context , listen: false).currentStep_model.currentStep >= 1) ? true : false,
                state: (Provider.of<CurrentStepProvider>(context , listen: false).currentStep_model.currentStep > 1)
                    ? FAStepstate.complete
                    : (Provider.of<CurrentStepProvider>(context , listen: false).currentStep_model.currentStep == 1)
                        ? (error1 == true)
                            ? FAStepstate.error
                            : FAStepstate.editing
                        : FAStepstate.indexed,
                title: Text("Full Name"),
                content: Form(
                  key: formKey1,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: fc,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Enter First Name First";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "First Name",
                              hintText: "Enter First Name"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller:sc,
                          onSaved: (val) {
                            lastName = val;
                          },
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Enter Last Name First";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Surname",
                              hintText: "Enter Last Name"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FAStep(
                isActive: (Provider.of<CurrentStepProvider>(context , listen: false).currentStep_model.currentStep >= 2) ? true : false,
                state: (Provider.of<CurrentStepProvider>(context , listen: false).currentStep_model.currentStep > 2)
                    ? FAStepstate.complete
                    : (Provider.of<CurrentStepProvider>(context , listen: false).currentStep_model.currentStep == 2)
                        ? (error2 == true)
                            ? FAStepstate.error
                            : FAStepstate.editing
                        : FAStepstate.indexed,
                title: Text("Phone"),
                content: Form(
                  key: formKey2,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: pnc,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Enter Mobile Number First";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Mobile Number",
                              hintText: "+91 Enter Mobile Number"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: anc,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Enter Alternative Mobile Number...";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Alternative Number",
                              hintText: "+91 Enter Alternative Mobile Number"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FAStep(
                isActive: (Provider.of<CurrentStepProvider>(context , listen: false).currentStep_model.currentStep >= 3) ? true : false,
                state: (Provider.of<CurrentStepProvider>(context , listen: false).currentStep_model.currentStep > 3)
                    ? FAStepstate.complete
                    : (Provider.of<CurrentStepProvider>(context , listen: false).currentStep_model.currentStep == 3)
                        ? (error3 == true)
                            ? FAStepstate.error
                            : FAStepstate.editing
                        : FAStepstate.indexed,
                title: Text("Email"),
                content: Form(
                  key: formKey3,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: ec,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Enter Email Address First";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          inputFormatters: [
                            FilteringTextInputFormatter.singleLineFormatter,
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "📧Email",
                              hintText: "+Enter Email Address"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: pc,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Password...";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password",
                              hintText: "Enter Password"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: cpc,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "confirm Password...";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "confirm Password",
                              hintText: "Enter confirm Password"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FAStep(
                isActive: (Provider.of<CurrentStepProvider>(context , listen: false).currentStep_model.currentStep >= 4) ? true : false,
                state: (Provider.of<CurrentStepProvider>(context , listen: false).currentStep_model.currentStep > 4)
                    ? FAStepstate.complete
                    : (Provider.of<CurrentStepProvider>(context , listen: false).currentStep_model.currentStep == 4)
                        ? (error4 == true)
                            ? FAStepstate.error
                            : FAStepstate.editing
                        : FAStepstate.indexed,
                title: Text("Address"),
                content: Form(
                  key: formKey4,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: s1,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Enter Address First";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Street",
                              hintText: "Enter Street1"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: s2,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Enter State First ";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Street",
                              hintText: "Enter Address2 "),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // child: CupertinoStepper(
        //   currentStep: i,
        //   type: _stepperType,
        //   onStepContinue: () {},
        //   onStepCancel: () {},
        //   physics: BouncingScrollPhysics(),
        //   steps: _steps,
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(
          () => _faStepperType == FAStepperType.vertical
              ? _faStepperType = FAStepperType.horizontal
              : _faStepperType = FAStepperType.vertical,
        ),
        child: Icon(
          CupertinoIcons.rotate_left_fill,
        ),
      ),
    );
  }

  Widget divider() {
    return Divider(
      thickness: 1,
    );
  }

  Widget cupertinoActionSheet1({
    required context1,
    required onPressed,
  }) {
    return CupertinoActionSheetAction(
      onPressed: onPressed,
      child: Text(context1, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}

// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:cupertino_stepper/cupertino_stepper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class StepperPage extends StatefulWidget {
//   @override
//   _StepperPageState createState() => _StepperPageState();
// }
//
// class _StepperPageState extends State<StepperPage> {
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   int currentStep = 0;
//   File? image;
//   String? firstName;
//   String? lastName;
//   String? phoneNumber;
//   String? alternativePhoneNumber;
//   String? email;
//   String? password;
//   String? confirmPassword;
//   String? address1;
//   String? address2;
//
//   StepperType _stepperType = StepperType.vertical;
//
//   @override
//   Widget build(BuildContext context) {
//     final canCancel = currentStep > 0;
//     final canContinue = currentStep < 4;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Add"),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.check,
//             ),
//           ),
//         ],
//       ),
//       // body: OrientationBuilder(
//       //   builder: (BuildContext context, Orientation orientation) {
//       //     switch (orientation) {
//       //       case Orientation.portrait:
//       //         return _buildStepper(StepperType.vertical);
//       //       case Orientation.landscape:
//       //         return _buildStepper(StepperType.horizontal);
//       //       default:
//       //         throw UnimplementedError(orientation.toString());
//       //     }
//       //   },
//       // ),
//       body: Form(
//         key: formKey,
//         child: Stepper(
//           type: _stepperType,
//           currentStep: currentStep,
//           // onStepTapped: (step) => setState(() => currentStep = step),
//           onStepCancel: canCancel ? () => setState(() => currentStep--) : null,
//           onStepContinue:
//               canContinue ? () => setState(() => currentStep++) : null,
//           steps: [
//             Step(
//               isActive: (currentStep >= 0) ? true : false,
//               state: (currentStep > 0) ? StepState.complete : StepState.editing,
//               title: Text("Image Picker"),
//               content: Column(
//                 children: [
//                   Stack(
//                     alignment: FractionalOffset.bottomRight,
//                     children: [
//                       CircleAvatar(
//                         radius: 60,
//                         backgroundColor: Colors.grey.shade700.withOpacity(
//                           0.3,
//                         ),
//                         child: Text(
//                           "Add",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       FloatingActionButton.small(
//                         onPressed: () {
//                           // Xfile? pick = await
//                         },
//                         child: Icon(
//                           CupertinoIcons.add,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Step(
//               isActive: (currentStep >= 1) ? true : false,
//               state: (currentStep > 1) ? StepState.complete : (currentStep == 1)?StepState.editing:StepState.indexed,
//               title: Text("Full Name"),
//               content: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       onSaved: (val) {
//                         firstName = val;
//                       },
//                       validator: (v) {
//                         if (v!.isEmpty) {
//                           return "Enter First Name First";
//                         } else {
//                           return null;
//                         }
//                       },
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: "First Name",
//                           hintText: "Enter First Name"),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       onSaved: (val) {
//                         lastName = val;
//                       },
//                       validator: (v) {
//                         if (v!.isEmpty) {
//                           return "Enter Last Name First";
//                         } else {
//                           return null;
//                         }
//                       },
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: "Surname",
//                           hintText: "Enter Last Name"),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Step(
//               isActive: (currentStep >= 2) ? true : false,
//               state: (currentStep > 2) ? StepState.complete : (currentStep == 2)?StepState.editing:StepState.indexed,
//               title: Text("Phone"),
//               content: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       onSaved: (val) {
//                         phoneNumber = val;
//                       },
//                       validator: (v) {
//                         if (v!.isEmpty) {
//                           return "Enter Mobile Number First";
//                         } else {
//                           return null;
//                         }
//                       },
//                       keyboardType: TextInputType.number,
//                       inputFormatters: [
//                         FilteringTextInputFormatter.digitsOnly,
//                       ],
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: "Mobile Number",
//                           hintText: "+91 Enter Mobile Number"),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       onSaved: (val) {
//                         alternativePhoneNumber = val;
//                       },
//                       validator: (v) {
//                         if (v!.isEmpty) {
//                           return "Enter Alternative Mobile Number...";
//                         } else {
//                           return null;
//                         }
//                       },
//                       keyboardType: TextInputType.number,
//                       inputFormatters: [
//                         FilteringTextInputFormatter.digitsOnly,
//                       ],
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: "Alternative Number",
//                           hintText: "+91 Enter Alternative Mobile Number"),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Step(
//               isActive: (currentStep >= 3) ? true : false,
//               state: (currentStep > 3) ? StepState.complete : (currentStep == 3)?StepState.editing:StepState.indexed,
//               title: Text("Email"),
//               content: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       onSaved: (val) {
//                         email = val;
//                       },
//                       validator: (v) {
//                         if (v!.isEmpty) {
//                           return "Enter Email Address First";
//                         } else {
//                           return null;
//                         }
//                       },
//                       keyboardType: TextInputType.emailAddress,
//                       inputFormatters: [
//                         FilteringTextInputFormatter.singleLineFormatter,
//                       ],
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: "📧Email",
//                           hintText: "+Enter Email Address"),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       onSaved: (val) {
//                         password = val;
//                       },
//                       validator: (v) {
//                         if (v!.isEmpty) {
//                           return "Password...";
//                         } else {
//                           return null;
//                         }
//                       },
//                       keyboardType: TextInputType.number,
//                       inputFormatters: [
//                         FilteringTextInputFormatter.digitsOnly,
//                       ],
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: "Password",
//                           hintText: "Enter Password"),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       onSaved: (val) {
//                         confirmPassword = val;
//                       },
//                       validator: (v) {
//                         if (v!.isEmpty) {
//                           return "confirm Password...";
//                         } else {
//                           return null;
//                         }
//                       },
//                       keyboardType: TextInputType.number,
//                       inputFormatters: [
//                         FilteringTextInputFormatter.digitsOnly,
//                       ],
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: "confirm Password",
//                           hintText: "Enter confirm Password"),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Step(
//               isActive: (currentStep >= 4) ? true : false,
//               state: (currentStep > 4) ? StepState.complete : (currentStep == 4)?StepState.editing:StepState.indexed,
//               title: Text("Address"),
//               content: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       onSaved: (val) {
//                         address1 = val;
//                       },
//                       validator: (v) {
//                         if (v!.isEmpty) {
//                           return "Enter Address First";
//                         } else {
//                           return null;
//                         }
//                       },
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: "Street",
//                           hintText: "Enter Street1"),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       onSaved: (val) {
//                         address2 = val;
//                       },
//                       validator: (v) {
//                         if (v!.isEmpty) {
//                           return "Enter State First ";
//                         } else {
//                           return null;
//                         }
//                       },
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: "Street",
//                           hintText: "Enter Address2 "),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => setState(
//           () => _stepperType == StepperType.vertical
//               ? _stepperType = StepperType.horizontal
//               : _stepperType = StepperType.vertical,
//         ),
//         child: Icon(
//           CupertinoIcons.rotate_left_fill,
//         ),
//       ),
//     );
//   }
//
//   Stepper _buildStepper(StepperType type) {
//     final canCancel = currentStep > 0;
//     final canContinue = currentStep < 6;
//     return Stepper(
//       type: type,
//       currentStep: currentStep,
//       // onStepTapped: (step) => setState(() => currentStep = step),
//       onStepCancel: canCancel ? () => setState(() => --currentStep) : null,
//       onStepContinue: canContinue ? () => setState(() => ++currentStep) : null,
//       steps: [
//         Step(
//           title: Text("Image Picker"),
//           content: Column(
//             children: [
//               Stack(
//                 alignment: FractionalOffset.bottomRight,
//                 children: [
//                   CircleAvatar(
//                     radius: 60,
//                     backgroundColor: Colors.grey.shade700.withOpacity(
//                       0.3,
//                     ),
//                     child: Text(
//                       "Add",
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   FloatingActionButton.small(
//                     onPressed: () {},
//                     child: Icon(
//                       CupertinoIcons.add,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         Step(
//           title: Text("Full Name"),
//           content: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: "Enter First Name",
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: "Enter Last Name",
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
