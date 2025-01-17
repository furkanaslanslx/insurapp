import 'package:flutter/material.dart';
import 'package:insurance/services/responsive.dart';
import 'package:insurance/services/variables.dart';
import 'package:insurance/v/wdgts/navigatoin_wdgt.dart';
import 'package:insurance/vm/policy_viewmodel.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';

class PolicyWdgt extends StatefulWidget {
  final PolicyViewModel policyViewModel;
  final int index;
  final List<double> policyValues;
  const PolicyWdgt({super.key, required this.policyViewModel, required this.index, required this.policyValues});

  @override
  State<PolicyWdgt> createState() => _PolicyWdgtState();
}

class _PolicyWdgtState extends State<PolicyWdgt> {
  final ResponsiveSize _size = ResponsiveSize();
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
      return GestureDetector(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => MyinsuranceView(policyNo: widget.policyViewModel.policies[index].policyNo)));
          NavigatoinWdgt.navigatorKey.currentState?.navigateToPage(1, data: widget.policyViewModel.policies[widget.index].policyNo);
        },
        child: Card(
          margin: EdgeInsets.only(left: _size.getWidth(context, 40), right: _size.getWidth(context, 40), bottom: 10, top: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(_size.getWidth(context, 35)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.policyViewModel.policies[widget.index].productName,
                          style: TextStyle(
                            color: themeNotifier.primaryColor,
                            fontSize: _size.getWidth(context, 30),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.policyViewModel.policies[widget.index].policyNo,
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: _size.getWidth(context, 30),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: _size.getWidth(context, 70),
                      height: _size.getWidth(context, 70),
                      padding: EdgeInsets.all(_size.getWidth(context, 15)),
                      decoration: const BoxDecoration(
                        color: policiesColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Image.asset('assets/policies/rocking-chair-with-dollar-sign-silhouette.png'),
                    ),
                  ],
                ),
                SizedBox(height: _size.getHeight(context, 35)),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'POLİÇE DEĞERİ',
                          // widget.policyViewModel.policies[index].
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: _size.getWidth(context, 22),
                          ),
                        ),
                        Text(
                          '${widget.policyValues[widget.index]}',
                          style: TextStyle(
                            fontSize: _size.getWidth(context, 42),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: _size.getHeight(context, 24)),
                        Text(
                          'DURUM',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: _size.getWidth(context, 22),
                          ),
                        ),
                        Text(
                          // 'Yürürlükte',
                          widget.policyViewModel.policies[widget.index].status,
                          style: TextStyle(
                            fontSize: _size.getWidth(context, 42),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: _size.getWidth(context, 90)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'KATKI SAĞLAYAN',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: _size.getWidth(context, 22),
                          ),
                        ),
                        Text(
                          'Çalışan',
                          style: TextStyle(
                            fontSize: _size.getWidth(context, 42),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: _size.getHeight(context, 24)),
                        Text(
                          'TOPLAM KATKILAR',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: _size.getWidth(context, 22),
                          ),
                        ),
                        Text(
                          '72.502',
                          style: TextStyle(
                            fontSize: _size.getWidth(context, 42),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
