import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_product_app/Screens/OnBoarding_screnn.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to another page after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      // Replace SplashScreen with HomeScreen (or your target screen)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png'),
          const SizedBox(height: 30),
          const Text(
            'Electro World !',
            style: TextStyle(fontSize: 24, fontFamily: 'Sigmar'),
          ),
          const SizedBox(height: 5),
          const Text(
            'Your way to the best',
            style: TextStyle(
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
