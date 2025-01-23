import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:insurance/v/innerdrawer_view.dart';
import 'package:insurance/v/outerdrawer_view.dart';
import 'package:insurance/vm/all_vms.dart';

void main() {
  Get.put<MyInnerDrawerController>(MyInnerDrawerController());
  Get.put<MyOuterDrawerController>(MyOuterDrawerController());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: AllVms(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFFFFFFF),
            fontFamily: 'OpenSans',
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          themeMode: ThemeMode.light,
          // home: const Introduction(),
          home: const InnerDrawerView(),
        ),
      ),
    );
  }
}
