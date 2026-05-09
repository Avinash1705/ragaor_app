import 'package:flutter/material.dart';

class SalaryEscrowScreen extends StatelessWidget {
  const SalaryEscrowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F4FB),

      body: SingleChildScrollView(
        child: Column(
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
                color: Color(0xff181C4D),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// BACK BUTTON
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white12,
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 80),

                  /// TITLE
                  const Text(
                    "💰 Salary & Escrow",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// ESCROW CARD
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(26),

                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(28),
                    ),

                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        const Text(
                          "TOTAL ESCROW BALANCE",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            letterSpacing: 1,
                          ),
                        ),

                        const SizedBox(height: 14),

                        const Text(
                          "₹5,40,000",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 52,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "48 workers · Releases Friday",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// STATUS CARD
            Container(
              margin:
              const EdgeInsets.symmetric(horizontal: 20),

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),

              child: Row(
                children: [

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: const Text(
                      "✅ On Site Confirmed",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  const Spacer(),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 16,
                    ),

                    decoration: BoxDecoration(
                      color: const Color(0xff2F54EB),
                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: const Row(
                      children: [
                        Text(
                          "Release",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// WORKER CARD 1
            workerCard(
              name: "Meena Devi",
              work: "Weaving · Day 5/60 · Week 1",
              amount: "₹2,375",
              progress: 0.12,
              week: "Week 1 of 9",
              released: "₹0 released",
              status: "✅ Arrived",
            ),

            /// WORKER CARD 2
            workerCard(
              name: "Anil Sharma",
              work: "Painter · Day 28/30 · Week 4",
              amount: "₹2,750",
              progress: 0.80,
              week: "Week 4 of 5",
              released: "₹9,000 released",
              status: "✅ On Site",
            ),

            const SizedBox(height: 30),

            /// RELEASE ALL BUTTON
            Container(
              margin:
              const EdgeInsets.symmetric(horizontal: 20),

              padding: const EdgeInsets.symmetric(
                vertical: 22,
              ),

              decoration: BoxDecoration(
                color: const Color(0xff181C4D),
                borderRadius: BorderRadius.circular(28),
              ),

              child: const Center(
                child: Text(
                  "🚀 Release All — ₹5,40,000",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget workerCard({
    required String name,
    required String work,
    required String amount,
    required double progress,
    required String week,
    required String released,
    required String status,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      work,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),

              Text(
                amount,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor:
              Colors.green.withOpacity(0.12),
              valueColor:
              const AlwaysStoppedAnimation(
                Colors.green,
              ),
            ),
          ),

          const SizedBox(height: 14),

          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [

              Text(
                week,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 18,
                ),
              ),

              Text(
                released,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 18,
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          Row(
            children: [

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),

                decoration: BoxDecoration(
                  color:
                  Colors.green.withOpacity(0.1),
                  borderRadius:
                  BorderRadius.circular(16),
                ),

                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const Spacer(),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 14,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xff2F54EB),
                  borderRadius:
                  BorderRadius.circular(18),
                ),

                child: const Row(
                  children: [

                    Text(
                      "Release",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(width: 6),

                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}