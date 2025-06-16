import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'About us',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'ًWho we are?',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 18,
                  color: Color(0xff3E649B),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '''Our app is your trusted destination for high-quality computer components and accessories. Whether you're assembling a custom PC, upgrading your setup, or searching for dependable peripherals, we offer a carefully curated range of products from top brands at competitive prices. Our mission is to make technology more accessible and hassle-free for everyone — from first-time users to experienced tech enthusiasts.

We built this app to solve real problems customers often face: confusing product choices, limited availability, slow support, and unreliable delivery. With our smart search and filter tools, real-time stock updates, and clear product specifications, we help users find exactly what they need quickly and confidently. We’ve also eliminated long wait times by streamlining the ordering process and ensuring faster, more reliable shipping.

Key features of our app include user-friendly navigation, secure payment options, order tracking, and personalized product recommendations. And if you ever need assistance, our dedicated support team is here to help — whether it’s placing an order, troubleshooting an issue, or getting advice on compatible parts. We’re committed to delivering not just products, but a complete and satisfying shopping experience.''',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
