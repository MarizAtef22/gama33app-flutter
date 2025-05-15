import 'package:flutter/material.dart';
import 'package:flutter_product_app/Screens/Splash_screen.dart';
import 'package:flutter_product_app/Screens/home_screen.dart';
import 'package:flutter_product_app/Screens/my_orders_page.dart';
import 'package:flutter_product_app/Screens/product_page.dart';
import 'package:flutter_product_app/Screens/profile_page.dart';
import 'package:flutter_product_app/Screens/shipping_address_page.dart';
import 'package:flutter_product_app/Screens/wishlist_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/profile': (context) => const ProfilePage(),
        '/my_orders': (context) => const MyOrdersPage(),
        '/wishlist': (context) => const WishlistPage(),
        '/shipping_address': (context) => const ShippingAddressPage(),
        '/product': (context) => const ProductPage(),
      },
    );
  }
}
