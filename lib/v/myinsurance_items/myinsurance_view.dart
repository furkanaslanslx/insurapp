import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurance/m/policy_model.dart';
import 'package:insurance/services/responsive.dart';
import 'package:insurance/services/variables.dart';
import 'package:insurance/v/myinsurance_items/applications.dart';
import 'package:insurance/v/myinsurance_items/mypolicies.dart';
import 'package:insurance/v/myinsurance_items/tab_1.dart';
import 'package:insurance/v/myinsurance_items/tab_2.dart';
import 'package:insurance/v/myinsurance_items/tab_3.dart';
import 'package:insurance/v/wdgts/navigatoin_wdgt.dart';
import 'package:insurance/vm/login_viewmodel.dart';
import 'package:insurance/vm/policy_viewmodel.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';

class MyinsuranceView extends StatefulWidget {
  final String policyNo;
  const MyinsuranceView({super.key, this.policyNo = ''});

  @override
  State<MyinsuranceView> createState() => _MyinsuranceViewState();
}

class _MyinsuranceViewState extends State<MyinsuranceView> {
  final ResponsiveSize _size = ResponsiveSize();

  Widget _buildGridView(ThemeNotifier themeNotifier) {
    final List<Map<String, dynamic>> gridItems = [
      {'title': 'Kasko', 'icon': Icons.directions_car},
      {'title': 'Konut', 'icon': Icons.home},
      {'title': 'Sağlık', 'icon': Icons.local_hospital},
      {'title': 'Seyahat', 'icon': Icons.flight},
      {'title': 'İşyeri', 'icon': Icons.business},
      {'title': 'Nakliyat', 'icon': Icons.local_shipping},
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.5,
      ),
      itemCount: gridItems.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () {
              // TODO: Handle grid item tap
            },
            borderRadius: BorderRadius.circular(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  gridItems[index]['icon'],
                  size: 40,
                  color: themeNotifier.primaryColor,
                ),
                const SizedBox(height: 8),
                Text(
                  gridItems[index]['title'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<PolicyViewModel, ThemeNotifier>(
      builder: (context, policyViewModel, themeNotifier, child) {
        return Consumer<LoginViewModel>(
          builder: (context, loginViewModel, child) {
            if (policyViewModel.isLoading) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (policyViewModel.errorMessage.isNotEmpty) {
              return Center(child: Text(policyViewModel.errorMessage));
            } else {
              if (widget.policyNo.isNotEmpty) {
                Policy policy = policyViewModel.policies.firstWhere((element) => element.policyNo == widget.policyNo);
                return Scaffold(
                  appBar: CupertinoNavigationBar(
                    padding: const EdgeInsetsDirectional.only(start: 0.0),
                    middle: const Text('Poliçe Özeti', style: TextStyle(color: textColor)),
                    backgroundColor: themeNotifier.primaryColor,
                    leading: CupertinoNavigationBarBackButton(
                      color: Colors.blue,
                      previousPageTitle: 'Geri',
                      onPressed: () {
                        NavigatoinWdgt.navigatorKey.currentState?.navigateToPage(1, data: '');
                      },
                    ),
                  ),
                  body: Column(
                    children: [
                      Container(
                        width: _size.getWidth(context, 750),
                        height: _size.getWidth(context, 240),
                        decoration: BoxDecoration(
                          color: themeNotifier.primaryColor,
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(_size.getWidth(context, 50)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                policy.agencyName,
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: _size.getWidth(context, 30),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                policy.productName,
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: _size.getWidth(context, 30),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'NO:${policy.policyNo}',
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: _size.getWidth(context, 30),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: DefaultTabController(
                          length: 3,
                          child: Column(
                            children: [
                              const TabBar(
                                physics: NeverScrollableScrollPhysics(),
                                tabs: [
                                  Tab(text: 'ÜRÜN'),
                                  Tab(text: 'KATKI'),
                                  Tab(text: 'ÖDEME'),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    Tab1(policy: policy),
                                    Tab2(policy: policy),
                                    Tab3(policy: policy),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: navigationHeight),
                    ],
                  ),
                );
              } else {
                return Scaffold(
                  appBar: CupertinoNavigationBar(
                    middle: const Text('Poliçelerim', style: TextStyle(color: textColor)),
                    backgroundColor: themeNotifier.primaryColor,
                  ),
                  body: Column(
                    children: [
                      if (loginViewModel.isLoggedIn) ...[
                        const DefaultTabController(
                          length: 2,
                          child: Column(
                            children: [
                              TabBar(
                                physics: NeverScrollableScrollPhysics(),
                                tabs: [
                                  Tab(text: 'Poliçelerim'),
                                  Tab(text: 'Başvurularım'),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
                                    Mypolicies(),
                                    Applications(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ] else ...[
                        Expanded(child: _buildGridView(themeNotifier)),
                      ],
                      SizedBox(height: navigationHeight),
                    ],
                  ),
                );
              }
            }
          },
        );
      },
    );
  }
}
