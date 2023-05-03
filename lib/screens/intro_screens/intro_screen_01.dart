import 'package:contact_dairy_app/controller/controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroPage01 extends StatefulWidget {
  const IntroPage01({Key? key}) : super(key: key);

  @override
  State<IntroPage01> createState() => _IntroPage01State();
}

class _IntroPage01State extends State<IntroPage01> {
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
            Image.asset("assets/intro_screen_victor_gif/get_in_touch.gif"),
            Spacer(
              flex: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("${Provider.of<OneTimeProvider>(context,listen: false).oneTimeScreen_Modal.introScreen01}");
                    Navigator.of(context).pushReplacementNamed('IntroPage02');
                  },
                  child: Text(
                    "Next",
                  ),
                ),
              ],
            ),
            Spacer(
            ),
          ],
        ),
      ),
    );
  }
}
