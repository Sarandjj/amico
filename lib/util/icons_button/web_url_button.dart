import 'package:amico/constan/constan_image.dart';
import 'package:amico/constan/constan_links.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WebSiteUrl extends StatefulWidget {
  const WebSiteUrl({super.key});

  @override
  State<WebSiteUrl> createState() => _WebSiteUrlState();
}

class _WebSiteUrlState extends State<WebSiteUrl> {
  bool _isWebButtonDisabled = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          await _handleWebButtonClick();
        },
        child: Image.asset(
          ConstanImage.webButttonImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Future<void> _handleWebButtonClick() async {
    if (!_isWebButtonDisabled) {
      // Disable the button to prevent multiple clicks
      setState(() {
        _isWebButtonDisabled = true;
      });

      try {
        await launchUrlString(Links.webSiteUrl,
            mode: LaunchMode.externalApplication);
        //return true;
      } catch (e) {
        try {
          await launchUrlString(Links.webSiteUrl,
              mode: LaunchMode.platformDefault);
          // return true;
        } catch (e) {
          rethrow;
        }
      }
    }
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isWebButtonDisabled = false;
      });
    });
  }
}
