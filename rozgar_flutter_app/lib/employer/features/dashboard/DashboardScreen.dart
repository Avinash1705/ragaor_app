import 'package:flutter/material.dart';
import 'package:rozgar_flutter_app/employer/features/home/HomeScreen.dart';
import 'package:rozgar_flutter_app/employer/features/jobPost/PostJobScreen.dart';
import 'package:rozgar_flutter_app/employer/features/profile/ProfileScreen.dart';
import 'package:rozgar_flutter_app/employer/features/salary/SalaryEscrowScreen.dart';

import '../applications/ApplicationsScreen.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> pages = [
    Homescreen(),
    ApplicationsScreen() ,
    PostJobScreen(),
    SalaryEscrowScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2FB),
      body: pages[_selectedIndex],
      bottomNavigationBar: _buildBottomNav(),
    );
  }



  Widget _buildBottomNav() {
    final items = [
      {'icon': Icons.home_rounded, 'label': 'home'},
      {'icon': Icons.work_outline, 'label': 'Jobs'},
      {'icon': Icons.group_outlined, 'label': 'Workers'},
      {'icon': Icons.payments_outlined, 'label': 'Pay'},
      {'icon': Icons.person_outline, 'label': 'Profile'},
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 20,
            offset: Offset(0, -4),
          )
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (i) {
              final isSelected = i == _selectedIndex;
              return GestureDetector(
                onTap: () => setState(() => _selectedIndex = i),
                behavior: HitTestBehavior.opaque,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isSelected)
                      Container(
                        width: 5,
                        height: 5,
                        margin: const EdgeInsets.only(bottom: 4),
                        decoration: const BoxDecoration(
                          color: Color(0xFF1A3FD8),
                          shape: BoxShape.circle,
                        ),
                      ),
                    Icon(
                      items[i]['icon'] as IconData,
                      color: isSelected
                          ? const Color(0xFF1A3FD8)
                          : const Color(0xFF9CA3AF),
                      size: 26,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      items[i]['label'] as String,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.normal,
                        color: isSelected
                            ? const Color(0xFF1A3FD8)
                            : const Color(0xFF9CA3AF),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

