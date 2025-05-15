import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_product_app/Screens/Login.dart';
import 'package:google_fonts/google_fonts.dart';

class Passwordchanged extends StatelessWidget {
  const Passwordchanged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 175.0),
        child: Column(
          children: [
            Image.asset('assets/images/logo.png'),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Password Changed',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Your password has been changed succesfully',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(255, 144, 140, 140),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Back to Login',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
