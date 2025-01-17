import 'package:flutter/material.dart';
import 'package:insurance/v/wdgts/mytxtfld_wdgt.dart';

class LastAgencyApplication extends StatefulWidget {
  const LastAgencyApplication({super.key});

  @override
  State<LastAgencyApplication> createState() => _LastAgencyApplicationState();
}

class _LastAgencyApplicationState extends State<LastAgencyApplication> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController acenteNameController = TextEditingController();
  final TextEditingController yetkiliNameController = TextEditingController();
  final TextEditingController yetkiliTitleController = TextEditingController();
  final TextEditingController yetkiliPhoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController tobbLevhaController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acente Formu'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                MytxtfldWdgt(
                  controller: acenteNameController,
                  hint: 'Acente Ticari Adı',
                  validator: (value) => value == null || value.isEmpty ? 'Bu alan zorunludur' : null,
                ),
                const SizedBox(height: 10),
                MytxtfldWdgt(
                  controller: yetkiliNameController,
                  hint: 'Yetkili Adı Soyadı',
                  validator: (value) => value == null || value.isEmpty ? 'Bu alan zorunludur' : null,
                ),
                const SizedBox(height: 10),
                MytxtfldWdgt(
                  controller: yetkiliTitleController,
                  hint: 'Yetkili Ünvanı',
                  validator: (value) => value == null || value.isEmpty ? 'Bu alan zorunludur' : null,
                ),
                const SizedBox(height: 10),
                MytxtfldWdgt(
                  controller: yetkiliPhoneController,
                  hint: 'Yetkili Telefon Numarası',
                  type: TextInputType.phone,
                  validator: (value) => value == null || value.isEmpty ? 'Bu alan zorunludur' : null,
                ),
                const SizedBox(height: 10),
                MytxtfldWdgt(
                  controller: addressController,
                  hint: 'Adres',
                  validator: (value) => value == null || value.isEmpty ? 'Bu alan zorunludur' : null,
                ),
                const SizedBox(height: 10),
                MytxtfldWdgt(
                  controller: cityController,
                  hint: 'İl',
                  validator: (value) => value == null || value.isEmpty ? 'Bu alan zorunludur' : null,
                ),
                const SizedBox(height: 10),
                MytxtfldWdgt(
                  controller: districtController,
                  hint: 'İlçe',
                  validator: (value) => value == null || value.isEmpty ? 'Bu alan zorunludur' : null,
                ),
                const SizedBox(height: 10),
                MytxtfldWdgt(
                  controller: tobbLevhaController,
                  hint: 'TOBB Levha Kayıt Numarası',
                  validator: (value) => value == null || value.isEmpty ? 'Bu alan zorunludur' : null,
                ),
                const SizedBox(height: 10),
                MytxtfldWdgt(
                  controller: phoneController,
                  hint: 'Telefon Numarası',
                  type: TextInputType.phone,
                  validator: (value) => value == null || value.isEmpty ? 'Bu alan zorunludur' : null,
                ),
                const SizedBox(height: 10),
                MytxtfldWdgt(
                  controller: emailController,
                  hint: 'E-posta Adresi',
                  type: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Bu alan zorunludur';
                    }
                    if (!RegExp(r'^\S+@\S+\.\S+\$').hasMatch(value)) {
                      return 'Geçerli bir e-posta adresi giriniz';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                MytxtfldWdgt(
                  controller: websiteController,
                  hint: 'Acente Web Sitesi',
                  validator: (value) => value == null || value.isEmpty ? 'Bu alan zorunludur' : null,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Form başarıyla gönderildi.')),
                      );
                    }
                  },
                  child: const Text('Gönder'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
