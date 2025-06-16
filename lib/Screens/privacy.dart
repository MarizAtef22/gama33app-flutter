import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({super.key});

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
          'Policies & Terms',
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
              'Cancelation Policy',
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
              'You may cancel your order within 2 hours of placing it, as long as it has not yet been processed or shipped. After this time window, cancellation may no longer be possible if the order is already in fulfillment. To cancel an order, go to the "My Orders" section in the app, select the relevant order, and tap "Cancel Order." Once completed, you will receive a confirmation notification or email'
              'Please note that customized or special-request items cannot be canceled once the order has been confirmed. If your cancellation is successful and eligible for a refund, it will be processed within 5 to 7 business days. Additionally, we reserve the right to cancel any order at our discretion due to stock unavailability, payment issues, or suspicious activity. In such cases, you will be notified and refunded in full. ',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.6,
                ),
              ),
            ),
            const SizedBox(height: 28),
            Text(
              'Terms & Conditions',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 18,
                  color: Color(0xff3E649B),
                  fontWeight: FontWeight.w600,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'By using our app and placing orders, you agree to the following terms and conditions. We strive to ensure that all product descriptions and specifications are as accurate as possible. However, minor differences may occasionally occur due to supplier updates or variations in product images.'
              'All prices displayed are in your local currency unless stated otherwise. Payments are processed securely through encrypted gateways, and your payment details are never stored on our servers.'
              'Delivery times are estimates and may be affected by courier schedules or product availability. It is your responsibility to provide a complete and accurate delivery address to avoid delays or failed deliveries.'
              'Returns are accepted within seven days of delivery, provided that the items are unused, unopened, and in their original packaging. Refunds are issued after the returned items have been inspected and approved.'
              'Certain products may include a manufacturer warranty, and any applicable details will be included with the product or listed on its product page.'
              'We are not responsible for any indirect or incidental damages that may arise from the use or inability to use our products. As a user, you are responsible for maintaining the confidentiality of your account information and password at all times.'
              'We reserve the right to modify or update these terms at any time without prior notice. Continued use of the app following any changes implies your acceptance of the revised terms.',
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
