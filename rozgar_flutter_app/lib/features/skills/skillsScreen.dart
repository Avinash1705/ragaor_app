import 'package:flutter/material.dart';
import '../../sessionManager/SessionManager.dart';
import 'controllers/SkillController.dart';
import 'models/SkillResponse.dart'; // make sure path is correct

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  final skillController = SkillController();

  List<Skill> skills = [];
  bool isLoading = true;

  // use ID instead of index (important)
  Set<String> selectedSkillIds = {};

  @override
  void initState() {
    super.initState();
    loadSkills();
  }

  void loadSkills() async {
    try {
      final data = await skillController.getSkills();

      setState(() {
        skills = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint("Error: $e");
    }
  }

  String getIcon(String name) {
    switch (name.toLowerCase()) {
      case "painter":
        return "🎨";
      case "plumber":
        return "🔧";
      case "electrician":
        return "⚡";
      case "carpenter":
        return "🪚";
      case "driver":
        return "🚚";
      default:
        return "🛠️";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F5FF),
      body: SafeArea(
        child: Column(
          children: [
            _header(),

            /// BODY
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Your Skills',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// GRID
                    GridView.builder(
                      primary: false,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: skills.length,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                        MediaQuery.of(context).size.width > 700
                            ? 4
                            : 3,
                        mainAxisSpacing: 14,
                        crossAxisSpacing: 14,
                        mainAxisExtent: 150,
                      ),
                      itemBuilder: (context, index) {
                        final skill = skills[index];
                        final selected =
                        selectedSkillIds.contains(skill.id);

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selected) {
                                selectedSkillIds.remove(skill.id);
                              } else {
                                selectedSkillIds.add(skill.id);
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
                                      Text(
                                        getIcon(skill.name),
                                        style:
                                        const TextStyle(fontSize: 38),
                                      ),
                                      const SizedBox(height: 10),
                                      Flexible(
                                        child: Text(
                                          skill.name,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: selected
                                                ? const Color(0xff2E55F4)
                                                : Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    /// SELECTED INFO
                    if (selectedSkillIds.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xffEEF2FF),
                          borderRadius: BorderRadius.circular(20),
                          border:
                          Border.all(color: Colors.blue.shade100),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.check_box,
                                color: Colors.green, size: 32),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                '${selectedSkillIds.length} skill selected — You can now see ${selectedSkillIds.length * 170} matching jobs!',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff2442B5),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                    const SizedBox(height: 24),

                    /// BUTTON
                    if (selectedSkillIds.isNotEmpty)
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
                          onPressed: () async {
                            try {
                              // convert Set<String> → List<int>
                              final skillIds =
                              selectedSkillIds.map((e) => int.parse(e)).toList();

                              final success = await skillController.saveUserSkills(
                                userId: int.parse(SessionManager().user!.id), // replace with logged-in user id
                                skills: skillIds,
                              );

                              if (success) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Skills saved successfully")),
                                );

                                // 👉 navigate or fetch jobs here
                                // context.go(AppConstants.mainScreen);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Failed to save skills")),
                                );
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())),
                              );
                            }
                          },
                          child: const Text(
                            'Save & Find Jobs  →',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// HEADER
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
            child:
            Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
          SizedBox(height: 36),
          Text(
            'My Skills',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Tap the skills you know. More skills = more jobs.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}