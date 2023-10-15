import 'package:amico/constan/constan_image.dart';
import 'package:amico/constan/constan_links.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FacebookButton extends StatefulWidget {
  const FacebookButton({super.key});

  @override
  State<FacebookButton> createState() => _FacebookButtonState();
}

class _FacebookButtonState extends State<FacebookButton> {
  bool _isFaceButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          await _handleFaceButtonClick();
        },
        child: Image.asset(
          ConstanImage.facebookButttonImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Future<void> _handleFaceButtonClick() async {
    if (!_isFaceButtonDisabled) {
      // Disable the button to prevent multiple clicks
      setState(() {
        _isFaceButtonDisabled = true;
      });

      try {
        await launchUrlString(Links.facebookIdNo,
            mode: LaunchMode.platformDefault);
        //return true;
      } catch (e) {
        try {
          await launchUrlString(Links.facebookUrl,
              mode: LaunchMode.externalApplication);
          // return true;
        } catch (e) {
          rethrow;
        }
      }
    }

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isFaceButtonDisabled = false;
      });
    });
  }
}
