import 'package:flutter/material.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  Set<int> selectedIndexes = {};

  final List<Map<String, String>> skills = [
    {'icon': '🧱', 'title': 'Mason /\nRaj Mistri'},
    {'icon': '⚡', 'title': 'Electrician'},
    {'icon': '🔧', 'title': 'Plumber'},
    {'icon': '🎨', 'title': 'Painter'},
    {'icon': '🪚', 'title': 'Carpenter'},
    {'icon': '🧵', 'title': 'Weaving /\nSewing'},
    {'icon': '🚚', 'title': 'Driver /\nHelper'},
    {'icon': '🌾', 'title': 'Farm Worker'},
    {'icon': '🏠', 'title': 'Domestic\nHelper'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F5FF),
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Select Your Skills',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    GridView.builder(
                      primary: false,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: skills.length,
                      gridDelegate:
                       SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width > 700 ? 4 : 3,
                        mainAxisSpacing: 14,
                        crossAxisSpacing: 14,
                        mainAxisExtent: 150,
                      ),
                      itemBuilder: (context, index) {
                        final item = skills[index];
                        final selected = selectedIndexes.contains(index);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedIndexes.contains(index)) {
                                selectedIndexes.remove(index);
                              } else {
                                selectedIndexes.add(index);
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: selected
                                  ? const Color(0xffEEF2FF)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                color: selected
                                    ? const Color(0xff2E55F4)
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Stack(
                                children: [
                                if (selected)
                            const Align(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              radius: 14,
                              backgroundColor:
                              Color(0xff2E55F4),
                              child: Icon(Icons.check,
                                  color: Colors.white,
                                  size: 16),
                            ),
                          ),
                          Center(
                            child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                            Text(item['icon']!,
                                style: const TextStyle(
                                    fontSize: 38)),
                            const SizedBox(height: 10),
                            Flexible(
                              child: Text(item['title']!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: selected
                                        ? const Color(0xff2E55F4)
                                        : Colors.black,
                                    fontWeight:
                                    FontWeight.w500,
                                  )),
                            )],
                            ),
                          )
                        ],
                        ),
                        ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    if (selectedIndexes.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xffEEF2FF),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.blue.shade100),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.check_box,
                                color: Colors.green, size: 32),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                '${selectedIndexes.length} skill selected — You can now see ${selectedIndexes.length * 170} matching jobs!',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff2442B5),
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                    if (selectedIndexes != -1) const SizedBox(height: 24),
                    if (selectedIndexes.isNotEmpty)
                      SizedBox(
                        width: double.infinity,
                        height: 62,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff2E55F4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Save & Find Jobs  →',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 14, 18, 30),
      decoration: const BoxDecoration(
        color: Color(0xff2446F5),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.white24,
            child: Icon(Icons.arrow_back_ios_new,
                color: Colors.white),
          ),
          SizedBox(height: 36),
          Text('My Skills',
              style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          SizedBox(height: 8),
          Text(
            'Tap the skills you know. More skills = more jobs.',
            style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
