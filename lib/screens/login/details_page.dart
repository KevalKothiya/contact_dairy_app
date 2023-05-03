import 'package:contact_dairy_app/controller/controller_provider.dart';
import 'package:contact_dairy_app/path/globals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    // Contact contact = ModalRoute.of(context)!.settings.arguments as Contact;

    AddPageVariable contact =
        ModalRoute.of(context)!.settings.arguments as AddPageVariable;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact"),
        actions: [
          GestureDetector(
            onTap: () =>
                Provider.of<ThemeProvider>(context, listen: false).changeMode(),
            child: CircleAvatar(
              radius: 16,
              backgroundColor:
                  (Provider.of<ThemeProvider>(context).globals.isDarkMode)
                      ? Colors.white
                      : Colors.black,
              child: CircleAvatar(
                radius: 12,
                backgroundColor:
                (Provider.of<ThemeProvider>(context).globals.isDarkMode)
                    ? Colors.black
                    : Colors.white,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor:
                  (Provider.of<ThemeProvider>(context).globals.isDarkMode)
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.more_vert_rounded,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Spacer(
                  flex: 18,
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey,
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      // Provider.of<AddPageVariableProvider>(context,listen: false).allContact.remove(contact);
                    });
                    Provider.of<AddPageVariableProvider>(context,listen: false).ContactRemove(contact);
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/', (route) => false)
                        .then((value) => setState(() {}));
                  },
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    // Navigator.of(context)
                    //     .pushNamed('EditPage', arguments: contact)
                    //     .then((value) => setState(() {}));
                  },
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "${contact.firstName} ${contact.lastName}",
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(children: [
              Text(
                "+91 ${contact.phoneNumber}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ]),
            const Divider(
              thickness: 1,
              height: 50,
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  mini: true,
                  elevation: 0,
                  heroTag: false,
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.call),
                  onPressed: () async {
                    Uri uri = Uri.parse("tel:+91${contact.phoneNumber}");

                    try {
                      await launchUrl(uri);
                    } catch (e) {
                      print("Exception : $e");
                    }
                  },
                ),
                FloatingActionButton(
                  mini: true,
                  elevation: 0,
                  heroTag: false,
                  backgroundColor: Colors.orangeAccent,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.message),
                  onPressed: () async {
                    Uri uri = Uri.parse("sms:${contact.phoneNumber}");

                    try {
                      await launchUrl(uri);
                    } catch (e) {
                      print("Exception : $e");
                    }
                  },
                ),
                FloatingActionButton(
                  mini: true,
                  elevation: 0,
                  heroTag: false,
                  backgroundColor: Colors.lightBlueAccent,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.mail),
                  onPressed: () async {
                    Uri uri = Uri.parse("mailto:${contact.email}?");

                    try {
                      await launchUrl(uri);
                    } catch (e) {
                      print("Exception : $e");
                    }
                  },
                ),
                FloatingActionButton(
                  mini: true,
                  heroTag: false,
                  backgroundColor: Colors.deepOrangeAccent,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.share),
                  onPressed: () async {
                    await Share.share("+91 ${contact.phoneNumber}");
                  },
                ),
              ],
            ),
            const Divider(
              height: 50,
              thickness: 2,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
