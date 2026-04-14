import 'package:flutter/material.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() =>
      _SignUpScreenState();
}

class _SignUpScreenState
    extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController =
  TextEditingController();
  final mobileController =
  TextEditingController();
  final emailController =
  TextEditingController();
  final passwordController =
  TextEditingController();

  bool hidePassword = true;
  bool agreeTerms = true;

  final blue =
  const Color(0xff0d5cff);

  void signUp() {
    if (!_formKey.currentState!
        .validate()) return;

    if (!agreeTerms) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
              "Accept Terms & Privacy Policy"),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        content:
        Text("Account Created"),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Colors.white,
      body:
      SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// TOP BLUE HEADER
              Container(
                width:
                double.infinity,
                padding:
                const EdgeInsets.only(
                  top: 60,
                  left: 24,
                  right: 24,
                  bottom: 50,
                ),
                decoration:
                BoxDecoration(
                  color: blue,
                  borderRadius:
                  const BorderRadius.only(
                    bottomLeft:
                    Radius.circular(
                        70),
                    bottomRight:
                    Radius.circular(
                        70),
                  ),
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment
                      .start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 36,
                          width: 36,
                          decoration:
                          BoxDecoration(
                            color: Colors
                                .white24,
                            borderRadius:
                            BorderRadius.circular(
                                10),
                          ),
                          child:
                          const Icon(
                            Icons
                                .keyboard_double_arrow_up,
                            color: Colors
                                .white,
                          ),
                        ),
                        const SizedBox(
                            width:
                            10),
                        const Text(
                          "RozgarSetu",
                          style:
                          TextStyle(
                            color: Colors
                                .white,
                            fontSize:
                            24,
                            fontWeight:
                            FontWeight
                                .bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                        height:
                        28),

                    const Text(
                      "Create\nAccount",
                      style:
                      TextStyle(
                        color: Colors
                            .white,
                        fontSize:
                        44,
                        fontWeight:
                        FontWeight
                            .bold,
                        height: 1,
                      ),
                    ),

                    const SizedBox(
                        height:
                        14),

                    const Text(
                      "Join thousands finding their dream job",
                      style:
                      TextStyle(
                        color: Colors
                            .white70,
                        fontSize:
                        17,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                  height: 25),

              Padding(
                padding:
                const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  children: [
                    title(
                        "FULL NAME"),
                    const SizedBox(
                        height:
                        12),
                    TextFormField(
                      controller:
                      nameController,
                      decoration:
                      field(
                        "Navin Kumar",
                        Icons
                            .person_outline,
                      ),
                      validator:
                          (v) {
                        if (v ==
                            null ||
                            v.isEmpty) {
                          return "Enter full name";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                        height:
                        20),

                    title(
                        "MOBILE NUMBER"),
                    const SizedBox(
                        height:
                        12),
                    TextFormField(
                      controller:
                      mobileController,
                      maxLength:
                      10,
                      keyboardType:
                      TextInputType
                          .phone,
                      decoration:
                      field(
                        "9876543210",
                        Icons.phone,
                        counter:
                        "${mobileController.text.length}/10",
                      ),
                      onChanged:
                          (_) {
                        setState(
                                () {});
                      },
                      validator:
                          (v) {
                        if (v ==
                            null ||
                            v.length !=
                                10) {
                          return "Enter valid mobile";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                        height:
                        20),

                    title(
                        "EMAIL (OPTIONAL)"),
                    const SizedBox(
                        height:
                        12),
                    TextFormField(
                      controller:
                      emailController,
                      decoration:
                      field(
                        "navin@example.com",
                        Icons
                            .mail_outline,
                      ),
                      validator:
                          (v) {
                        if (v !=
                            null &&
                            v.isNotEmpty &&
                            !RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(
                                v)) {
                          return "Enter valid email";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                        height:
                        20),

                    title(
                        "PASSWORD"),
                    const SizedBox(
                        height:
                        12),
                    TextFormField(
                      controller:
                      passwordController,
                      obscureText:
                      hidePassword,
                      decoration:
                      field(
                        "Min. 8 characters",
                        Icons.lock,
                        suffix:
                        IconButton(
                          onPressed:
                              () {
                            setState(
                                    () {
                                  hidePassword =
                                  !hidePassword;
                                });
                          },
                          icon: Icon(
                              hidePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                        ),
                      ),
                      validator:
                          (v) {
                        if (v ==
                            null ||
                            v.length <
                                8) {
                          return "Minimum 8 characters";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                        height:
                        12),

                    /// TERMS
                    Row(
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      children: [
                        Checkbox(
                          value:
                          agreeTerms,
                          activeColor:
                          blue,
                          onChanged:
                              (v) {
                            setState(
                                    () {
                                  agreeTerms =
                                  v!;
                                });
                          },
                        ),
                        Expanded(
                          child:
                          Padding(
                            padding:
                            const EdgeInsets.only(
                                top:
                                10),
                            child:
                            RichText(
                              text:
                              TextSpan(
                                style:
                                const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                                children: [
                                  const TextSpan(
                                      text:
                                      "I agree to the "),
                                  TextSpan(
                                    text:
                                    "Terms of Service",
                                    style:
                                    TextStyle(
                                      color:
                                      blue,
                                      fontWeight:
                                      FontWeight.bold,
                                    ),
                                  ),
                                  const TextSpan(
                                      text:
                                      " and "),
                                  TextSpan(
                                    text:
                                    "Privacy Policy",
                                    style:
                                    TextStyle(
                                      color:
                                      blue,
                                      fontWeight:
                                      FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                        height:
                        20),

                    /// BUTTON
                    SizedBox(
                      width: double
                          .infinity,
                      height: 58,
                      child:
                      ElevatedButton(
                        onPressed:
                        signUp,
                        style:
                        ElevatedButton.styleFrom(
                          backgroundColor:
                          blue,
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(
                                30),
                          ),
                        ),
                        child:
                        const Text(
                          "Create Account  →",
                          style:
                          TextStyle(
                            fontSize:
                            20,
                            color: Colors
                                .white,
                            fontWeight:
                            FontWeight
                                .bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                        height:
                        30),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget title(String txt) {
    return Align(
      alignment:
      Alignment.centerLeft,
      child: Text(
        txt,
        style: TextStyle(
          color: blue,
          fontWeight:
          FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }

  InputDecoration field(
      String hint,
      IconData icon, {
        Widget? suffix,
        String? counter,
      }) {
    return InputDecoration(
      hintText: hint,
      prefixIcon:
      Icon(icon),
      suffixIcon: suffix,
      counterText: counter,
      filled: true,
      fillColor:
      Colors.grey.shade100,
      border:
      OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(
            18),
        borderSide:
        BorderSide.none,
      ),
    );
  }
}