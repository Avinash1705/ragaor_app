import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rozgar_flutter_app/goRoute/AppRoute.dart';
import 'package:rozgar_flutter_app/utils/AppConstants.dart';

import '../../sessionManager/SessionManager.dart';
import 'controllers/LoginController.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;
  final authController = LoginController();
  final session = SessionManager();
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  final mobileController =
  TextEditingController();

  final passwordController =
  TextEditingController();

  @override
  void dispose() {
    mobileController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void loginUser(String phone, String pass) async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await authController.login(
        phone: phone,
        password: pass,
      );

      if (result != null && result.status) {
        print("Token: ${result.token}");
        print("User: ${result.data.username}");

        session.saveLogin(result);

        context.go(AppConstants.mainScreen);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login failed")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text("Login Success"),
        ),
      );

      /// API CALL HERE
      context.go(AppConstants.mainScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// TOP SECTION
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 60,
                  left: 24,
                  right: 24,
                  bottom: 50,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xff0d5cff),
                  borderRadius: BorderRadius.only(
                    bottomLeft:
                    Radius.circular(70),
                    bottomRight:
                    Radius.circular(70),
                  ),
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "← Back to Sign Up",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 25),

                    Row(
                      children: [
                        Container(
                          height: 36,
                          width: 36,
                          decoration:
                          BoxDecoration(
                            color:
                            Colors.white24,
                            borderRadius:
                            BorderRadius
                                .circular(
                                10),
                          ),
                          child: const Icon(
                            Icons
                                .keyboard_double_arrow_up,
                            color:
                            Colors.white,
                          ),
                        ),
                        const SizedBox(
                            width: 10),
                        const Text(
                          "RozgarSetu",
                          style: TextStyle(
                            color:
                            Colors.white,
                            fontSize: 24,
                            fontWeight:
                            FontWeight
                                .bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "Welcome\nBack! 👋",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 44,
                        fontWeight:
                        FontWeight.bold,
                        height: 1,
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      "Sign in to continue your job search",
                      style: TextStyle(
                        color:
                        Colors.white70,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding:
                const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child:isLoading ?const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                    strokeWidth: 2,
                  ),
                ): Column(
                  crossAxisAlignment:
                  CrossAxisAlignment
                      .start,
                  children: [
                    const Text(
                      "MOBILE NUMBER",
                      style: TextStyle(
                        color:
                        Color(0xff0d5cff),
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    TextFormField(
                      controller:
                      mobileController,
                      keyboardType:
                      TextInputType
                          .phone,
                      maxLength: 10,
                      decoration:
                      InputDecoration(
                        counterText: "",
                        hintText:
                        "9876543210",
                        prefixIcon:
                        const Icon(
                          Icons.phone,
                        ),
                        filled: true,
                        fillColor:
                        Colors.grey,
                        border:
                        OutlineInputBorder(
                          borderRadius:
                          BorderRadius
                              .circular(
                              18),
                          borderSide:
                          BorderSide
                              .none,
                        ),
                      ),
                      validator:
                          (value) {
                        if (value == null ||
                            value
                                .isEmpty) {
                          return "Enter mobile number";
                        } else if (value
                            .length !=
                            10) {
                          return "Mobile must be 10 digits";
                        } else if (!RegExp(
                            r'^[0-9]+$')
                            .hasMatch(
                            value)) {
                          return "Only digits allowed";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "PASSWORD",
                      style: TextStyle(
                        color:
                        Color(0xff0d5cff),
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    TextFormField(
                      controller:
                      passwordController,
                      obscureText:
                      hidePassword,
                      decoration:
                      InputDecoration(
                        hintText:
                        "Enter password",
                        prefixIcon:
                        const Icon(Icons
                            .lock_outline),
                        suffixIcon:
                        IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword =
                              !hidePassword;
                            });
                          },
                          icon: Icon(
                            hidePassword
                                ? Icons
                                .visibility
                                : Icons
                                .visibility_off,
                          ),
                        ),
                        filled: true,
                        fillColor:
                        Colors.grey,
                        border:
                        OutlineInputBorder(
                          borderRadius:
                          BorderRadius
                              .circular(
                              18),
                          borderSide:
                          BorderSide
                              .none,
                        ),
                      ),
                      validator:
                          (value) {
                        if (value == null ||
                            value
                                .isEmpty) {
                          return "Enter password";
                        }
                        else if (value
                            .length <
                            3) {
                          return "Minimum 4 characters";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 8),

                    Align(
                      alignment:
                      Alignment
                          .centerRight,
                      child: TextButton(
                        onPressed: () {
                          context.push(AppRoute.resetRoute);
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Color(
                                0xff0d5cff),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width:
                      double.infinity,
                      height: 58,
                      child:
                      ElevatedButton(
                        style:
                        ElevatedButton
                            .styleFrom(
                          backgroundColor:
                          const Color(
                              0xff0d5cff),
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(
                                30),
                          ),
                        ),
                        onPressed:() => loginUser(mobileController.text,passwordController.text),
                        child: const Text(
                          "Sign In",
                          style:
                          TextStyle(
                            fontSize: 20,
                            color: Colors
                                .white,
                            fontWeight:
                            FontWeight
                                .bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    InkWell(
                      onTap: () =>  context.push(AppRoute.signupRoute),
                      child: Center(
                        child: RichText(
                          text:
                          const TextSpan(
                            style:
                            TextStyle(
                              color: Colors
                                  .black54,
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(
                                text:
                                "Don't have an account? ",
                              ),
                              TextSpan(
                                text:
                                "Sign Up",
                                style:
                                TextStyle(
                                  color: Color(
                                      0xff0d5cff),
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}