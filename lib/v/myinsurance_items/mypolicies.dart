import 'package:flutter/material.dart';
import 'package:insurance/v/wdgts/policy_wdgt.dart';
import 'package:insurance/vm/policy_viewmodel.dart';
import 'package:provider/provider.dart';

class Mypolicies extends StatefulWidget {
  const Mypolicies({super.key});

  @override
  State<Mypolicies> createState() => _MypoliciesState();
}

class _MypoliciesState extends State<Mypolicies> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      thumbVisibility: true,
      child: Consumer<PolicyViewModel>(
        builder: (context, policyModel, child) {
          if (policyModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (policyModel.errorMessage.isNotEmpty) {
            return Center(child: Text(policyModel.errorMessage));
          } else {
            return ListView.builder(
              controller: _scrollController,
              itemCount: policyModel.policies.length,
              itemBuilder: (context, index) {
                double policyValue = 0.0;
                List<double> policyValues = [];

                for (var i = 0; i < policyModel.policies.length; i++) {
                  policyValue = 0.0;
                  for (var j = 0; j < policyModel.policies[i].paymentPlan.length; j++) {
                    policyValue += double.parse(policyModel.policies[i].paymentPlan[j].amount);
                  }
                  policyValues.add(double.parse(policyValue.toStringAsFixed(2)));
                }

                return PolicyWdgt(
                  policyViewModel: policyModel,
                  index: index,
                  policyValues: policyValues,
                );
              },
            );
          }
        },
      ),
    );
    // return Consumer<PolicyViewModel>(
    //   builder: (context, policyModel, child) {
    //     if (policyModel.isLoading) {
    //       return const Center(child: CircularProgressIndicator());
    //     } else if (policyModel.errorMessage.isNotEmpty) {
    //       return Center(child: Text(policyModel.errorMessage));
    //     } else {
    //       return ListView.builder(
    //         itemCount: policyModel.policies.length,
    //         itemBuilder: (context, index) {
    //           // return ListTile(
    //           //   title: Text(policyModel.policies[index].agencyName),
    //           //   subtitle: Text(policyModel.policies[index].productName),
    //           //   onTap: () {
    //           //     Navigator.pushNamed(context, '/myinsurance', arguments: policyModel.policies[index].policyNo);
    //           //   },
    //           // );
    //           // return MylisttileWdgt(
    //           //   title: policyModel.policies[index].agencyName,
    //           //   subtitle: policyModel.policies[index].productName,
    //           //   backgroundColor: containerColor,
    //           //   textColor: textColor,
    //           //   onTap: () {
    //           //     NavigatoinWdgt.navigatorKey.currentState?.navigateToPage(1, data: policyModel.policies[index].policyNo);
    //           //   },
    //           // );
    //           double policyValue = 0.0;
    //           List<double> policyValues = [];

    //           for (var i = 0; i < policyModel.policies.length; i++) {
    //             policyValue = 0.0;
    //             for (var j = 0; j < policyModel.policies[i].paymentPlan.length; j++) {
    //               policyValue += double.parse(policyModel.policies[i].paymentPlan[j].amount);
    //             }
    //             policyValues.add(double.parse(policyValue.toStringAsFixed(2)));
    //           }

    //           return PolicyWdgt(
    //             policyViewModel: policyModel,
    //             index: index,
    //             policyValues: policyValues,
    //           );
    //         },
    //       );
    //     }
    //   },
    // );
  }
}
