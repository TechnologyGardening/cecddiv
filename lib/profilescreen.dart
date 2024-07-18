import 'package:flutter/material.dart';
import 'package:cecddiv/abcd/imagenames.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          ProfileImage(),
          ProfileDetails(),
        ],
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        profileimg,
        height: 200,
        width: 200,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'John Doe',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          _buildProfileRow("Designation", "Programmer"),
          _buildProfileRow("Age", "95"),
        ],
      ),
    );
  }
}

Widget _buildProfileRow(String heading, String value) {
  return Row(
    children: [
      Text(
        '$heading : ',
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      Text(value),
    ],
  );
}
