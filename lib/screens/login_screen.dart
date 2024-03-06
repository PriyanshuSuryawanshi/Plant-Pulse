import 'package:flutter/material.dart';
import 'package:plant_pulse/components/login_button.dart';
import 'package:plant_pulse/components/firebasefunctions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Stack(
          children: [
            //BG Image
            Positioned.fill(
              child: Image.asset(
                'assets/images/login_bg.jpeg',
                fit: BoxFit.fitHeight, // Ensure image covers the entire area
              ),
            ),

            // Gradient overlay
            Positioned.fill(
              // Fill the entire screen
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color.fromARGB(
                          255, 7, 68, 7), // Adjust green color as needed
                    ],
                    stops: [0.5, 1.0],
                  ),
                ),
              ),
            ),

            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Spacer(flex: 1),
                    // Empowering Plant Parenthood Text
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Empowering ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 33.0,
                              ),
                            ),
                            TextSpan(
                              text: "Plant Parenthood",
                              style: TextStyle(
                                color:
                                    Colors.green[900], // Change color to green
                                fontWeight: FontWeight.bold,
                                fontSize: 33.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.18,
                ),
                LoginButton(
                  onTap: () {
                    FirebaseFunctions.signUserInWithGoogle(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
