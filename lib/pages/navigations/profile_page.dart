import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfilePage'),
        backgroundColor: Colors.red,
      ),
      body: Center(
          child: SizedBox(
        width: double.infinity,
        height: 400,
        child: Column(
          children: const [
            Icon(
              Icons.person,
              size: 216,
            ),
            Text(
              'Norbertus Dewa Rucci',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 48),
            ),
          ],
        ),
      )),
    );
  }
}
