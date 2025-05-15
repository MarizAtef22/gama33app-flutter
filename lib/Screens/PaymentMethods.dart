import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({super.key});

  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  int _defaultCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Payment methods',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
      ),
      backgroundColor: const Color(0xffF9F9F9),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff16325A),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            builder: (context) => const AddCardBottomSheet(),
          );
        },
        child: const Icon(Icons.add, color: Colors.white, size: 36),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Your payment cards',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildCard(
              index: 0,
              backgroundColor: Colors.black,
              lastDigits: '3947',
              logoWidget: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/images/pngg.png',
                  height: 50,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildCard(
              index: 1,
              backgroundColor: const Color(0xff9B9B9B),
              lastDigits: '4546',
              logoWidget: Align(
                alignment: Alignment.topRight,
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/4/41/Visa_Logo.png',
                  height: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required int index,
    required Color backgroundColor,
    required String lastDigits,
    required Widget logoWidget,
  }) {
    return Column(
      children: [
        Container(
          height: 200,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/sim.png',
                    height: 50,
                    width: 75,
                  ),
                  const Spacer(),
                  logoWidget,
                ],
              ),
              const SizedBox(height: 20),
              Text(
                '**** **** **** $lastDigits',
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Card Holder Name',
                    style: TextStyle(color: Colors.white70),
                  ),
                  Text(
                    'Expiry Date',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        CheckboxListTile(
          value: _defaultCardIndex == index,
          onChanged: (bool? value) {
            if (value == true) {
              setState(() {
                _defaultCardIndex = index;
              });
            }
          },
          title: const Text('Use as default payment method'),
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ],
    );
  }
}

// BOTTOM SHEET
class AddCardBottomSheet extends StatefulWidget {
  const AddCardBottomSheet({super.key});

  @override
  State<AddCardBottomSheet> createState() => _AddCardBottomSheetState();
}

class _AddCardBottomSheetState extends State<AddCardBottomSheet> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  bool _isDefault = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const Text(
                "Add new card",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildTextField(_nameController, "Name on card"),
              const SizedBox(height: 15),
              _buildTextField(_numberController, "Card number",
                  suffix: const Text("Visa , Mastercard , Meeza")),
              const SizedBox(height: 15),
              _buildTextField(_expiryController, "Expire Date", hint: "MM/YY"),
              const SizedBox(height: 15),
              _buildTextField(_cvvController, "CVV",
                  obscure: true, suffixIcon: Icons.help_outline),
              const SizedBox(height: 15),
              CheckboxListTile(
                value: _isDefault,
                onChanged: (val) {
                  setState(() => _isDefault = val ?? false);
                },
                title: const Text("Set as default payment method"),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff16325A),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // You can save the card here or update the card list
                },
                child: const Text("ADD CARD",
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    String? hint,
    bool obscure = false,
    Widget? suffix,
    IconData? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        suffix: suffix,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
