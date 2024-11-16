import 'package:flutter/material.dart';
import 'package:offline_app/data/food_data.dart';

import '../widgets/menu_item_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //// ***** App Bar ***** /////
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: const Icon(Icons.sort),
        actions: [
          Container(
            height: 35,
            width: 35,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26.withOpacity(0.15),
                  offset: const Offset(1, 5),
                  blurRadius: 5,
                ),
                const BoxShadow(
                  color: Colors.white70,
                  offset: Offset(-1, -5),
                  blurRadius: 5,
                ),
              ],
            ),
            child: const Icon(Icons.shopping_cart),
          ),
          Container(
            height: 35,
            width: 35,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26.withOpacity(0.15),
                  offset: const Offset(1, 5),
                  blurRadius: 5,
                ),
                const BoxShadow(
                  color: Colors.white70,
                  offset: Offset(-1, -5),
                  blurRadius: 5,
                ),
              ],
            ),
            child: const Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //// ***** Menu Text ***** /////
            const Text(
              "MENU",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.normal,
              ),
            ),
            //// ***** Qoute ***** /////
            Text(
              "It's time to enjoy the finer things in life",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //// ***** LayoutBuilder + GridView ***** /////

            LayoutBuilder(
              builder: (context, constraints) {
                // Ekran kengligini tekshirib, kerakli ustunlar sonini aniqlaymiz
                int crossAxisCount = 2; // default (kichik ekranlar uchun)
                if (constraints.maxWidth > 600) {
                  crossAxisCount = 3; // katta ekranlar uchun
                }

                return GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: 0.7,
                  children: <Widget>[
                    for (int i = 0; i < items.length; i++) ...[
                      //// ***** Custom Widget Card  ***** /////
                      MenuItemCard(
                        data: items[i],
                        index: i,
                      ),
                    ],
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
