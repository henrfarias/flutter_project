import 'package:crud_flutter/interfaces/menu_item.dart';
import 'package:crud_flutter/interfaces/user.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final User user;

  MenuPage({required this.user, super.key});

  final List<MenuItem> menuItems = [
    MenuItem(name: 'Prato 1', price: 10.0, quantity: 2),
    MenuItem(name: 'Prato 2', price: 15.0, quantity: 3),
    MenuItem(name: 'Prato 3', price: 12.5, quantity: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Cardápio'),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final menuItem = menuItems[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 2,
            child: ListTile(
              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      menuItem.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'R\$ ${menuItem.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                'Sugerido para ${menuItem.quantity} pessoa${menuItem.quantity > 1 ? 's' : ''}.',
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
