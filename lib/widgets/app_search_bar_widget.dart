import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hotel_booking_app/utils/app_colors.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({
    super.key,
  });

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .2),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  width: 8,
                ),
                isPressed
                    ? SizedBox(
                        height: 37,
                        width: 300,
                        child: TextField(
                          style: TextStyle(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Search places',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Text(
                            'Date range & Number of guests',
                            style: TextStyle(
                                color: AppColors.primaryColor, fontSize: 12),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
