import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rozgar_flutter_app/goRoute/AppRoute.dart';

import 'controllers/ChangePasswordController.dart';
import 'controllers/SendOtpController.dart';
import 'controllers/VerifyOtpController.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final mobileController = TextEditingController();

  final otpController = TextEditingController();

  final passController = TextEditingController();

  final confirmController = TextEditingController();

  int currentStep = 1;

  bool hide1 = true;
  bool hide2 = true;

  bool isLoading = false;

  final blue = const Color(0xff0d5cff);

  Future<void> nextStep() async {
    /// STEP 1 SEND OTP
    if (currentStep == 1) {
      if (_formKey.currentState!.validate()) {
        setState(() {
          isLoading = true;
        });

        final controller = SendOtpController();

        final result = await controller.sendOtp(
          mobileController.text,
        );

        setState(() {
          isLoading = false;
        });

        if (result["status"] == true) {
          snack(result["message"]);

          setState(() {
            currentStep = 2;
          });
        } else {
          snack(result["message"]);
        }
      }
    }

    /// STEP 2 VERIFY OTP
    else if (currentStep == 2) {
      if (otpController.text.length != 4) {
        snack("Enter valid 4 digit OTP");
        return;
      }

      setState(() {
        isLoading = true;
      });

      final controller = VerifyOtpController();

      final result = await controller.verifyOtp(
        phone: mobileController.text,
        otp: otpController.text,
      );

      setState(() {
        isLoading = false;
      });

      if (result["status"] == true) {
        snack("OTP Verified");

        setState(() {
          currentStep = 3;
        });
      } else {
        snack(result["message"]);
      }
    }

    /// STEP 3 CHANGE PASSWORD
    else {
      if (passController.text.length < 6) {
        snack("Minimum 6 characters");
        return;
      }

      if (passController.text != confirmController.text) {
        snack("Password not matched");
        return;
      }

      setState(() {
        isLoading = true;
      });

      final controller = ChangePasswordController();

      final result = await controller.changePassword(
        phone: mobileController.text,
        password: passController.text,
      );

      setState(() {
        isLoading = false;
      });

      if (result["status"] == true) {
        snack(result["message"]);

        context.go(AppRoute.loginRoute);
      } else {
        snack(result["message"]);
      }
    }
  }

  void snack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
      ),
    );
  }

  @override
  void dispose() {
    mobileController.dispose();
    otpController.dispose();
    passController.dispose();
    confirmController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 60,
                left: 24,
                right: 24,
                bottom: 50,
              ),
              decoration: BoxDecoration(
                color: blue,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: const Text(
                      "← Back to Login",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.lock_reset,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "RozgarSetu",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    "Reset\nPassword 🔐",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    currentStep == 1
                        ? "We'll send a code to your mobile"
                        : currentStep == 2
                            ? "Enter OTP sent on mobile"
                            : "Create your new password",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                children: [
                  /// STEP INDICATOR
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      stepCircle(1, currentStep >= 1, "Mobile"),
                      const Expanded(child: Divider()),
                      stepCircle(2, currentStep >= 2, "OTP"),
                      const Expanded(child: Divider()),
                      stepCircle(3, currentStep >= 3, "Password"),
                    ],
                  ),

                  const SizedBox(height: 30),

                  /// STEP 1
                  if (currentStep == 1)
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          title("REGISTERED MOBILE NUMBER"),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: mobileController,
                            maxLength: 10,
                            keyboardType: TextInputType.phone,
                            decoration: field(
                              "98******10",
                              Icons.phone,
                            ),
                            validator: (v) {
                              if (v == null || v.length != 10) {
                                return "Enter valid mobile";
                              }

                              return null;
                            },
                          ),
                          infoBox(
                              "A 4-digit OTP will be sent to your registered mobile number."),
                          button("Send Reset Code →"),
                        ],
                      ),
                    ),

                  /// STEP 2
                  if (currentStep == 2)
                    Column(
                      children: [
                        title("ENTER OTP"),
                        const SizedBox(height: 12),
                        TextField(
                          controller: otpController,
                          maxLength: 4,
                          keyboardType: TextInputType.number,
                          decoration: field(
                            "Enter OTP",
                            Icons.lock_clock,
                          ),
                        ),
                        infoBox("OTP sent to ${mobileController.text}"),
                        button("Verify OTP →"),
                      ],
                    ),

                  /// STEP 3
                  if (currentStep == 3)
                    Column(
                      children: [
                        title("NEW PASSWORD"),
                        const SizedBox(height: 12),
                        TextField(
                          controller: passController,
                          obscureText: hide1,
                          decoration: field(
                            "New Password",
                            Icons.lock,
                            suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  hide1 = !hide1;
                                });
                              },
                              icon: Icon(
                                hide1 ? Icons.visibility : Icons.visibility_off,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        TextField(
                          controller: confirmController,
                          obscureText: hide2,
                          decoration: field(
                            "Confirm Password",
                            Icons.lock,
                            suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  hide2 = !hide2;
                                });
                              },
                              icon: Icon(
                                hide2 ? Icons.visibility : Icons.visibility_off,
                              ),
                            ),
                          ),
                        ),
                        button("Reset Password →"),
                      ],
                    ),
                ],
              ),
            ),
          ],
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
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget infoBox(String txt) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: blue,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              txt,
              style: TextStyle(
                color: blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget button(String txt) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: SizedBox(
        width: double.infinity,
        height: 58,
        child: ElevatedButton(
          onPressed: isLoading ? null : nextStep,
          style: ElevatedButton.styleFrom(
            backgroundColor: blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  txt,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }

  Widget stepCircle(int no, bool active, String txt) {
    return Column(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: active ? blue : Colors.grey.shade200,
          child: Text(
            "$no",
            style: TextStyle(
              color: active ? Colors.white : Colors.black54,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          txt,
          style: TextStyle(
            color: active ? blue : Colors.black54,
          ),
        ),
      ],
    );
  }

  InputDecoration field(
    String hint,
    IconData icon, {
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon),
      suffixIcon: suffix,
      filled: true,
      fillColor: Colors.grey.shade100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
    );
  }
}
