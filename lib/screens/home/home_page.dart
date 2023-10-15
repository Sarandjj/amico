import 'package:amico/constan/constan_colors.dart';
import 'package:amico/constan/constan_image.dart';
import 'package:amico/screens/home/carouse_slider.dart';
import 'package:amico/screens/home/chit_box.dart';
import 'package:amico/util/icons_button/facebook_button.dart';
import 'package:amico/util/icons_button/instagram_button.dart';
import 'package:amico/util/icons_button/location_button.dart';
import 'package:amico/util/icons_button/phonecall_button.dart';
import 'package:amico/util/icons_button/web_url_button.dart';
import 'package:amico/util/icons_button/whatsapp_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

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
        toolbarHeight: height * .09,
        elevation: 6,
        backgroundColor: ConstanColor.primarycolor,
        centerTitle: true,
        title: Image.asset(
          ConstanImage.amicologot,
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
        child: const Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(child: SizedBox()),
            CarouselSliderImage(),
            Expanded(child: SizedBox()),
            SizedBox(
              height: 40,
            ),
            ChitBox(),
            Expanded(child: SizedBox()),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 10,
                ),
                WebSiteUrl(),
                SizedBox(
                  width: 10,
                ),
                IntagramButton(),
                SizedBox(
                  width: 10,
                ),
                FacebookButton(),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 10,
                ),
                PhoneCallButton(),
                SizedBox(
                  width: 10,
                ),
                WhatsappButton(),
                SizedBox(
                  width: 10,
                ),
                LocationButton(),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
