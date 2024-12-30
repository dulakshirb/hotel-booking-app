import 'package:flutter/material.dart';
import 'package:hotel_booking_app/utils/app_colors.dart';

class SubHeading extends StatelessWidget {
  final String headingText;
  const SubHeading({
    super.key,
    required this.headingText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      headingText,
      style: TextStyle(
        color: AppColors.textColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
