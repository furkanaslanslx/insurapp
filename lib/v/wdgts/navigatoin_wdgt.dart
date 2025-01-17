import 'package:flutter/material.dart';
import 'package:insurance/services/responsive.dart';
import 'package:insurance/services/variables.dart';
import 'package:insurance/v/landing_view.dart';
import 'package:insurance/v/myinsurance_items/myinsurance_view.dart';
import 'package:insurance/v/insideproducts_view.dart';
import 'package:insurance/v/profile_view.dart';
import 'package:insurance/vm/customer_viewmodel.dart';
import 'package:insurance/vm/insuranceagent_viewmodel.dart';
import 'package:insurance/vm/policy_viewmodel.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';
import 'package:animations/animations.dart';

class NavigatoinWdgt extends StatefulWidget {
  NavigatoinWdgt({Key? key}) : super(key: navigatorKey);

  static final navigatorKey = GlobalKey<_NavigatoinWdgtState>();

  @override
  State<NavigatoinWdgt> createState() => _NavigatoinWdgtState();
}

class _NavigatoinWdgtState extends State<NavigatoinWdgt> {
  int _selectedIndex = 0;
  String myinsuranceData = '';

  static final List<Widget> _pages = <Widget>[
    const LandingView(),
    const MyinsuranceView(policyNo: ''),
    const InsideProductsView(),
    const ProfileView(),
  ];

  void _onItemTapped(int index, {String? data}) {
    setState(() {
      _selectedIndex = index;
      if (index == 1 && data != null) {
        myinsuranceData = data;
        _pages[1] = MyinsuranceView(policyNo: myinsuranceData);
      }
      if (data?.isEmpty ?? true) {
        myinsuranceData = '';
        _pages[1] = const MyinsuranceView(policyNo: '');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Provider.of<PolicyViewModel>(context, listen: false).fetchPolicies();
    Provider.of<InsuranceagentViewmodel>(context, listen: false).fetchInsuranceAgents();
    Provider.of<CustomerViewModel>(context, listen: false).fetchCustomer();
  }

  final ResponsiveSize _size = ResponsiveSize();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              PageTransitionSwitcher(
                transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
                  return FadeThroughTransition(
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  );
                },
                child: _pages[_selectedIndex],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: navigationHeight,
                  padding: EdgeInsets.zero,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: (() {
                      if (navigationHeight == 50) {
                        return CrossAxisAlignment.center;
                      } else {
                        return CrossAxisAlignment.start;
                      }
                    }()),
                    children: [
                      Expanded(flex: 1, child: Container()),
                      Expanded(
                        flex: 4,
                        child: InkWell(
                          onTap: () => _onItemTapped(0, data: ''),
                          child: Padding(
                            padding: const EdgeInsets.all(12.5),
                            child: SizedBox(
                              width: _size.getWidth(context, 50),
                              height: _size.getHeight(context, 50),
                              child: Icon(
                                Icons.home,
                                color: _selectedIndex == 0 ? themeNotifier.primaryColor : Colors.grey[500],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: InkWell(
                          onTap: () => _onItemTapped(1, data: ''),
                          child: Padding(
                            padding: const EdgeInsets.all(12.5),
                            child: SizedBox(
                              width: _size.getWidth(context, 50),
                              height: _size.getHeight(context, 50),
                              child: Icon(
                                Icons.security,
                                color: _selectedIndex == 1 ? themeNotifier.primaryColor : Colors.grey[500],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: InkWell(
                          onTap: () => _onItemTapped(2, data: ''),
                          child: Padding(
                            padding: const EdgeInsets.all(12.5),
                            child: SizedBox(
                              width: _size.getWidth(context, 50),
                              height: _size.getHeight(context, 50),
                              child: Icon(
                                Icons.add,
                                color: _selectedIndex == 2 ? themeNotifier.primaryColor : Colors.grey[500],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: InkWell(
                          onTap: () => _onItemTapped(3, data: ''),
                          child: Padding(
                            padding: const EdgeInsets.all(12.5),
                            child: SizedBox(
                              width: _size.getWidth(context, 50),
                              height: _size.getHeight(context, 50),
                              child: Icon(
                                Icons.person,
                                color: _selectedIndex == 3 ? themeNotifier.primaryColor : Colors.grey[500],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(flex: 1, child: Container()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void navigateToPage(int index, {required String data}) {
    _onItemTapped(index, data: data);
  }
}
