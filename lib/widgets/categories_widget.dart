
import 'package:flutter/material.dart';

class CategoriesWidgets extends StatelessWidget {
  const CategoriesWidgets({super.key});

  static const Color primaryColor = Color(0xFF252525);
  static const Color backgroundColor = Color(0xFFF5F6F8);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'name': 'Outfit',
        'icon': Icons.checkroom_outlined,
      },
      {
        'name': 'Makanan',
        'icon': Icons.fastfood_outlined,
      },
      {
        'name': 'Pakaian',
        'icon': Icons.shopping_bag_outlined,
      },
      {
        'name': 'Elektronik',
        'icon': Icons.devices_outlined,
      },
      {
        'name': 'Skincare',
        'icon': Icons.face_retouching_natural_outlined,
      },
      {
        'name': 'Obat-obatan',
        'icon': Icons.medical_services_outlined,
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          for (final category in categories)
            Container(
              margin: const EdgeInsets.only(right: 10, top: 8, bottom: 8),
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 11,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xFFE8E8E8),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    category['icon'] as IconData,
                    size: 19,
                    color: primaryColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    category['name'] as String,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
