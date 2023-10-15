import 'package:amico/screens/chits_page.dart';
import 'package:flutter/material.dart';

class CustomHalfCircleDialog extends StatelessWidget {
  const CustomHalfCircleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
      content: SizedBox(
        width: double.infinity,
        height: size.height * .23,
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Expanded(child: SizedBox()),
            Image.asset(
              "asset/image/logo/logoonly.png",
              height: 55,
              width: 50,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Announcement",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Expanded(child: SizedBox()),
            const SizedBox(
              height: 10,
            ),
            const Expanded(child: SizedBox()),
            const Text(
              'Vaiyai Amico chit fund private limited chit plans',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            const Expanded(child: SizedBox()),
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
          child: const Text(
            'yes',
            style: TextStyle(
              color: Color.fromRGBO(0, 174, 242, 1),
            ),
          ),
        ),
      ],
    );
  }
}
