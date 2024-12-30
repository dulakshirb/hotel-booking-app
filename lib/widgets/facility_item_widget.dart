import 'package:flutter/material.dart';

class FacilityItem extends StatelessWidget {
  final String itemName;
  const FacilityItem({
    super.key,
    required this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          size: 5,
          color: Colors.grey,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          itemName,
          style: TextStyle(color: Colors.grey, fontSize: 11),
        ),
        SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
