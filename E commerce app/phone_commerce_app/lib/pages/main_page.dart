import 'package:flutter/material.dart';
import 'package:phone_commerce_app/components/cart_details.dart';
import 'package:phone_commerce_app/pages/favorite_screen.dart';
import 'package:phone_commerce_app/pages/home_screen.dart';
import 'package:phone_commerce_app/pages/profile_screen.dart';

class MianPage extends StatefulWidget {
  const MianPage({super.key});

  @override
  State<MianPage> createState() => _MianPageState();
}

class _MianPageState extends State<MianPage> {
  List screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const ProfileScreen()
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E commerce'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartDetails())),
              icon: Icon(Icons.add_shopping_cart))
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: "Favorite", icon: Icon(Icons.favorite)),
            BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
          ]),
    );
  }
}
