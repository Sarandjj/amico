import 'package:amico/constan/constan_colors.dart';
import 'package:amico/constan/constan_image.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher_string.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
      content: SizedBox(
        width: double.infinity,
        height: height < 800 ? height * .29 : height * .27,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Expanded(child: SizedBox()),
            const Text('Contact Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            const Expanded(child: SizedBox()),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
              child: Text(
                'Press on the Button to open WhatsApp',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
              ),
            ),
            const Expanded(child: SizedBox()),
            _phoneNumberButton('tel:+919751547171', '97515 47171'),
            const SizedBox(
              height: 20,
            ),
            const Expanded(child: SizedBox()),
            _phoneNumberButton('tel:+917548867333', '75488 67333'),
            const Expanded(child: SizedBox()),
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

  Widget _phoneNumberButton(String phoneNumberT, String phoneNumber,
      {double fontSize = 18}) {
    return ElevatedButton(
      onPressed: () async {
        try {
          await launchUrlString(phoneNumberT,
              mode: LaunchMode.externalApplication);
        } catch (e) {
          // print(e);
          await launchUrlString(phoneNumberT, mode: LaunchMode.platformDefault);
        }
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(230, 50),
        backgroundColor: Colors.white,
        side: const BorderSide(width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      child: Row(
        children: [
          Image.asset(
            ConstanImage.phonecallButttonImage,
            fit: BoxFit.cover,
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 15),
          Text(
            phoneNumber,
            style:
                TextStyle(fontSize: fontSize, color: ConstanColor.primarycolor),
          ),
        ],
      ),
    );
  }
}
