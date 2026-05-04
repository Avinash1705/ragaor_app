import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rozgar_flutter_app/goRoute/AppRoute.dart';
import 'package:rozgar_flutter_app/utils/AppConstants.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _header(context),
              const SizedBox(height: 16),
              _statsRow(),
              const SizedBox(height: 14),
              _menuCard('📋', 'My Applications'),
              _menuCard('💰', 'Salary History'),
              _documentsCard(),
              _menuCard('🛡️', 'Insurance'),
              _menuCard('🆘', 'SOS — I need help', isDanger: true),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 24),
      decoration: const BoxDecoration(
        color: Color(0xff2446F5),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: const [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white24,
                child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              context.push(AppRoute.editProfileRoute);
            },
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 34,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=12',
                  ),
                ),

                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Color(0xff2E55F4),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text('Delhi, Delhi • Weaving / Sewing',
              style: TextStyle(color: Colors.white70, fontSize: 15)),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Text('⭐ 0.0 Trust Score  •  Not Verified',
                style: TextStyle(fontWeight: FontWeight.w600)),
          )
        ],
      ),
    );
  }

  Widget _statsRow() {
    Widget card(String value, String label) {
      return Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            children: [
              Text(value,
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(label,
                  style: const TextStyle(color: Colors.black54, fontSize: 16)),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          card('0', 'Jobs Done'),
          card('0.0', 'Rating'),
          card('4yr', 'Experience'),
        ],
      ),
    );
  }

  Widget _menuCard(String emoji, String title, {bool isDanger = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: isDanger ? Colors.red.shade50 : Colors.blue.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(child: Text(emoji, style: const TextStyle(fontSize: 28))),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(title,
                style: TextStyle(
                  fontSize: 18,
                  color: isDanger ? Colors.red : Colors.black,
                  fontWeight: FontWeight.w600,
                )),
          ),
          const Icon(Icons.chevron_right, color: Colors.black26, size: 30)
        ],
      ),
    );
  }

  Widget _documentsCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Text('🪪', style: TextStyle(fontSize: 28)),
              SizedBox(width: 16),
              Expanded(
                child: Text('My Documents',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ),
              Icon(Icons.chevron_right, color: Colors.black26, size: 30)
            ],
          ),
          const Divider(height: 28),
          _docRow('Aadhar Card'),
          const Divider(),
          _docRow('Certificate'),
        ],
      ),
    );
  }

  Widget _docRow(String title) {
    return Row(
      children: [
        const Icon(Icons.file_copy_outlined, color: Colors.blue),
        const SizedBox(width: 12),
        Expanded(child: Text(title, style: const TextStyle(fontSize: 16))),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Text('Upload', style: TextStyle(color: Colors.blue)),
        ),
        const SizedBox(width: 8),
        const Icon(Icons.chevron_right, color: Colors.black26)
      ],
    );
  }
}
