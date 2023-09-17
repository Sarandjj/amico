import 'package:amico/util/dialog_box.dart';
import 'package:amico/util/image_silder.dart';
import 'package:amico/util/phone_number.dart';
import 'package:amico/util/whatsapp_dialog.dart';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher_string.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final List<String> imageList = [
  //   'assets/amicologo.webp',
  //   'assets/facebook.webp',
  //   'assets/globe.webp',
  //   'assets/instagram.webp',
  //   'assets/telephone-call.webp',
  //   'assets/whatsapp.webp',
  //   'assets/youtube.webp',
  //   'assets/placeholder.webp',
  // ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        toolbarHeight: height * .1,
        elevation: 6,
        backgroundColor: const Color.fromRGBO(0, 174, 242, 1),
        centerTitle: true,
        title: Image.asset(
          'asset/image/logo/logota.png',
          width: width,
          fit: BoxFit.fill,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(228, 155, 167, 0.426),
              Color.fromRGBO(167, 186, 239, 0.541),
              Color.fromARGB(255, 235, 235, 235),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    style: BorderStyle.solid, width: 2, color: Colors.blue),
              ),
              height: height * .18,
              width: width,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Card(
                  elevation: 50,
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
                      autoPlayInterval: const Duration(
                          seconds: 3), // Set the autoplay interval
                      autoPlayAnimationDuration: const Duration(
                          milliseconds: 800), // Animation duration
                      autoPlayCurve: Curves.fastOutSlowIn, // Animation curve
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .08,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 10, 10),
              child: Container(
                width: width * .76,
                height: height * .33,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 239, 233, 233),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    width: 3,
                  ),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(0, 82, 247, 0.427),
                      Color.fromARGB(47, 33, 149, 243),
                      Color.fromRGBO(219, 18, 55, 0.239),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
                        child: Text(
                          'Manage your wealth and see it grow with us',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(69, 70, 20, 15),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 18,
                          backgroundColor: const Color.fromRGBO(0, 174, 242, 1),
                          fixedSize: const Size(200, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) =>
                                const CustomHalfCircleDialog(),
                          );
                        },
                        child: const Text(
                          'Chit Schemes',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () async {
                      const url =
                          'https://www.amicochits.com/'; // Replace this with your desired URL
                      await launchUrlString(url);
                    },
                    icon: Image.asset(
                      "asset/image/icons/internet.png",
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      // _launchInstagramProfile();
                      // _launchSocial(
                      //   'fb://page/100092651484155',
                      //   'https://www.facebook.com/profile.php?id=100092651484155',
                      // );
                      _launchInstagram();
                    },
                    icon: Image.asset(
                      "asset/image/icons/instagram.png",
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      _launchSocial(
                        'https://www.facebook.com/profile.php?id=100092651484155',
                        'fb://page/100092651484155',
                      );
                    },
                    icon: Image.asset(
                      "asset/image/icons/facebook.png",
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const PhoneNumber();
                        },
                      );
                    },
                    // iconSize: 35,
                    icon: Image.asset(
                      "asset/image/icons/phone-call.png",
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const WhatsAppAlartBox();
                        },
                      );
                    },
                    icon: Image.asset(
                      "asset/image/icons/whatsapp.png",
                      // height: 60,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () async {
                      String googleMapUrl =
                          "https://maps.app.goo.gl/ePx6162NaMkt2wKC6";

                      try {
                        await launchUrlString(googleMapUrl,
                            mode: LaunchMode.externalApplication);
                      } catch (e) {
                        // print(e);
                        await launchUrlString(googleMapUrl,
                            mode: LaunchMode.platformDefault);
                      }
                    },
                    icon: Image.asset(
                      "asset/image/icons/logation.png",
                      //  height: 30,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchSocial(String url, String fallbackUrl) async {
    try {
      await launchUrlString(url, mode: LaunchMode.platformDefault);
    } catch (e) {
      //final Uri uri = Uri.parse(url);

      // final Uri fallbackUri = Uri.parse(fallbackUrl);
      await launchUrlString(fallbackUrl, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _launchInstagram() async {
    var nativeUrl = "instagram://user?username=vaiyaiamicochits.exe";
    var webUrl = "https://www.instagram.com/vaiyaiamicochits.exe";

    try {
      await launchUrlString(nativeUrl, mode: LaunchMode.externalApplication);
    } catch (e) {
      // print(e);
      await launchUrlString(webUrl, mode: LaunchMode.platformDefault);
    }
  }
}
