// File: tab1_content.dart
import 'package:flutter/cupertino.dart';
import 'package:insurance/services/responsive.dart';
import 'package:insurance/services/variables.dart';
import 'package:insurance/v/wdgts/damage_assistance.dart';
import 'package:insurance/v/wdgts/all_products_section.dart';
import 'package:insurance/v/wdgts/claim_section.dart';
import 'package:insurance/v/wdgts/insurance_calculator_section.dart';
import 'package:insurance/v/wdgts/news_and_update_section.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';

class Tab1Content extends StatefulWidget {
  final ResponsiveSize size;

  const Tab1Content({super.key, required this.size});

  @override
  State<Tab1Content> createState() => _Tab1ContentState();
}

class _Tab1ContentState extends State<Tab1Content> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            height: widget.size.getWidth(context, 345),
            width: widget.size.getWidth(context, 750),
            color: themeNotifier.primaryColor,
          ),
          Column(
            children: [
              SizedBox(height: widget.size.getWidth(context, 20)),
              const DamageAssistance(),
              const AllProductsSection(),
              NewsAndUpdatesSection(),
              const SizedBox(height: 20),
              const InsuranceCalculatorSection(),
              const SizedBox(height: 20),
              ClaimsSection(),
              SizedBox(height: navigationHeight),
            ],
          ),
        ],
      ),
    );
  }
}
              // int _pageIndex = 0;
              // GestureDetector(
              //   onTap: () {
              //     NavigatoinWdgt.navigatorKey.currentState?.navigateToPage(3, data: '');
              //   },
              //   child: Container(
              //     width: widget.size.getWidth(context, 670),
              //     decoration: BoxDecoration(
              //       color: themeNotifier.secondaryColor,
              //       borderRadius: const BorderRadius.all(Radius.circular(15)),
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         SizedBox(width: widget.size.getWidth(context, 30)),
              //         Stack(
              //           alignment: AlignmentDirectional.center,
              //           children: [
              //             Container(
              //               height: widget.size.getWidth(context, 180),
              //               width: widget.size.getWidth(context, 180),
              //               margin: const EdgeInsets.all(5),
              //               decoration: const BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.all(Radius.circular(400)),
              //               ),
              //             ),
              //             Container(
              //               height: widget.size.getWidth(context, 170),
              //               width: widget.size.getWidth(context, 170),
              //               margin: const EdgeInsets.all(5),
              //               decoration: BoxDecoration(
              //                 color: Colors.grey[400],
              //                 borderRadius: const BorderRadius.all(Radius.circular(400)),
              //               ),
              //               child: ClipRRect(
              //                 borderRadius: BorderRadius.circular(widget.size.getWidth(context, 108)),
              //                 child: Image.asset('assets/images/313137218_823832725623962_4713508681434990830_n.jpg'),
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(width: widget.size.getWidth(context, 30)),
              //         Expanded(
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 'Hoş Geldiniz Samet Türel',
              //                 style: TextStyle(color: themeNotifier.primaryColor, fontWeight: FontWeight.bold, fontSize: 15),
              //                 maxLines: 4,
              //                 overflow: TextOverflow.ellipsis,
              //               ),
              //               Text(
              //                 'Lütfen sigorta poliçenizi kontrol edin',
              //                 style: TextStyle(color: themeNotifier.primaryColor, fontWeight: FontWeight.normal, fontSize: 12),
              //                 maxLines: 2,
              //                 overflow: TextOverflow.ellipsis,
              //               ),
              //             ],
              //           ),
              //         ),
              //         Icon(Icons.chevron_right, color: themeNotifier.primaryColor, size: widget.size.getHeight(context, 90)),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(height: widget.size.getHeight(context, 40)),
              // Consumer<LoginViewModel>(
              //   builder: (context, loginViewModel, child) {
              //     if (!loginViewModel.isLoggedIn) {
              //       return const SizedBox.shrink();
              //     }
//
              //     return SizedBox(
              //       height: widget.size.getWidth(context, 470),
              //       child: Consumer<PolicyViewModel>(
              //         builder: (context, policyViewModel, child) {
              //           if (policyViewModel.isLoading) {
              //             return const Center(child: CupertinoActivityIndicator());
              //           } else if (policyViewModel.errorMessage.isNotEmpty) {
              //             return Text(policyViewModel.errorMessage);
              //           } else {
              //             return PageView.builder(
              //               itemCount: policyViewModel.policies.length,
              //               physics: const BouncingScrollPhysics(),
              //               onPageChanged: (index) {
              //                 setState(() {
              //                   _pageIndex = index;
              //                 });
              //               },
              //               itemBuilder: (context, index) {
              //                 double policyValue = 0.0;
              //                 List<double> policyValues = [];
//
              //                 for (var i = 0; i < policyViewModel.policies.length; i++) {
              //                   policyValue = 0.0;
              //                   for (var j = 0; j < policyViewModel.policies[i].paymentPlan.length; j++) {
              //                     policyValue += double.parse(policyViewModel.policies[i].paymentPlan[j].amount);
              //                   }
              //                   policyValues.add(double.parse(policyValue.toStringAsFixed(2)));
              //                 }
//
              //                 return PolicyWdgt(
              //                   policyViewModel: policyViewModel,
              //                   index: index,
              //                   policyValues: policyValues,
              //                 );
              //               },
              //             );
              //           }
              //         },
              //       ),
              //     );
              //   },
              // ),
              // SizedBox.shrink(
              //   child: Consumer<PolicyViewModel>(
              //     builder: (context, policyViewModel, child) {
              //       return ListView.builder(
              //         itemCount: policyViewModel.policies.length,
              //         shrinkWrap: true,
              //         scrollDirection: Axis.horizontal,
              //         itemBuilder: (context, index) {
              //           return AnimatedContainer(
              //             duration: const Duration(milliseconds: 300),
              //             curve: Curves.easeInOut,
              //             width: widget.size.getWidth(context, 20) + (_pageIndex == index ? 10 : 0),
              //             height: widget.size.getWidth(context, 20),
              //             margin: const EdgeInsets.symmetric(horizontal: 10),
              //             decoration: BoxDecoration(
              //               color: _pageIndex == index ? themeNotifier.primaryColor : themeNotifier.primaryColor.withValues(alpha: 0.4),
              //               borderRadius: const BorderRadius.all(Radius.circular(10)),
              //             ),
              //           );
              //         },
              //       );
              //     },
              //   ),
              // ),