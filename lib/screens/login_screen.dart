import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'forgot_password_screen.dart';
import '../api/api_service.dart';
import 'home_screen.dart';

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({Key? key}) : super(key: key);

  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  bool rememberMe = false;
  bool loading = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              const SizedBox(height: 5),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    iconSize: 25,
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF525151),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
              const SizedBox(height: 100),

              // Email Input
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Enter your email",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 10,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),

              // Password Input
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Enter your password",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 10,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),

              // Remember me + Forgot password
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value ?? false;
                            });
                          },
                        ),
                        const Text("Remember me"),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Login Button
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
                    onPressed: loading ? null : _login,
                    child: loading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "Login",
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
                child: TextButton.icon(
                  onPressed: () {},
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
                child: TextButton.icon(
                  onPressed: () {},
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
              const SizedBox(height: 5),

              // Register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    String email = emailController.text.trim();
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("All fields are required")));
      return;
    }

    setState(() => loading = true);

    try {
      var result = await ApiService.login(
        identifier: email,
        password: password,
      );

      setState(() => loading = false);

      bool isSuccess = result["success"] == true;
      String userStatus = (result["user_status"] ?? "").toString().trim();

      if (!mounted) return;

      if (isSuccess && userStatus == "Approved") {
        // <-- exact match
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login successful"),
            duration: Duration(milliseconds: 700),
          ),
        );

        // Wait for SnackBar to finish before navigating
        await Future.delayed(const Duration(milliseconds: 700));

        if (!mounted) return;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      } else if (isSuccess && userStatus != "Approved") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please verify your email first")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result["message"] ?? "Login failed")),
        );
      }
    } catch (e) {
      setState(() => loading = false);
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }
}
