import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class LoginSignupScreen extends StatelessWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFC80DD),
              Color(0xFFFAADE7),
              Color(0xFFF0EFEF),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 130),

              // Logo
              Image.asset("assets/logo.png", width: 250),

              const SizedBox(height: 90),

              // Login Button (Gradient)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFD215C),
                      Color(0xFFFD22C4),
                      Color(0xFF9C8095),
                      Color(0xFF29F04A),
                    ],
                  ),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginScreenPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Signup Button (Grey Outline)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFF646464),
                    width: 1.5,
                  ),
                  color: Colors.transparent,
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 50),

              // Or Separator
              Row(
                children: const [
                  Expanded(
                    child: Divider(color: Color(0xFFE6E5E5), thickness: 1),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Or",
                      style: TextStyle(color: Color(0xFFBDBCBC)),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Color(0xFFE6E5E5), thickness: 1),
                  ),
                ],
              ),

              const SizedBox(height: 50),

              // Continue with Google
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 33,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton.icon(
                  onPressed: () {
                    // TODO: Google login
                  },
                  icon: Image.asset("assets/google.png", width: 20, height: 20),
                  label: const Text(
                    "Continue with Google",
                    style: TextStyle(color: Color(0xFF1F1F1F), fontSize: 12),
                  ),
                ),
              ),

              const SizedBox(height: 5),

              // Continue with Facebook
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 33,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton.icon(
                  onPressed: () {
                    // TODO: Facebook login
                  },
                  icon: Image.asset(
                    "assets/facebook.png",
                    width: 20,
                    height: 20,
                  ),
                  label: const Text(
                    "Continue with Facebook",
                    style: TextStyle(color: Color(0xFF1F1F1F), fontSize: 12),
                  ),
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
