import 'package:contact_dairy_app/controller/controller_provider.dart';
import 'package:contact_dairy_app/path/globals.dart';
import 'package:contact_dairy_app/path/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingInPage extends StatefulWidget {
  const SingInPage({Key? key}) : super(key: key);

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(26),
        alignment: Alignment.center,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Sing In",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo.shade300,
                      ),
                ),
                Divider(
                  indent: 125,
                  endIndent: 120,
                  thickness: 5,
                  color: Colors.blue.shade700.withOpacity(0.5),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "UserName",
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.blue.shade900.withOpacity(0.7),
                              ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _textEditingController1,
                  decoration: InputDecoration(
                      hintText: "Enter Your Email Id",
                      labelText: "📧 Email",
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (val) {
                    emailIn = val!;
                  },
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Enter Your Email ID";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Text("PassWord",
                        style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _textEditingController2,
                  decoration: InputDecoration(
                      hintText: "Enter Your Email Id Password",
                      labelText: "🔑 Password",
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (val) {
                    passWordIn = val!;
                  },
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Enter Your Email ID passWord";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          // for(int i =0; i < Provider.of<LoginProvider>(context,listen: false).singUp.email.length; i++)
                          //   if(emailIn == Provider.of<LoginProvider>(context,listen: false).singUp.email[i]){
                          //     for(int j = 0; j < Provider.of<LoginProvider>(context,listen: false).singUp.passWord.length; j++)
                          //       if(passWordIn == Provider.of<LoginProvider>(context,listen: false).singUp.passWord[i])
                          //         print("ok");
                          //         Navigator.of(context).pushReplacementNamed('/');
                          //   }

                          for (int i = 0; i < allEmail.length; i++) {
                            if (emailIn == allEmail[i] &&
                                passWordIn == allPassWord[i]) {
                              print("ok");
                              Navigator.of(context).pushReplacementNamed('/');
                              SnackBar snackBar = SnackBar(
                                content: Text("Login Successfull"),
                                backgroundColor: Colors.green,
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              break;
                            } else {
                              SnackBar snackBar = SnackBar(
                                content: Text("Login Failed"),
                                backgroundColor: Colors.red,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              break;
                            }
                          }

                          Provider.of<SingUpAccessProvider>(context,
                                  listen: false)
                              .SingUpAccessProviderTrueMode();
                        }
                      },
                      child: Text("Sing in"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).popAndPushNamed('SingUpPage');
                  },
                  child: Text("Create A New Account?"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
