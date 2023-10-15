import 'package:amico/constan/constan_image.dart';
import 'package:amico/screens/home/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double logoWidth = 180; // Initial width of the logo
  double logoHeight = 180; // Initial height of the logo
  double opacityLevel = 0.0; // Initial opacity level

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  Future<void> _startAnimation() async {
    await Future.delayed(const Duration(seconds: 1)); // Wait for 1 second

    // Animate the opacity
    setState(() {
      opacityLevel = 1.0; // Fully opaque
    });

    // Animate the logo size after opacity animation
    await Future.delayed(
        const Duration(milliseconds: 500)); // Wait for a short duration

    setState(() {
      logoWidth = 320; // Target width of the logo
      logoHeight = 320; // Target height of the logo
    });

    // Wait for additional 1 second
    await Future.delayed(const Duration(seconds: 1));
    if (!context.mounted) return;

    // Navigate to the next screen with a custom transition
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Slide in from right
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration:
            const Duration(milliseconds: 500), // Transition duration
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color of the splash screen
      body: Center(
        child: AnimatedOpacity(
          opacity: opacityLevel,
          duration:
              const Duration(seconds: 1), // Duration of the opacity animation
          child: AnimatedContainer(
            duration: const Duration(
                seconds: 1), // Duration of the logo size animation
            width: logoWidth,
            height: logoHeight,
            child: Image.asset(
              ConstanImage.amicologoe, // Replace with your logo image path
            ),
          ),
        ),
      ),
    );
  }
}
