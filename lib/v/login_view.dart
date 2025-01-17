import 'package:flutter/material.dart';
import 'package:insurance/services/responsive.dart';
import 'package:insurance/v/innerdrawer_view.dart';
import 'package:insurance/v/wdgts/mybttn_wdgt.dart';
import 'package:insurance/v/wdgts/mytxtfld_wdgt.dart';
import 'package:insurance/services/variables.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ResponsiveSize _size = ResponsiveSize();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: const Color(0x00000000),
          leading: IconButton(
            onPressed: outerDrawerController.toggle,
            icon: const Icon(
              Icons.menu,
              color: textColor,
            ),
          ),
        ),
        backgroundColor: themeNotifier.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: _size.getHeight(context, kToolbarHeight + 50)),
              SizedBox(
                width: _size.getWidth(context, 300),
                height: _size.getWidth(context, 300),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/images/Arex-Branding-2.png'),
                ),
              ),
              SizedBox(height: _size.getHeight(context, 53)),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('AREX', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: textColor)),
                  Text("'e giriş yapın", style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal, color: textColor)),
                ],
              ),
              SizedBox(height: _size.getHeight(context, 20)),
              const Text('Devam etmek için kimlik bilgilerinizi girin', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: textColor)),
              SizedBox(height: _size.getHeight(context, 78)),
              Form(
                key: _formKey,
                child: SizedBox(
                  width: _size.getWidth(context, 540),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Row(
                        children: [
                          Text('TELEFON', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: textColor)),
                          Spacer(),
                        ],
                      ),
                      SizedBox(height: _size.getHeight(context, 15)),
                      MytxtfldWdgt(
                        color: textColor,
                        type: TextInputType.phone,
                        controller: _phoneController,
                        hint: '',
                        // validator: (givenPhone) {
                        //   if (givenPhone == null || givenPhone.isEmpty) {
                        //     return 'Telefon numarası gerekli';
                        //   }
                        //   if (givenPhone != '5321204075') {
                        //     return 'Geçersiz telefon numarası';
                        //   }
                        //   return null;
                        // },
                        validator: (p0) {
                          return null;
                        },
                      ),
                      SizedBox(height: _size.getHeight(context, 38)),
                      const Row(
                        children: [
                          Text('ŞİFRE', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: textColor)),
                          Spacer(),
                          Text('Şifremi Unuttum?', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: textColor)),
                        ],
                      ),
                      SizedBox(height: _size.getHeight(context, 15)),
                      MytxtfldWdgt(
                        obscureText: true,
                        type: TextInputType.text,
                        color: textColor,
                        controller: _passController,
                        hint: '',
                        // validator: (givenPass) {
                        //   if (givenPass == null || givenPass.isEmpty) {
                        //     return 'Şifre gerekli';
                        //   }
                        //   if (givenPass != '**') {
                        //     return 'Geçersiz şifre';
                        //   }
                        //   return null;
                        // },
                        validator: (p0) {
                          return null;
                        },
                      ),
                      SizedBox(height: _size.getHeight(context, 40)),
                      SizedBox(
                        width: _size.getWidth(context, 540),
                        height: _size.getHeight(context, 70),
                        child: MybttnWdgt(
                          text: 'Giriş Yap',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const InnerDrawerView()), (route) => false);
                            }
                          },
                          color: textColor,
                          textStyle: TextStyle(color: themeNotifier.primaryColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: _size.getHeight(context, 35)),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Hesabınız yok mu?', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: textColor.withValues(alpha: 0.7))),
                          const Text('  Kayıt ol', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: textColor)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
