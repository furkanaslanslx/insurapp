import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:insurance/services/responsive.dart';
import 'package:insurance/services/variables.dart';
import 'package:insurance/v/settings_view.dart';
import 'package:insurance/vm/customer_viewmodel.dart';
import 'package:insurance/vm/policy_viewmodel.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ResponsiveSize _size = ResponsiveSize();
  final CardSwiperController controller = CardSwiperController();
  final ScrollController _scrollController = ScrollController();

  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
      final double percentage = (_scrollOffset / 100).clamp(0.0, 1.0);
      final double dynamicOpacity = 0.9 * percentage;
      final Color dynamicColor = themeNotifier.primaryColor.withValues(alpha: dynamicOpacity);
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: dynamicColor,
          centerTitle: true,
          foregroundColor: Colors.white,
          title: const Text('Profilim'),
          leading: IconButton(
            onPressed: innerDrawerController.toggle,
            icon: const Icon(
              Icons.menu,
              color: textColor,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsView()));
              },
              icon: const Icon(
                Icons.settings,
                color: textColor,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: _size.getWidth(context, 350),
                width: _size.getWidth(context, 750),
                color: themeNotifier.primaryColor.withValues(alpha: 0.9),
              ),
              Consumer<CustomerViewModel>(
                builder: (context, customerModel, child) {
                  return Consumer<PolicyViewModel>(
                    builder: (context, policyModel, child) {
                      return Column(
                        children: [
                          SizedBox(
                            height: kToolbarHeight + MediaQuery.paddingOf(context).top - 60,
                          ),
                          Container(
                            width: _size.getWidth(context, 670),
                            height: _size.getWidth(context, 446),
                            decoration: BoxDecoration(
                              color: themeNotifier.primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: _size.getHeight(context, 40)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: _size.getWidth(context, 240),
                                      height: _size.getWidth(context, 240),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Container(
                                          width: _size.getWidth(context, 228),
                                          height: _size.getWidth(context, 228),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: themeNotifier.primaryColor,
                                          ),
                                          child: Center(
                                            child: Container(
                                              width: _size.getWidth(context, 216),
                                              height: _size.getWidth(context, 216),
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.grey,
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(_size.getWidth(context, 108)),
                                                child: Image.asset('assets/images/313137218_823832725623962_4713508681434990830_n.jpg'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: _size.getWidth(context, 30)),
                                    Text(
                                      '${customerModel.customer?.customerName}',
                                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textColor),
                                    ),
                                  ],
                                ),
                                SizedBox(height: _size.getWidth(context, 30)),
                                Text(
                                  '${customerModel.customer?.address}',
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: textColor),
                                ),
                                SizedBox(height: _size.getWidth(context, 10)),
                                Text(
                                  '${customerModel.customer?.email}',
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: textColor),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: _size.getWidth(context, 30)),
                          PersonalInfo(size: _size),
                          ContactInformation(size: _size),
                          FinancialInformation(size: _size),
                          SizedBox(height: navigationHeight),
                          const SizedBox(height: 500),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}

class FinancialInformation extends StatelessWidget {
  const FinancialInformation({
    super.key,
    required ResponsiveSize size,
  }) : _size = size;

  final ResponsiveSize _size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _size.getWidth(context, 670),
      height: _size.getWidth(context, 200),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.grey, width: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Finansal Bilgiler', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
              SizedBox(height: _size.getWidth(context, 20)),
              const Text('Ödeme Planları, Tarihleri, Miktarları'),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactInformation extends StatelessWidget {
  const ContactInformation({
    super.key,
    required ResponsiveSize size,
  }) : _size = size;

  final ResponsiveSize _size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _size.getWidth(context, 670),
      height: _size.getWidth(context, 200),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.grey, width: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('İletişim Bilgileri', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
              SizedBox(height: _size.getWidth(context, 20)),
              const Text('E-Posta Adresi, Cep Telefonu, Adres'),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({
    super.key,
    required ResponsiveSize size,
  }) : _size = size;

  final ResponsiveSize _size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _size.getWidth(context, 670),
      height: _size.getWidth(context, 200),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.grey, width: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Kişisel Bilgilerim', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
              SizedBox(height: _size.getWidth(context, 20)),
              const Text('Doğum Yeri, Doğum Tarihi, Meslek'),
            ],
          ),
        ),
      ),
    );
  }
}
