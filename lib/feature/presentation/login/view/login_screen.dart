import 'package:flutter/material.dart';
import 'package:pocket_trading/core/constrants/app_images.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    final double screenWidth = size.width;

    return Scaffold(
      backgroundColor: Colors.white, // Nicher ongsho shada
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // 1. Blue Background Card with Rounded Corners
              Container(
                height: screenHeight * 0.7, // Screen er 70% blue thakbe
                width: screenWidth,
                decoration: const BoxDecoration(
                  color: Color(0xFF0077C2), // Deep Blue color
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.05),
                      // Logo/Icon
                      Image.asset(AssetPaths.loginPage, height: 80), // Apnar logo path
                      const SizedBox(height: 20),
                      const Text(
                        "Getting Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Let's Sign In for explore continues",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      const SizedBox(height: 40),

                      // TextFields
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            _buildTextField(Icons.email_outlined, "Email Address"),
                            const SizedBox(height: 20),
                            _buildTextField(Icons.visibility_off_outlined, "Password"),
                            const SizedBox(height: 25),
                            const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 2. Floating Action Button (Arrow)
              // Blue card er thik niche center e thakbe
              Positioned(
                top: (screenHeight * 0.7) - 35, // Height er thik border line e
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00ACEE), // Cyan/Light Blue
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.arrow_forward, color:Colors.white, size: 30),
                ),
              ),

              // 3. Bottom "Sign Up" Text
              Positioned(
                bottom: 40,
                child: Row(
                  children: const [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xFF00ACEE),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom TextField Widget
  Widget _buildTextField(IconData icon, String hint) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: Icon(icon, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        ),
      ),
    );
  }
}