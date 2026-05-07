import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rozgar_flutter_app/utils/ApiConstants.dart';

import '../../helper/ImagePickerHelper.dart';
import '../../sessionManager/SessionManager.dart';
import 'constrollers/ProfileController.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? selectedImage;
  final cityController = TextEditingController(text: 'Delhi');
  final stateController = TextEditingController(text: 'Delhi');
  String category = 'Weaving / Sewing';
  int years = 4;
  final profileController = ProfileController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2446F5),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 18),
          decoration: const BoxDecoration(
            color: Color(0xffF3F5FF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(34),
              topRight: Radius.circular(34),
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel', style: TextStyle(fontSize: 18)),
                    ),
                    const Text('Edit Profile',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 70),
                  ],
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    final file = await ImagePickerHelper.showPicker(context);

                    if (file != null) {
                      setState(() {
                        selectedImage = file;
                      });
                    }
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 62,
                        backgroundImage: selectedImage != null
                            // ?  FileImage(selectedImage!)
                      ? NetworkImage(ApiConstants.urlUpload+"${SessionManager().profileImage}")
                            : const NetworkImage('https://i.pravatar.cc/150?img=32')
                        as ImageProvider,
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Color(0xff2E55F4),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.camera_alt, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                _label('CITY'),
                _field(cityController,SessionManager().city),
                const SizedBox(height: 18),
                _label('STATE'),
                _field(stateController,SessionManager().state),
                const SizedBox(height: 18),
                _label('JOB CATEGORY'),
                _dropdown(),
                const SizedBox(height: 18),
                _label('EXPERIENCE (YEARS)'),
                _experienceBox(),
                const SizedBox(height: 30),
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
                        final success = await profileController.updateProfile(
                          userId: int.parse(SessionManager().user!.id.toString()),
                          city: cityController.text,
                          state: stateController.text,
                          experience: years.toString(),
                          imageFile: selectedImage, // File?
                        );

                        if (success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Profile updated")),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.toString())),
                        );
                      }
                    },
                    child: const Text('Save Profile  →',
                        style: TextStyle(fontSize: 24, color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _label(String text) => Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text,
          style: const TextStyle(
              color: Color(0xff2446F5),
              fontWeight: FontWeight.bold,
              fontSize: 16)),
    ),
  );

  Widget _field(TextEditingController controller,String? hint) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _dropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: category,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 'Weaving / Sewing', child: Text('Weaving / Sewing')),
            DropdownMenuItem(value: 'Electrician', child: Text('Electrician')),
            DropdownMenuItem(value: 'Plumber', child: Text('Plumber')),
          ],
          onChanged: (v) => setState(() => category = v!),
        ),
      ),
    );
  }

  Widget _experienceBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _circleBtn(Icons.remove, () {
            if (years > 0) setState(() => years--);
          }),
          Text('$years yrs',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          _circleBtn(Icons.add, () {
            setState(() => years++);
          }),
        ],
      ),
    );
  }

  Widget _circleBtn(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 46,
        height: 46,
        decoration: const BoxDecoration(
          color: Color(0xff2E55F4),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
