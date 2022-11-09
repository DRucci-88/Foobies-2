import 'package:flutter/material.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HealthPage'),
      ),
      body: Container(
          child: Row(
        children: <Widget>[
          Expanded(
            flex: 2, // 20%
            child: Container(color: Colors.red),
          ),
          Expanded(
            flex: 6, // 60%
            child: Container(color: Colors.green),
          ),
          Expanded(
            flex: 2, // 20%
            child: Container(color: Colors.blue),
          )
        ],
      )),
    );
  }
}
