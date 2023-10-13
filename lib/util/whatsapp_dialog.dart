import 'package:amico/constan/constan_colors.dart';
import 'package:amico/constan/constan_image.dart';
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      content: SizedBox(
        width: size.width,
        height: size.height * .239,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 30, 10),
              child: Text(
                'Press on the number to open WhatsApp',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                launchUrlString('https://wa.me/9751547171');
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(230, 50),
                  backgroundColor: Colors.white,
                  side: const BorderSide(width: 1.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18))),
              child: Row(
                children: [
                  Image.asset(
                    ConstanImage.whatsappButttonImage,
                    fit: BoxFit.cover,
                    width: 45,
                    height: 45,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '97515 47171',
                    style: TextStyle(
                      fontSize: 20,
                      color: ConstanColor.primarycolor,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                launchUrlString('https://wa.me/7548867333');
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(230, 50),
                  backgroundColor: Colors.white,
                  side: const BorderSide(width: 1.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18))),
              child: Row(
                children: [
                  Image.asset(
                    ConstanImage.whatsappButttonImage,
                    fit: BoxFit.cover,
                    width: 45,
                    height: 45,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '75488 67333',
                    style: TextStyle(
                      fontSize: 18,
                      color: ConstanColor.primarycolor,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: ConstanColor.primarycolor,
            ),
          ),
        ),
      ],
    );
  }
}
