import 'package:flutter/material.dart';
import 'package:hotel_booking_app/utils/app_colors.dart';

class H4Heading extends StatelessWidget {
  final String headingText;
  const H4Heading({
    super.key,
    required this.headingText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      headingText,
      style: TextStyle(
        color: AppColors.textColor,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }
}
