import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  final String mobile;

  const OtpScreen({
    super.key,
    required this.mobile,
  });

  @override
  State<OtpScreen> createState() =>
      _OtpScreenState();
}

class _OtpScreenState
    extends State<OtpScreen> {
  final otp1 =
  TextEditingController();
  final otp2 =
  TextEditingController();
  final otp3 =
  TextEditingController();
  final otp4 =
  TextEditingController();
  final otp5 =
  TextEditingController();
  final otp6 =
  TextEditingController();

  Widget otpBox(
      TextEditingController c) {
    return SizedBox(
      width: 48,
      child: TextField(
        controller: c,
        keyboardType:
        TextInputType.number,
        maxLength: 1,
        textAlign:
        TextAlign.center,
        decoration:
        InputDecoration(
          counterText: "",
          filled: true,
          fillColor:
          Colors.grey.shade100,
          border:
          OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(
                14),
            borderSide:
            BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Colors.white,
      appBar: AppBar(
        title:
        const Text("Verify OTP"),
        centerTitle: true,
      ),
      body: Padding(
        padding:
        const EdgeInsets.all(
            24),
        child: Column(
          children: [
            const SizedBox(
                height: 30),

            const Text(
              "Enter OTP",
              style: TextStyle(
                fontSize: 30,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(
                height: 10),

            Text(
              "Code sent to ${widget.mobile}",
              style: const TextStyle(
                color:
                Colors.black54,
              ),
            ),

            const SizedBox(
                height: 40),

            Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
              children: [
                otpBox(otp1),
                otpBox(otp2),
                otpBox(otp3),
                otpBox(otp4),
                otpBox(otp5),
                otpBox(otp6),
              ],
            ),

            const SizedBox(
                height: 40),

            SizedBox(
              width:
              double.infinity,
              height: 55,
              child:
              ElevatedButton(
                onPressed: () {
                  String otp =
                      otp1.text +
                          otp2.text +
                          otp3.text +
                          otp4.text +
                          otp5.text +
                          otp6.text;

                  if (otp.length ==
                      6) {
                    ScaffoldMessenger.of(
                        context)
                        .showSnackBar(
                      SnackBar(
                        content: Text(
                            "OTP Verified: $otp"),
                      ),
                    );
                  }
                },
                style:
                ElevatedButton.styleFrom(
                  backgroundColor:
                  const Color(
                      0xff0d5cff),
                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(
                        28),
                  ),
                ),
                child: const Text(
                  "Verify OTP",
                  style:
                  TextStyle(
                    fontSize: 18,
                    color: Colors
                        .white,
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