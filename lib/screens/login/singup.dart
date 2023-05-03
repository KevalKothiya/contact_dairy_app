import 'package:contact_dairy_app/controller/controller_provider.dart';
import 'package:contact_dairy_app/path/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(22),
        alignment: Alignment.center,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sing Up",
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
                      "Email",
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
                    email = val!;
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
                    passWord = val!;
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

                          Navigator.of(context)
                              .pushReplacementNamed('/')
                              .then((value) => setState(() {}));

                          Provider.of<LoginProvider>(context, listen: false)
                              .LoginProviderLogic();
                          Provider.of<SingUpAccessProvider>(context,
                                  listen: false)
                              .SingUpAccessProviderTrueMode();
                        }
                      },
                      child: Text("Sing Up"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    if(Provider.of<SingUpAccessProvider>(context,listen: false).singUpAccess_Modal.screen == true){
                      Navigator.of(context).popAndPushNamed('SingInPage');
                    }
                  },
                  child: Text("Alreay SingIn Account?"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
