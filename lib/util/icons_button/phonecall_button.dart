import 'package:amico/constan/constan_image.dart';
import 'package:amico/util/phone_number.dart';
import 'package:flutter/material.dart';

class PhoneCallButton extends StatefulWidget {
  const PhoneCallButton({super.key});

  @override
  State<PhoneCallButton> createState() => _PhoneCallButtonState();
}

class _PhoneCallButtonState extends State<PhoneCallButton> {
  bool _isPhoneButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          await _handlePhoneButtonClick();
        },
        child: Image.asset(
          ConstanImage.phonecallButttonImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Future<void> _handlePhoneButtonClick() async {
    if (!_isPhoneButtonDisabled) {
      // Disable the button to prevent multiple clicks
      setState(() {
        _isPhoneButtonDisabled = true;
      });

      showDialog(
        context: context,
        builder: (context) {
          return const PhoneNumber();
        },
      );

      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isPhoneButtonDisabled = false;
        });
      });
    }
  }
}
