
import 'package:flutter/material.dart';
import 'package:ecommerceapp/widgets/home_appbar.dart';
import 'package:ecommerceapp/widgets/categories_widget.dart';
import 'package:ecommerceapp/widgets/items_widgets.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  static const Color backgroundColor = Color(0xFFF5F6F8);
  static const Color primaryColor = Color(0xFF252525);
  static const Color secondaryTextColor = Color(0xFF777777);
  static const Color borderColor = Color(0xFFEEEEEE);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // App bar
          const HomeAppbar(),

          // Search bar
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: borderColor),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Cari produk...',
                  hintStyle: TextStyle(
                    color: Color(0xFFAAAAAA),
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: secondaryTextColor,
                    size: 22,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ),

          // Category heading
          _buildSectionHeader(
            title: 'Kategori',
            subtitle: 'Temukan produk berdasarkan kategori',
          ),

          const SizedBox(height: 16),

          // Categories
          const CategoriesWidgets(),

          const SizedBox(height: 30),

          // Product heading
          _buildSectionHeader(
            title: 'Produk',
            subtitle: 'Jelajahi produk pilihan kami',
          ),

          const SizedBox(height: 16),

          // Product list/grid
          const ItemsWidget(),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w700,
              color: primaryColor,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 13,
              color: secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
