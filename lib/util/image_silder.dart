import 'package:flutter/material.dart';

final List<ImageTextData> data = [
  ImageTextData(
      imagePath: 'asset/image/silder_image/image1.jpg',
      text: ' The Key to Financial Goals'),
  ImageTextData(
      imagePath: 'asset/image/silder_image/image2.jpg', text: 'Invest Wisely'),
  ImageTextData(
      imagePath: 'asset/image/silder_image/image3.jpg',
      text: 'Secure Your Future'),
  ImageTextData(
      imagePath: 'asset/image/silder_image/image4.jpg',
      text: 'Smart Investments, Bigger Rewards'),
  ImageTextData(
      imagePath: 'asset/image/silder_image/image5.jpg',
      text: 'Your Savings Is Your Destiny'),
  ImageTextData(
      imagePath: 'asset/image/silder_image/image6.jpg', text: 'Page 2 Text'),
  ImageTextData(
      imagePath: 'asset/image/silder_image/image7.jpg', text: 'Page 2 Text'),
  ImageTextData(
      imagePath: 'asset/image/silder_image/image8.jpg', text: 'Page 2 Text'),

  // Add more data as needed
];

class ImageTextData {
  final String imagePath;
  final String text;

  ImageTextData({
    required this.imagePath,
    required this.text,
  });
}

class ImageWithTextOverlay extends StatelessWidget {
  final String imagePath;
  final String text;

  const ImageWithTextOverlay({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
          // filterQuality: FilterQuality.low,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          color: Colors.black.withOpacity(0.4),
          width: double.infinity,
          height: double.infinity,
        ),
        Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromARGB(255, 207, 207, 207),
              fontSize: 23.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
