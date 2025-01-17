import 'package:flutter/material.dart';
import 'package:insurance/vm/insuranceagent_viewmodel.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';

class ClosestLocationView extends StatefulWidget {
  const ClosestLocationView({super.key});

  @override
  State<ClosestLocationView> createState() => _ClosestLocationViewState();
}

class _ClosestLocationViewState extends State<ClosestLocationView> {
  @override
  void initState() {
    super.initState();
    Provider.of<InsuranceagentViewmodel>(context, listen: false).fetchInsuranceAgents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('En Yakın'),
      ),
      body: Consumer<InsuranceagentViewmodel>(
        builder: (context, insurancegentmodel, child) {
          // debugPrint('Insurance Agents: ${insurancegentmodel.insuranceAgents.length}');
          return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
            return ListView.builder(
              itemCount: insurancegentmodel.insuranceAgents.length,
              itemBuilder: (context, index) {
                final agent = insurancegentmodel.insuranceAgents[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    color: themeNotifier.primaryColor,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            agent.name,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            agent.address,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.grey[200],
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          });
        },
      ),
    );
  }
}
