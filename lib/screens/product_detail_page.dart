import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String name;
  final int price;
  final String description;
  final String category;
  final String imageUrl;

  const ProductDetailPage({
    super.key,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Price: $price',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16),
            Text(
              'Description: $description',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16),
            Text(
              'Category: $category',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16),
            Image.network(
              imageUrl,
              errorBuilder: (context, error, stackTrace) {
                return const Text("Gambar tidak dapat dimuat.");
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
