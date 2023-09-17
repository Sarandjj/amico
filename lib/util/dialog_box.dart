import 'package:amico/screens/chits_page.dart';
import 'package:flutter/material.dart';

class CustomHalfCircleDialog extends StatelessWidget {
  const CustomHalfCircleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      content: SizedBox(
        width: size.width,
        height: size.height * .27,
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            Image.asset(
              "asset/image/logo/logoonly.png",
              height: 50,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Announcement",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Vaiyai Amico chit fund private limited chit planes',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
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
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const GoldPlanePage(),
              ),
            );
          },
          child: const Text('yes'),
        ),
      ],
    );
  }
}