import 'package:contact_dairy_app/controller/controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Logo extends StatefulWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 5),
      () => (Provider.of<OneTimeProvider>(context, listen: false)
              .oneTimeScreen_Modal
              .introScreen02)
          ? (Provider.of<SingUpAccessProvider>(context, listen: false)
                  .singUpAccess_Modal
                  .screen)
              ? Navigator.of(context).pushReplacementNamed('/')
              : Navigator.of(context).pushReplacementNamed('SingUpPage')
          : Navigator.of(context).pushReplacementNamed('IntroPage01'),
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 75,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  foregroundImage: AssetImage("assets/images/logo.png"),
                ),
              ),
            ),
            Text(
              "KK",
              style: GoogleFonts.rampartOne(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
