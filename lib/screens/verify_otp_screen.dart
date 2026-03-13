import 'dart:async';
import 'package:flutter/material.dart';
import '../api/api_service.dart';
import 'login_screen.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String email;
  final String userCc;

  const VerifyOtpScreen({Key? key, required this.email, this.userCc = ""})
    : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final int _otpLength = 6;

  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  int _secondsRemaining = 59;
  Timer? _timer;

  bool loading = false;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(_otpLength, (_) => TextEditingController());
    _focusNodes = List.generate(_otpLength, (_) => FocusNode());
    _startTimer();
  }

  @override
  void dispose() {
    for (var c in _controllers) c.dispose();
    for (var f in _focusNodes) f.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _secondsRemaining = 59;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() => _secondsRemaining--);
      } else {
        timer.cancel();
      }
    });
  }

  Widget _buildOtpBox(int index) {
    return Container(
      width: 40,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(fontSize: 20),
        decoration: const InputDecoration(
          counterText: "",
          border: UnderlineInputBorder(),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < _otpLength - 1) {
            _focusNodes[index + 1].requestFocus();
          }
          if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
          }
        },
      ),
    );
  }

  Future<void> verifyOtp() async {
    String otp = _controllers.map((c) => c.text).join();

    if (otp.length < _otpLength) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter complete OTP")),
      );
      return;
    }

    setState(() => loading = true);

    try {
      var result = await ApiService.verifyOtp(
        userOtp: otp,
        userCc: widget.userCc,
      );

      setState(() => loading = false);

      if (result["status"] == "success") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreenPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result["message"] ?? "OTP verification failed"),
          ),
        );
      }
    } catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
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
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF525151),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Verify OTP",
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
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "OTP sent to\n${widget.email}",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _otpLength,
                  (index) => _buildOtpBox(index),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Resend in 00:${_secondsRemaining.toString().padLeft(2, '0')}",
              ),
              const SizedBox(height: 50),
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
                    onPressed: loading ? null : verifyOtp,
                    child: loading
                        ? const CircularProgressIndicator(color: Colors.black)
                        : const Text(
                            "Confirm",
                            style: TextStyle(color: Colors.black),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}
