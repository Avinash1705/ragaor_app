import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F4FB),

      body: SingleChildScrollView(
        child: Column(
          children: [

            /// TOP BLUE HEADER
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
                    Color(0xff1E2FA8),
                    Color(0xff2845D8),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),

              child: Column(
                children: [

                  /// TOP BUTTONS
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [

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

                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// COMPANY NAME
                  const Text(
                    "ABC",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "📍 ABC, ABC · Agriculture",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// VERIFICATION
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "⏳",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Verification Pending",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// STATS CARD
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(
                vertical: 24,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),

              child: const Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
                children: [

                  ProfileStat(
                    value: "0",
                    label: "Total Hired",
                  ),

                  VerticalDivider(),

                  ProfileStat(
                    value: "0.0 ⭐",
                    label: "Rating",
                  ),

                  VerticalDivider(),

                  ProfileStat(
                    value: "Pending",
                    label: "GST Status",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// MENU ITEMS
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [

                  buildMenuTile(
                    icon: Icons.business,
                    title: "Company Info",
                    color: Colors.blue,
                  ),

                  buildMenuTile(
                    icon: Icons.description,
                    title: "Documents",
                    color: Colors.orange,
                  ),

                  buildMenuTile(
                    icon: Icons.work,
                    title: "Posted Jobs",
                    color: Colors.green,
                  ),

                  buildMenuTile(
                    icon: Icons.account_balance_wallet,
                    title: "Billing & Escrow",
                    color: Colors.amber,
                  ),

                  buildMenuTile(
                    icon: Icons.star,
                    title: "Reviews & Ratings",
                    color: Colors.yellow,
                  ),

                  buildMenuTile(
                    icon: Icons.security,
                    title: "Privacy & Security",
                    color: Colors.redAccent,
                  ),

                  buildMenuTile(
                    icon: Icons.sos,
                    title: "SOS — I need help",
                    color: Colors.red,
                    textColor: Colors.red,
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuTile({
    required IconData icon,
    required String title,
    required Color color,
    Color textColor = Colors.black,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),

      child: Row(
        children: [

          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              icon,
              color: color,
              size: 28,
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ),

          const Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class ProfileStat extends StatelessWidget {
  final String value;
  final String label;

  const ProfileStat({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Text(
          value,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}