import 'package:flutter/material.dart';
import 'package:foobies_app/pages/health_bmi.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({super.key});

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  @override
  void initState() {
    print('Intial Health');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HealthPage'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Card(
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HealthBmi(),
                  ),
                ),
                child: Container(
                  width: 300,
                  height: 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('bmi.png'),
                    ),
                  ),
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'BMI Result',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
          // Center(
          //   child: Card(
          //     child: InkWell(
          //       onTap: () => '',
          //       child: Container(
          //         width: 300,
          //         height: 250,
          //         decoration: const BoxDecoration(
          //           image: DecorationImage(
          //             image: AssetImage('bmr.png'),
          //           ),
          //         ),
          //         alignment: Alignment.bottomLeft,
          //         padding: const EdgeInsets.all(8.0),
          //         child: const Text(
          //           'BMR Result',
          //           style: TextStyle(fontSize: 24),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ]),
      ),
    );
  }
}
