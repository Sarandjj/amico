import 'package:amico/util/image_silder.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderImage extends StatelessWidget {
  const CarouselSliderImage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(color: Colors.white54
          // border: Border.all(
          //     style: BorderStyle.solid, width: 2, color: Colors.blue),
          ),
      height: height * .23,
      width: double.infinity,
      child: Card(
        surfaceTintColor: Colors.black,
        color: Colors.white54,
        elevation: 54,
        shadowColor: Colors.black,
        child: CarouselSlider.builder(
          itemCount: data.length,
          itemBuilder: (context, index, realIndex) {
            final item = data[index];
            return ImageWithTextOverlay(
              imagePath: item.imagePath,
              text: item.text,
            );
          },
          options: CarouselOptions(
            initialPage: 0,
            viewportFraction: 1,
            enlargeCenterPage: true,
            clipBehavior: Clip.antiAlias,
            autoPlay: true, // Enable autoplay
            autoPlayInterval:
                const Duration(seconds: 3), // Set the autoplay interval
            autoPlayAnimationDuration:
                const Duration(milliseconds: 800), // Animation duration
            autoPlayCurve: Curves.fastOutSlowIn, // Animation curve
          ),
        ),
      ),
    );
  }
}
