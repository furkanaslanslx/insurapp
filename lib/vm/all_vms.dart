export 'customer_viewmodel.dart';
export 'insuranceagent_viewmodel.dart';
export 'policy_viewmodel.dart';
export 'login_viewmodel.dart';
export 'themenotifier.dart';

import 'package:flutter/material.dart';
import 'package:insurance/vm/customer_viewmodel.dart';
import 'package:insurance/vm/insuranceagent_viewmodel.dart';
import 'package:insurance/vm/policy_viewmodel.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';

class AllVms extends StatelessWidget {
  final Widget child;

  const AllVms({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PolicyViewModel()),
        ChangeNotifierProvider(create: (context) => InsuranceagentViewmodel()),
        ChangeNotifierProvider(create: (context) => CustomerViewModel()),
        ChangeNotifierProvider(create: (context) => ThemeNotifier()),
      ],
      child: child,
    );
  }
}
