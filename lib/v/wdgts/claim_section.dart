import 'package:flutter/material.dart';
import 'package:insurance/services/responsive.dart';
import 'package:insurance/v/wdgts/claims_button.dart';

class ClaimsSection extends StatelessWidget {
  final ResponsiveSize _size = ResponsiveSize();
  ClaimsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _size.getWidth(context, 670),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Talepler",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ClaimsButton(
                  icon: Icons.track_changes,
                  text: "Taleplerinizi Takip Edin",
                ),
              ),
              VerticalDivider(width: 1),
              Expanded(
                child: ClaimsButton(
                  icon: Icons.receipt_long,
                  text: "Talep Süreci",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
