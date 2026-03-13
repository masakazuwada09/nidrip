import 'package:flutter/material.dart';
import 'login_signup_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool _animate = false;

  @override
  void initState() {
    super.initState();
    // Start animation after build
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _animate = true;
      });
    });
  }

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
              Color(0xFFFFFFFF),
              Color(0xFFF0EFEF),
              Color(0xFFFAADE7),
              Color(0xFFFC80DD),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60),

            // Image animation
            AnimatedSlide(
              offset: _animate ? Offset.zero : const Offset(0, 0.2),
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOut,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage("assets/onboarding.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 80),

            // Text animation
            AnimatedSlide(
              offset: _animate ? Offset.zero : const Offset(0, 0.2),
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeOut,
              child: Column(
                children: const [
                  Text(
                    "Own the trendiest itemsz",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Affordable Home Appliances,\nDelivered Fast Across Belfast",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Button animation
            AnimatedSlide(
              offset: _animate ? Offset.zero : const Offset(0, 0.2),
              duration: const Duration(milliseconds: 1200),
              curve: Curves.easeOut,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginSignupScreen(),
                    ),
                  );
                },
                child: Container(
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
                  child: const Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
