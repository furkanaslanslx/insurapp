import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';
import 'package:tinycolor2/tinycolor2.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Ayarlar'),
          actions: [
            IconButton(
              icon: const Icon(Icons.restart_alt_outlined),
              onPressed: () {
                themeNotifier.setPrimaryColor(const Color(0xFF1a1532));
                themeNotifier.setSecondaryColor(const Color(0xFF57bec5));
              },
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Birincil Rengi Seçin "Koyu Renk"'),
                const SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: ColorPicker(
                    pickerAreaHeightPercent: 0.8,
                    labelTypes: const [],
                    enableAlpha: false,
                    pickerAreaBorderRadius: const BorderRadius.all(Radius.circular(20)),
                    pickerColor: themeNotifier.primaryColor,
                    onColorChanged: (color) {
                      double luminance = color.computeLuminance();
                      if (luminance >= 0.07) {
                        TinyColor tinyColor = TinyColor.fromColor(color);
                        Color adjustedColor = tinyColor.darken(1).color;
                        while (adjustedColor.computeLuminance() >= 0.07) {
                          tinyColor = TinyColor.fromColor(adjustedColor);
                          adjustedColor = tinyColor.darken(1).color;
                        }
                        themeNotifier.setPrimaryColor(adjustedColor);
                      } else {
                        themeNotifier.setPrimaryColor(color);
                      }
                    },
                  ),
                ),
                const Text('İkincil Rengi Seçin "Açık Renk"'),
                const SizedBox(height: 20),
                Consumer<ThemeNotifier>(
                  builder: (context, themeNotifier, child) {
                    return SizedBox(
                      width: 300,
                      child: ColorPicker(
                        pickerAreaHeightPercent: 0.8,
                        labelTypes: const [],
                        enableAlpha: false,
                        pickerAreaBorderRadius: const BorderRadius.all(Radius.circular(20)),
                        pickerColor: themeNotifier.secondaryColor,
                        onColorChanged: (color) {
                          double luminance = color.computeLuminance();
                          if (luminance < 0.5) {
                            TinyColor tinyColor = TinyColor.fromColor(color);
                            Color adjustedColor = tinyColor.lighten(1).color;
                            while (adjustedColor.computeLuminance() < 0.5) {
                              tinyColor = TinyColor.fromColor(adjustedColor);
                              adjustedColor = tinyColor.lighten(1).color;
                            }
                            color = adjustedColor;
                          }
                          themeNotifier.setSecondaryColor(color);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
