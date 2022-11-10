import 'package:flutter/material.dart';
import 'package:foobies_app/providers/health_bmi_provider.dart';
import 'package:provider/provider.dart';

class HealthBmi extends StatefulWidget {
  const HealthBmi({super.key});

  @override
  State<HealthBmi> createState() => _HealthBmiState();
}

class _HealthBmiState extends State<HealthBmi> {
  late HealthBMIProvider healthBmiProvider;

  @override
  void initState() {
    healthBmiProvider = Provider.of<HealthBMIProvider>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    healthBmiProvider.heightCtl.dispose();
    healthBmiProvider.weightCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: healthBmiProvider.formKey,
          child: Column(
            children: [
              /// Height Input
              TextFormField(
                controller: healthBmiProvider.heightCtl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Height (cm)',
                ),
              ),
              const SizedBox(height: 16),

              /// Weight Input
              TextFormField(
                controller: healthBmiProvider.weightCtl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Weight (kg)',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /// Calculate
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => healthBmiProvider.calculate(),
                      child: const Text('Calculate'),
                    ),
                  ),
                  const SizedBox(width: 8),

                  /// Reset
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        healthBmiProvider.reset();
                      },
                      child: const Text('Reset'),
                    ),
                  ),
                ],
              ),

              Consumer<HealthBMIProvider>(
                builder: (context, value, child) {
                  if (value.resultBMI == 0) {
                    return Container();
                  }
                  return Card(
                    elevation: 15,
                    color: value.categoryColor,
                    child: Container(
                      alignment: Alignment.center,
                      width: 300,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            value.resultBMI.toStringAsFixed(2),
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            value.categoryBMI,
                            style: const TextStyle(fontSize: 36),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
