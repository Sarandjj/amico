import 'package:amico/constan/constan_image.dart';
import 'package:amico/constan/constan_links.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class IntagramButton extends StatefulWidget {
  const IntagramButton({super.key});

  @override
  State<IntagramButton> createState() => _InatagramButtonState();
}

class _InatagramButtonState extends State<IntagramButton> {
  bool _isIntaButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: _handleInstaButtonClick,
        child: Image.asset(
          ConstanImage.instagramButttonImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Future<void> _handleInstaButtonClick() async {
    if (!_isIntaButtonDisabled) {
      // Disable the button to prevent multiple clicks
      setState(() {
        _isIntaButtonDisabled = true;
      });

      try {
        await launchUrlString(Links.instagramId,
            mode: LaunchMode.platformDefault);
      } catch (e) {
        try {
          await launchUrlString(Links.instagramUrl,
              mode: LaunchMode.externalApplication);
        } catch (e) {
          rethrow;
        }
      }
    }

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isIntaButtonDisabled = false;
      });
    });
  }
}
