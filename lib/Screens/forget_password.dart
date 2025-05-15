import 'package:flutter/material.dart';
import 'package:flutter_product_app/Screens/VerifyEmailPage.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();
  bool isEmailValid = false;

  void validateEmail(String email) {
    final bool valid =
        RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$").hasMatch(email);
    setState(() {
      isEmailValid = valid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 175.0, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot password?',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0, right: 20),
              child: Text(
                "Don’t worry! It happens. Please enter the email associated with your account.",
                style: TextStyle(
                  color: Color.fromARGB(255, 154, 150, 150),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, right: 20),
              child: TextField(
                controller: emailController,
                onChanged: validateEmail,
                decoration: InputDecoration(
                  labelText: 'Email',
                  suffixIcon: Icon(
                    Icons.check_circle,
                    color: isEmailValid
                        ? const Color.fromARGB(255, 33, 69, 124)
                        : Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 33, 69, 124),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 20),
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
                    if (isEmailValid) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Verifyemailpage(email: emailController.text),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter a valid email"),
                        ),
                      );
                    }
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
                    'Send Code',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 70.0, bottom: 20),
              child: Row(
                children: [
                  const Text(
                    'Remember password?',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // back to Login
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
