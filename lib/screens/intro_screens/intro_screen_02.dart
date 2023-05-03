import 'package:contact_dairy_app/controller/controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroPage02 extends StatefulWidget {
  const IntroPage02({Key? key}) : super(key: key);

  @override
  State<IntroPage02> createState() => _IntroPage02State();
}

class _IntroPage02State extends State<IntroPage02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(26),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 4,
            ),
            Image.asset("assets/intro_screen_victor_gif/Calling.gif"),
            Spacer(
              flex: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("${Provider.of<OneTimeProvider>(context,listen: false).oneTimeScreen_Modal.introScreen01}");
                    print("${Provider.of<OneTimeProvider>(context,listen: false).oneTimeScreen_Modal.introScreen02}");

                    Provider.of<OneTimeProvider>(context,listen: false).OneTimeScreen01Access();
                    Navigator.of(context).pushReplacementNamed('SingUpPage');

                    print("${Provider.of<OneTimeProvider>(context,listen: false).oneTimeScreen_Modal.introScreen01}");
                    print("${Provider.of<OneTimeProvider>(context,listen: false).oneTimeScreen_Modal.introScreen02}");
                  },
                  child: Text(
                    "Next",
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
