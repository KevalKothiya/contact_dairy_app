import 'dart:io';

import 'package:contact_dairy_app/controller/controller_provider.dart';
import 'package:contact_dairy_app/path/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print(
                  "${Provider.of<LoginProvider>(context, listen: false).singUp.email}");
              print(
                  "${Provider.of<LoginProvider>(context, listen: false).singUp.passWord}");
            },
            icon: Icon(CupertinoIcons.info),
          ),
          IconButton(
            onPressed: () =>
                Provider.of<ThemeProvider>(context, listen: false).changeMode(),
            icon: CircleAvatar(
              radius: 16,
              backgroundColor:
                  (Provider.of<ThemeProvider>(context).globals.isDarkMode ==
                          false)
                      ? Colors.black
                      : Colors.white,
              child: CircleAvatar(
                radius: 14,
                backgroundColor:
                    (Provider.of<ThemeProvider>(context).globals.isDarkMode ==
                            false)
                        ? Colors.white
                        : Colors.black,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor:
                      (Provider.of<ThemeProvider>(context).globals.isDarkMode ==
                              false)
                          ? Colors.black
                          : Colors.white,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.logout_rounded),
            onPressed: () {
              Provider.of<SingUpAccessProvider>(context, listen: false)
                  .SingUpAccessProviderFalseMode();

              Navigator.of(context).popAndPushNamed('SingInPage');
            },
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: (Provider.of<AddPageVariableProvider>(context, listen: false)
              .allContact
              .isNotEmpty)
          ? ListView.builder(
        padding: EdgeInsets.all(16),
              itemCount:
                  Provider.of<AddPageVariableProvider>(context, listen: false)
                      .allContact
                      .length,
              itemBuilder: (context, i) => Card(
                child: ListTile(
                  trailing: IconButton(
                    icon: Icon(Icons.call,color: Colors.green,),
                    onPressed: (){},
                  ),
                  // leading: CircleAvatar(radius: 16,backgroundColor: Colors.grey,foregroundImage: (Provider.of<ImagePickerProvider>(context,listen: false).imagePicker_Model.image == " ")?FileImage(Provider.of<ImagePickerProvider>(context).imagePicker_Model.image as File):null,),
                  leading: CircleAvatar(radius: 16,backgroundColor: Colors.grey),
                  title: Text(
                      "${Provider.of<AddPageVariableProvider>(context).allContact[i].firstName} ${Provider.of<AddPageVariableProvider>(context).allContact[i].lastName}"),
                  subtitle: Text("${Provider.of<AddPageVariableProvider>(context).allContact[i].phoneNumber}"),
                  onTap: (){
                    Navigator.of(context).pushNamed('DetailsPage',arguments: Provider.of<AddPageVariableProvider>(context,listen: false).allContact[i]);
                  },
                ),
              ),
            )
          : Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.cube_box,
                    size: 250,
                  ),
                  Text(
                    "You Have no contacts yet!",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.grey.shade700.withOpacity(
                            0.8,
                          ),
                        ),
                  )
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'add_contact_page');
        },
        heroTag: null,
        child: Icon(
          CupertinoIcons.add,
        ),
      ),
    );
  }
}
