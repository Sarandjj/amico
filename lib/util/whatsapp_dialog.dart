import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WhatsAppAlartBox extends StatelessWidget {
  const WhatsAppAlartBox({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: const Text(
        'Contact Details',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      content: SizedBox(
        width: size.width,
        height: size.height * .31,
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 30, 20),
              child: Text(
                'Press on the number to open WhatsApp',
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                launchUrlString('https://wa.me/9751547171');
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(270, 50),
                  backgroundColor: Colors.blue,
                  side: const BorderSide(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: Row(
                children: [
                  Image.asset(
                    "asset/image/icons/whatsapp.png",
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    '9751547171',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                launchUrlString('https://wa.me/7548867333');
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(270, 50),
                  backgroundColor: Colors.blue,
                  side: const BorderSide(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: Row(
                children: [
                  Image.asset(
                    "asset/image/icons/whatsapp.png",
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    '7548867333',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
