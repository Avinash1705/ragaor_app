import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rozgar_flutter_app/features/authenticate/controllers/SendOtpController.dart';
import 'package:rozgar_flutter_app/utils/AppConstants.dart';

import 'controllers/SignupController.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final otpController = TextEditingController();

  int currentStep = 1;

  final blue = const Color(0xff0d5cff);

  // 🔥 STEP 1 → SEND OTP
  void sendOtp() async {
    if (!_formKey.currentState!.validate()) return;

    // 👉 CALL API HERE
    // await Api.sendOtp(mobileController.text);
    SendOtpController sendOtpController = new SendOtpController();
    final result = await sendOtpController.sendOtp(
      mobileController.text,
    );
    if (result["status"] == true) {
      snack(result["message"]);

      setState(() {
        /*asdasdas*/
        // otp =
        print("signUpDD ${result}");
        currentStep = 2;
      });
    } else {
      snack(result["message"]);
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("OTP Sent")),
    );
  }
  void snack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
      ),
    );
  }
  // 🔥 STEP 2 → VERIFY OTP + SIGNUP
  void verifyOtp() async {
    String otp = otpController.text.trim();

    if (otp.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter valid OTP")),
      );
      return;
    }

    // 👉 VERIFY OTP API
    // final res = await Api.verifyOtp(mobileController.text, otp);

    bool isValid = true; // replace with API response

    if (isValid) {
      // 👉 SIGNUP API
      // await Api.signup(
      //   nameController.text,
      //   mobileController.text,
      //   passwordController.text,
      // );
      SignupController signupController = new SignupController();
      final result =
      await signupController.signup(
        username: nameController.text,
        phone: mobileController.text,
        password: passwordController.text,
        otp: otpController.text,
      );

      if (result["status"] == true) {
        context.go(AppConstants.login);
        print(result["message"]);

      } else {

        print(result["message"]);
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Signup Successful")),
      );


    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid OTP")),
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [

                const SizedBox(height: 50),

                /// 🔥 STEP 1 → SIGNUP FORM
                if (currentStep == 1)
                  Column(
                    children: [
                      title("FULL NAME"),
                      TextFormField(
                        controller: nameController,
                        decoration: field("Enter name", Icons.person),
                        validator: (v) =>
                        v!.isEmpty ? "Enter name" : null,
                      ),

                      const SizedBox(height: 20),

                      title("MOBILE"),
                      TextFormField(
                        controller: mobileController,
                        maxLength: 10,
                        keyboardType: TextInputType.phone,
                        decoration: field("9876543210", Icons.phone),
                        validator: (v) =>
                        v!.length != 10 ? "Invalid mobile" : null,
                      ),

                      const SizedBox(height: 20),

                      title("PASSWORD"),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: field("Password", Icons.lock),
                        validator: (v) =>
                        v!.length < 6 ? "Min 6 chars" : null,
                      ),

                      const SizedBox(height: 30),

                      button("Create Account →", sendOtp),
                    ],
                  ),

                /// 🔥 STEP 2 → OTP SCREEN
                if (currentStep == 2)
                  Column(
                    children: [
                      title("ENTER OTP"),
                      const SizedBox(height: 12),

                      TextField(
                        controller: otpController,
                        maxLength: 6,
                        keyboardType: TextInputType.number,
                        decoration: field("Enter OTP", Icons.lock_clock),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "OTP sent to ${mobileController.text}",
                        style: const TextStyle(color: Colors.grey),
                      ),

                      const SizedBox(height: 30),

                      button("Verify OTP →", verifyOtp),

                      const SizedBox(height: 10),

                      TextButton(
                        onPressed: () {
                          // 👉 Resend OTP API
                          // Api.sendOtp(mobileController.text);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("OTP Resent")),
                          );
                        },
                        child: const Text("Resend OTP"),
                      ),
                    ],
                  ),

                /// 🔥 STEP 3 → SUCCESS
                if (currentStep == 3)
                  Column(
                    children: const [
                      Icon(Icons.check_circle,
                          color: Colors.green, size: 80),
                      SizedBox(height: 20),
                      Text(
                        "Account Created Successfully!",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget title(String txt) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        txt,
        style: TextStyle(
          color: blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  InputDecoration field(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: Colors.grey.shade100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget button(String text, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}