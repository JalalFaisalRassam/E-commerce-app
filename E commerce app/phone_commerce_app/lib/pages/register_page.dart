import 'package:phone_commerce_app/components/my_button.dart';
import 'package:phone_commerce_app/components/my_text_field.dart';
import 'package:phone_commerce_app/components/square_tile.dart';
import 'package:phone_commerce_app/pages/main_page.dart';
import 'package:phone_commerce_app/pages/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final emailControler = TextEditingController();

  final PasswordController = TextEditingController();

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 50,
              ),
              // logo
              const Icon(
                Icons.lock,
                size: 50,
                color: Colors.green,
              ),
              SizedBox(
                height: 25,
              ),

              SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: emailControler,
                hintText: "user name",
                obscureText: false,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: PasswordController,
                hintText: "password",
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: PasswordController,
                hintText: "confirm password",
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),

              const SizedBox(
                height: 25,
              ),
              MyButton(
                buttonText: 'Sign Up',
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MianPage()),
                    (route) => false,
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 1.1,
                      color: Colors.grey.shade300,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Or Continue with",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 1.1,
                      color: Colors.grey.shade300,
                    )),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SquareTile(imagePath: "images/google.png"),
                  SquareTile(imagePath: "images/apple.png"),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an accout?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: const Text(
                      'Login now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
