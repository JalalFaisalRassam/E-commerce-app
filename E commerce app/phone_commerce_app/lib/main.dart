import 'package:flutter/material.dart';
import 'package:phone_commerce_app/splash.dart';
import 'package:provider/provider.dart';
import 'package:phone_commerce_app/providers/cart_provider.dart';
import 'package:phone_commerce_app/providers/favorite_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: SafeArea(
        child: MaterialApp(
          title: 'E commerce',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.green),
            scaffoldBackgroundColor: Colors.grey.shade100,
          ),
          home: WillPopScope(
            onWillPop: () async {
              // Show confirmation dialog
              bool exit = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Confirm Exit'),
                  content: Text('Are you sure you want to exit?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text('Yes'),
                    ),
                  ],
                ),
              );

              return exit ?? false;
            },
            child: SplashScreen(),
          ),
        ),
      ),
    );
  }
}
