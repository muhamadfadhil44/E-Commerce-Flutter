import 'package:flutter/material.dart';

class CartAppbar extends StatelessWidget {
  const CartAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.primary,
      elevation: 6,
      shadowColor: Colors.black38,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Icon(
                Icons.arrow_back,
                size: 22,
                color: Color.fromARGB(238, 255, 255, 255),
              ),
            ),
            const Padding(
              padding: EdgeInsetsGeometry.only(left: 20),
              child: Text(
                'My Cart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            const Icon(Icons.more_vert, size: 30, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
