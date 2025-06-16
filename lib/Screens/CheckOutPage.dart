import 'package:flutter/material.dart';
import 'package:flutter_product_app/Screens/AddAddresses.dart';
import 'package:flutter_product_app/Screens/PaymentMethods.dart';
import 'package:google_fonts/google_fonts.dart';

class Checkoutpage extends StatefulWidget {
  const Checkoutpage({super.key});

  @override
  State<Checkoutpage> createState() => _CheckoutpageState();
}

class _CheckoutpageState extends State<Checkoutpage> {
  String selectedAddress = 'Home';
  String selectedPayment = '';

  Widget addressOption(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Radio<String>(
            value: title,
            groupValue: selectedAddress,
            onChanged: (value) {
              setState(() {
                selectedAddress = value!;
              });
            },
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentOption(String method, String? asset) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Radio<String>(
            value: method,
            groupValue: selectedPayment,
            onChanged: (value) {
              setState(() {
                selectedPayment = value!;
              });
            },
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              method == 'Cash on Delivery' ? method : 'Debit / Credit card',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500)),
            ),
          ),
          if (asset != null)
            Image.asset(
              asset,
              width: 50,
              height: 35,
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Check Out',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          // Cart Summary Row
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Text(
                  '2 items in your cart',
                  style: TextStyle(
                      color: Color(0xff7B7B7B),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Spacer(),
                Text(
                  'Total',
                  style: TextStyle(
                      color: Color(0xff7B7B7B),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Text(
                  'Delivery Address',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  '3600.95 LE',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Address Options
          addressOption(
              'Home', '123 Main St, Springfield\nApt 4B, Near Central Park'),
          addressOption(
              'Office', '456 Office Blvd, Metropolis\nFloor 10, Suite 1001'),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Addaddresses()),
                );
              },
              child: Text(
                '+Add Address',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: Color(0xFF3E649B),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Payment Methods',
              style: GoogleFonts.poppins(
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // Payment Options
          paymentOption('Visa', 'assets/images/visa.png'),
          paymentOption('Mastercard', 'assets/images/master card.png'),
          paymentOption('Cash on Delivery', 'assets/images/delivery.png'),

          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 20),
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
                    MaterialPageRoute(
                        builder: (context) => const PaymentMethodsPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  'Pay Now',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
