import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurance/services/responsive.dart';
import 'package:insurance/services/variables.dart';
import 'package:insurance/v/tab1_content.dart';
import 'package:insurance/v/tab2_content.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';
import 'package:tinycolor2/tinycolor2.dart';
import 'package:animations/animations.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  final ResponsiveSize _size = ResponsiveSize();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return Scaffold(
          extendBodyBehindAppBar: false,
          appBar: CupertinoNavigationBar(
            middle: Image.asset('assets/images/Arex-Branding-5.png'),
            backgroundColor: themeNotifier.primaryColor,
            leading: IconButton(
              onPressed: innerDrawerController.toggle,
              icon: const Icon(
                Icons.menu,
                color: textColor,
                size: 30,
              ),
            ),
          ),
          body: Column(
            children: [
              OpenContainer(
                transitionType: ContainerTransitionType.fade,
                closedColor: themeNotifier.primaryColor,
                closedShape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0.0))),
                openBuilder: (context, _) => const Tab2Content(),
                closedBuilder: (context, openContainer) {
                  return Container(
                    color: themeNotifier.primaryColor,
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: openContainer,
                            child: AbsorbPointer(
                              child: CupertinoTextField(
                                enabled: false,
                                style: const TextStyle(color: Colors.white70),
                                controller: _searchController,
                                placeholder: 'Ara...',
                                placeholderStyle: const TextStyle(color: CupertinoColors.inactiveGray),
                                prefix: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Icon(CupertinoIcons.search, color: CupertinoColors.inactiveGray),
                                ),
                                decoration: BoxDecoration(
                                  color: themeNotifier.primaryColor.brighten(10),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                transitionDuration: const Duration(milliseconds: 500),
              ),
              Expanded(child: Tab1Content(size: _size)),
            ],
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
