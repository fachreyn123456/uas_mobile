// ProductInputPage.dart
import 'package:flutter/material.dart';

class ProductInputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Product Name',
                prefixIcon: Icon(Icons.shopping_cart),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Price',
                prefixIcon: Icon(Icons.attach_money),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic to handle product input (save to database, etc.)
                // For now, let's just navigate back to the DashboardPage
                Navigator.pop(context);
              },
              child: Text('Save Product'),
            ),
          ],
        ),
      ),
    );
  }
}
