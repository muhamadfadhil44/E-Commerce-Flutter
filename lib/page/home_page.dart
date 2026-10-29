import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/page/cart_page.dart';
import 'package:ecommerceapp/page/account_page.dart';
import 'package:ecommerceapp/page/home_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  static const Color backgroundColor = Color(0xFFF5F6F8);
  static const Color primaryColor = Color(0xFF252525);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      body: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: const [
          HomePageContent(),
          CartPage(),
          AccountPage(),
        ],
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: CurvedNavigationBar(
          index: _currentIndex,
          height: 68,
          backgroundColor: Colors.transparent,
          color: Colors.white,
          buttonBackgroundColor: primaryColor,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) {
            setState(() => _currentIndex = index);
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
            );
          },
          items: [
            Icon(
              Icons.home_rounded,
              size: 26,
              color: _currentIndex == 0 ? Colors.white : primaryColor,
            ),
            Icon(
              Icons.shopping_bag_rounded,
              size: 26,
              color: _currentIndex == 1 ? Colors.white : primaryColor,
            ),
            Icon(
              Icons.person_rounded,
              size: 26,
              color: _currentIndex == 2 ? Colors.white : primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}