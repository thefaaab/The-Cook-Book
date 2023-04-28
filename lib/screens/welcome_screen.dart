import 'package:cookbook/screens/register_screen.dart';
import 'package:cookbook/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 64),
              Column(
                children: const [
                  Text(
                    "Welcome Aboard",
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Let's get started!",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black38),
                  )
                ],
              ),
              const Spacer(),
              Image.asset(
                'assets/2.gif',
                height: 500,
              ),
              const SizedBox(height: 64),
              Center(
                child: CustomButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  text: "Let's cook",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
