import 'package:amico/constan/constan_image.dart';
import 'package:amico/util/whatsapp_dialog.dart';
import 'package:flutter/material.dart';

class WhatsappButton extends StatefulWidget {
  const WhatsappButton({super.key});

  @override
  State<WhatsappButton> createState() => _WhatsappButtonState();
}

class _WhatsappButtonState extends State<WhatsappButton> {
  bool _isWhatsButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          await _handleWhatsButtonClick();
        },
        child: Image.asset(
          ConstanImage.whatsappButttonImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Future<void> _handleWhatsButtonClick() async {
    if (!_isWhatsButtonDisabled) {
      // Disable the button to prevent multiple clicks
      setState(() {
        _isWhatsButtonDisabled = true;
      });

      showDialog(
        context: context,
        builder: (context) {
          return const WhatsAppAlertDialog();
        },
      );

      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isWhatsButtonDisabled = false;
        });
      });
    }
  }
}
