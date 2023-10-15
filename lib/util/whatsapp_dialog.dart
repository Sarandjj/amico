import 'package:amico/constan/constan_colors.dart';
import 'package:amico/constan/constan_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WhatsAppAlertDialog extends StatelessWidget {
  const WhatsAppAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
      content: SizedBox(
        width: double.infinity,
        height: height < 800 ? height * 0.29 : height * 0.27,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Expanded(child: SizedBox()),
            const Text(
              'Contact Details',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Expanded(child: SizedBox()),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
              child: Text(
                'Press the button to open WhatsApp',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
              ),
            ),
            const Expanded(child: SizedBox()),
            _buildWhatsAppButton('97515 47171', "Hi", fontSize: 18),
            const SizedBox(height: 20),
            const Expanded(child: SizedBox()),
            _buildWhatsAppButton('75488 67333', "Hi", fontSize: 18),
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
            style: TextStyle(color: ConstanColor.primarycolor),
          ),
        ),
      ],
    );
  }

  Widget _buildWhatsAppButton(String phoneNumber, String greeting,
      {double fontSize = 20}) {
    return ElevatedButton(
      onPressed: () {
        final url =
            'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(greeting)}';
        launchUrlString(url);
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
            ConstanImage.whatsapp2ButttonImage,
            fit: BoxFit.cover,
            width: 45,
            height: 45,
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
