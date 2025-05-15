import 'package:flutter/material.dart';
import 'package:flutter_product_app/Screens/CheckOutPage.dart';
import 'package:google_fonts/google_fonts.dart';

class Address {
  String label;
  String details;
  bool isShipping;

  Address({
    required this.label,
    required this.details,
    this.isShipping = false,
  });
}

class Addaddresses extends StatefulWidget {
  const Addaddresses({super.key});

  @override
  State<Addaddresses> createState() => _AddaddressesState();
}

class _AddaddressesState extends State<Addaddresses> {
  List<Address> addresses = [
    Address(
      label: 'Home Address',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipi scing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magn.',
      isShipping: true,
    ),
    Address(
      label: 'Example Address',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipi scing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magn.',
    ),
    Address(
      label: 'Example Address',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipi scing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magn.',
    ),
  ];

  void _showAddressDialog({Address? existing, int? index}) {
    final labelController = TextEditingController(text: existing?.label ?? '');
    final detailsController =
        TextEditingController(text: existing?.details ?? '');
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          existing == null ? 'Add Address' : 'Edit Address',
          style: GoogleFonts.poppins(),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: labelController,
              decoration: const InputDecoration(labelText: 'Label'),
            ),
            TextField(
              controller: detailsController,
              decoration: const InputDecoration(labelText: 'Details'),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final newAddress = Address(
                label: labelController.text,
                details: detailsController.text,
                isShipping: existing?.isShipping ?? false,
              );
              setState(() {
                if (existing != null && index != null) {
                  addresses[index] = newAddress;
                } else {
                  addresses.add(newAddress);
                }
              });
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Shipping Addresses',
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
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Checkoutpage()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        itemCount: addresses.length,
        itemBuilder: (context, i) {
          final addr = addresses[i];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        addr.label,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          _showAddressDialog(existing: addr, index: i),
                      child: const Text('Edit'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  addr.details,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Checkbox(
                      value: addr.isShipping,
                      onChanged: (v) {
                        setState(() {
                          for (var a in addresses) {
                            a.isShipping = false;
                          }
                          addr.isShipping = v ?? false;
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    const Text('Use as the shipping address'),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddressDialog(),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Container(
          width: 250,
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
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: const Text(
              'Next',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
