import 'package:flutter/material.dart';

class ApplicationsScreen extends StatefulWidget {
  const ApplicationsScreen({super.key});

  @override
  State<ApplicationsScreen> createState() =>
      _ApplicationsScreenState();
}

class _ApplicationsScreenState
    extends State<ApplicationsScreen> {
  int selectedTab = 0;

  final tabs = [
    "Pending (3)",
    "Accepted (1)",
    "Rejected (1)",
  ];

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

                /// BACK BUTTON
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
                Row(
                  children: [

                    const Text(
                      "📋 Applications",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(width: 14),

                    Container(
                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius:
                        BorderRadius.circular(30),
                      ),

                      child: const Text(
                        "3 New",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight:
                          FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// TABS
          Container(
            height: 70,
            margin:
            const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),

            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tabs.length,

              itemBuilder: (context, index) {
                bool isSelected =
                    selectedTab == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = index;
                    });
                  },

                  child: Container(
                    margin:
                    const EdgeInsets.only(
                      right: 14,
                    ),

                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 26,
                    ),

                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.transparent
                          : Colors.white,
                      borderRadius:
                      BorderRadius.circular(
                        26,
                      ),
                      border: Border.all(
                        color: isSelected
                            ? const Color(
                            0xff3152F0)
                            : const Color(
                            0xffD7DDF7),
                        width: 2,
                      ),
                    ),

                    alignment: Alignment.center,

                    child: Text(
                      tabs[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight:
                        FontWeight.bold,
                        color: isSelected
                            ? const Color(
                            0xff3152F0)
                            : Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          /// APPLICATION LIST
          Expanded(
            child: ListView(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              children: [

                buildApplicationCard(
                  avatar: "👷",
                  name: "Ramu Kumar",
                  location:
                  "📍 Varanasi, UP · 3 yrs exp",
                  rating: "4.8",
                  appliedFor:
                  "Applied for: Raj Mistri · 30 days · ₹12,000",
                  tag1: "✅ Aadhaar Verified",
                  tag2: "12 Jobs Done",
                ),

                buildApplicationCard(
                  avatar: "👩",
                  name: "Meena Devi",
                  location:
                  "📍 Murshidabad, Bengal · 5 yrs",
                  rating: "4.9",
                  appliedFor:
                  "Applied for: Weaving Operator · 60 days · ₹9,500",
                  tag1: "✅ Aadhaar Verified",
                  tag2: "Top Rated",
                ),

                buildApplicationCard(
                  avatar: "👷‍♂️",
                  name: "Suresh Bind",
                  location:
                  "📍 Gaya, Bihar · 2 yrs exp",
                  rating: "4.5",
                  appliedFor:
                  "Applied for: Factory Helper · 45 days · ₹8,000",
                  tag1: "7 Jobs Done",
                  tag2: "",
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildApplicationCard({
    required String avatar,
    required String name,
    required String location,
    required String rating,
    required String appliedFor,
    required String tag1,
    required String tag2,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 22),

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          /// TOP INFO
          Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              /// AVATAR
              Container(
                width: 72,
                height: 72,

                decoration: BoxDecoration(
                  color:
                  const Color(0xffFFF6E9),
                  shape: BoxShape.circle,
                ),

                alignment: Alignment.center,

                child: Text(
                  avatar,
                  style:
                  const TextStyle(fontSize: 34),
                ),
              ),

              const SizedBox(width: 18),

              /// DETAILS
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      location,
                      style: TextStyle(
                        color:
                        Colors.grey.shade600,
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
              ),

              /// RATING
              Row(
                children: [

                  const Text(
                    "⭐",
                    style:
                    TextStyle(fontSize: 24),
                  ),

                  const SizedBox(width: 4),

                  Text(
                    rating,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 24),

          /// APPLIED FOR
          Text(
            appliedFor,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 20,
            ),
          ),

          const SizedBox(height: 20),

          /// TAGS
          Row(
            children: [

              buildTag(
                text: tag1,
                color: Colors.green,
                bg: Colors.green.withOpacity(
                  0.12,
                ),
              ),

              if (tag2.isNotEmpty)
                const SizedBox(width: 12),

              if (tag2.isNotEmpty)
                buildTag(
                  text: tag2,
                  color: Colors.indigo,
                  bg: Colors.indigo
                      .withOpacity(0.08),
                ),
            ],
          ),

          const SizedBox(height: 26),

          /// BUTTONS
          Row(
            children: [

              Expanded(
                child: buildButton(
                  text: "✕ Reject",
                  bg: const Color(0xffFFECEF),
                  textColor: Colors.red,
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: buildButton(
                  text: "💬 Chat",
                  bg: const Color(0xffEEF1FF),
                  textColor:
                  const Color(0xff3152F0),
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: buildButton(
                  text: "✓ Accept",
                  bg: const Color(0xff3152F0),
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTag({
    required String text,
    required Color color,
    required Color bg,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),

      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget buildButton({
    required String text,
    required Color bg,
    required Color textColor,
  }) {
    return Container(
      height: 58,

      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),

      alignment: Alignment.center,

      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}