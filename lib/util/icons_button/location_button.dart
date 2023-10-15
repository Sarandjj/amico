import 'package:amico/constan/constan_image.dart';
import 'package:amico/constan/constan_links.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LocationButton extends StatefulWidget {
  const LocationButton({super.key});

  @override
  State<LocationButton> createState() => _LocationButtonState();
}

class _LocationButtonState extends State<LocationButton> {
  bool _isMapButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          await _handleMapButtonClick();
        },
        child: Image.asset(
          ConstanImage.locationButttonImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Future<void> _handleMapButtonClick() async {
    if (!_isMapButtonDisabled) {
      // Disable the button to prevent multiple clicks
      setState(() {
        _isMapButtonDisabled = true;
      });

      try {
        await launchUrlString(Links.googleMapUrl,
            mode: LaunchMode.externalApplication);
        //return true;
      } catch (e) {
        try {
          await launchUrlString(Links.googleMapUrl,
              mode: LaunchMode.platformDefault);
          // return true;
        } catch (e) {
          rethrow;
        }
      }
    }

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isMapButtonDisabled = false;
      });
    });
  }
}
