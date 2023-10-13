import 'package:amico/constan/constan_colors.dart';
import 'package:amico/constan/constan_image.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher_string.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({super.key});

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
        height: size.height * .21,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 30, 10),
              child: Text(
                'Press on the number to call',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var phoneno = ('tel:+919751547171');

                try {
                  await launchUrlString(phoneno,
                      mode: LaunchMode.externalApplication);
                } catch (e) {
                  // print(e);
                  await launchUrlString(phoneno,
                      mode: LaunchMode.platformDefault);
                }
                // if (await launchUrl(phoneno)) {
                //   //dialer opened
                // }
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
                    ConstanImage.phonecallButttonImage,
                    fit: BoxFit.cover,
                    width: 35,
                    height: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '9751547171',
                    style: TextStyle(
                      fontSize: 18,
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
              onPressed: () async {
                var phoneno = 'tel:+917548867333';
                try {
                  await launchUrlString(phoneno,
                      mode: LaunchMode.externalApplication);
                } catch (e) {
                  // print(e);
                  await launchUrlString(phoneno,
                      mode: LaunchMode.platformDefault);
                }
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
                    ConstanImage.phonecallButttonImage,
                    fit: BoxFit.cover,
                    width: 35,
                    height: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '7548867333',
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
