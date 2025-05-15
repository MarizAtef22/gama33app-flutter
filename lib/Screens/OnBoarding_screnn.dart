import 'package:flutter/material.dart';
import 'package:flutter_product_app/Screens/Login.dart';
import 'package:flutter_product_app/models/onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<OnBoardingContent> contents = [
    OnBoardingContent(
      image: 'assets/images/Peripherals-cat-image.png',
      mainText: 'Accessories',
      subtitle1: 'All computer accessories in different forms and types!.',
    ),
    OnBoardingContent(
      image: 'assets/images/hardware.png',
      mainText: 'Hardware Components',
      subtitle1: 'Build your PC with many options.',
    ),
    OnBoardingContent(
      image: 'assets/images/toppng.png',
      mainText: 'Shipping',
      subtitle1: 'Shipping all over the world.',
    ),
  ];

  int currentIndex = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 255, 255, 254),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 90.0),
                    child: Stack(
                      children: [
                        if (index == 0 || index == 1 || index == 2)
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  contents[index].image,
                                  height: 325,
                                  width: 325,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  contents[index].mainText,
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Overlock',
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: Text(
                                    contents[index].subtitle1,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Overlock',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(top: 35.0, left: 10),
              child: Container(
                width: 325,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff16325A),
                      Color(0xff1C3861),
                      Color(0xff27446F),
                      Color(0xff32507D),
                      Color(0xff395886),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 45,
            )
          ],
        ),
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: currentIndex == index ? 20 : 10,
      decoration: BoxDecoration(
        color: currentIndex == index ? const Color(0xff1C3861) : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
