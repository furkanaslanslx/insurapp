import 'package:flutter/material.dart';
import 'package:insurance/services/responsive.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';

class NewsAndUpdatesSection extends StatelessWidget {
  final ResponsiveSize _size = ResponsiveSize();
  NewsAndUpdatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: _size.getWidth(context, 670),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Haberler ve Güncellemeler",
                      style: TextStyle(
                        fontSize: _size.getWidth(context, 30),
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Daha Fazla Gör",
                        style: TextStyle(
                          color: themeNotifier.primaryColor,
                          fontSize: _size.getWidth(context, 30),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              width: _size.getWidth(context, 670),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Y kuşağının yaptığı üç yaygın finansal hata ve bunlardan nasıl kaçınılır.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: themeNotifier.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Finans konusunda yapılan üç yaygın tuzağı işaret ediyor..",
                          style: TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("28 Kasım 2019"),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Devamını Oku",
                                style: TextStyle(color: themeNotifier.primaryColor),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
