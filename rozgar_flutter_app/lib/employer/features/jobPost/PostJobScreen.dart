import 'package:flutter/material.dart';

class PostJobScreen extends StatefulWidget {
  const PostJobScreen({super.key});

  @override
  State<PostJobScreen> createState() =>
      _PostJobScreenState();
}

class _PostJobScreenState
    extends State<PostJobScreen> {
  int currentStep = 1;

  bool food = false;
  bool stay = false;
  bool travel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5FC),

      body: Column(
        children: [

          /// HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 60,
              left: 20,
              right: 20,
              bottom: 30,
            ),

            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff1F36C7),
                  Color(0xff3152F0),
                ],
              ),
            ),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                /// BACK
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 26),

                /// TITLE
                const Text(
                  "📝 Naya Job Post Karo",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                /// STEPPER
                Row(
                  children: List.generate(
                    3,
                        (index) {
                      bool active =
                          currentStep == index + 1;

                      return Container(
                        margin:
                        const EdgeInsets.only(
                          right: 10,
                        ),
                        width: active ? 36 : 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: active
                              ? Colors.white
                              : Colors.white38,
                          borderRadius:
                          BorderRadius.circular(
                            20,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          /// BODY
          Expanded(
            child: SingleChildScrollView(
              padding:
              const EdgeInsets.all(22),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  if (currentStep == 1)
                    buildStep1(),

                  if (currentStep == 2)
                    buildStep2(),

                  if (currentStep == 3)
                    buildStep3(),

                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ],
      ),

      /// BUTTON
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,

        child: GestureDetector(
          onTap: () {
            if (currentStep < 3) {
              setState(() {
                currentStep++;
              });
            }
          },

          child: Container(
            height: 64,

            decoration: BoxDecoration(
              color: const Color(0xff3152F0),
              borderRadius:
              BorderRadius.circular(40),
            ),

            child: Center(
              child: Text(
                currentStep == 3
                    ? "Post Job  →"
                    : "Next → →",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// STEP 1
  Widget buildStep1() {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [

        const Text(
          "Step 1 — Job Details",
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 30),

        buildLabel("JOB TITLE *"),

        buildField("Raj Mistri / Mason"),

        const SizedBox(height: 30),

        buildLabel("SKILL REQUIRED"),

        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            skillChip("🧱 Mason"),
            skillChip("⚡ Electrician"),
            skillChip("🔧 Plumber"),
            skillChip("🎨 Painter"),
            skillChip("🧵 Weaver"),
            skillChip("🚚 Driver"),
            skillChip("🌾 Farm Worker"),
            skillChip("👷 Helper"),
          ],
        ),

        const SizedBox(height: 30),

        Row(
          children: [

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  buildLabel(
                      "MONTHLY SALARY ₹ *"),
                  buildField("12,000"),
                ],
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  buildLabel(
                      "WORKERS NEEDED"),
                  buildField("10"),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        Row(
          children: [

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  buildLabel(
                      "DURATION (DAYS)"),
                  buildField("30"),
                ],
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  buildLabel("START DATE"),
                  buildField("26 Apr 2026"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// STEP 2
  Widget buildStep2() {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [

        const Text(
          "Step 2 — Facilities Included",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 30),

        buildSwitchTile(
          emoji: "🍽️",
          title: "Food Provided",
          value: food,
          onChanged: (v) {
            setState(() {
              food = v;
            });
          },
        ),

        buildSwitchTile(
          emoji: "🏠",
          title: "Stay / Accommodation",
          value: stay,
          onChanged: (v) {
            setState(() {
              stay = v;
            });
          },
        ),

        buildSwitchTile(
          emoji: "🚌",
          title: "Travel from Village",
          value: travel,
          onChanged: (v) {
            setState(() {
              travel = v;
            });
          },
        ),

        const SizedBox(height: 20),

        Container(
          padding: const EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: const Color(0xffFFF4E3),
            borderRadius:
            BorderRadius.circular(24),
            border: Border.all(
              color: Colors.orange.shade300,
            ),
          ),

          child: const Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              Text(
                "💰 Escrow Required: ₹333",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff7A4A00),
                ),
              ),

              SizedBox(height: 12),

              Text(
                "Salary pehle lock hogi. Workers tab travel karenge.",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// STEP 3
  Widget buildStep3() {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [

        const Text(
          "Step 3 — Review & Post",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 30),

        reviewTile("Job Title", "Helper"),
        reviewTile("Skills", "🏠 Helper"),
        reviewTile("Salary", "₹10000/month"),
        reviewTile("Workers", "1"),
        reviewTile("Duration", "1 days"),
        reviewTile("Food", "✅ Yes"),
        reviewTile("Stay", "✅ Yes"),
        reviewTile("Travel", "✅ Yes"),
        reviewTile("Escrow Lock", "₹333",
            valueColor: Colors.orange),
      ],
    );
  }

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xff243DBD),
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget buildField(String hint) {
    return Container(
      height: 76,
      padding:
      const EdgeInsets.symmetric(horizontal: 22),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xffD9DDF5),
        ),
      ),

      alignment: Alignment.centerLeft,

      child: Text(
        hint,
        style: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 22,
        ),
      ),
    );
  }

  Widget skillChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 14,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: const Color(0xffD8DDF7),
        ),
      ),

      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget buildSwitchTile({
    required String emoji,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),

      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: const Color(0xffD8DDF7),
        ),
      ),

      child: Row(
        children: [

          Text(
            emoji,
            style: const TextStyle(fontSize: 28),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),

          Switch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget reviewTile(
      String label,
      String value, {
        Color valueColor = Colors.black,
      }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),

      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 24,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xffD8DDF7),
        ),
      ),

      child: Row(
        children: [

          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 22,
              ),
            ),
          ),

          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}