import 'package:flutter/material.dart';
import 'package:amolali_bakery_mobile/screens/productentry_form.dart';
class ItemHomepage {
     final String name;
     final IconData icon;

     ItemHomepage(this.name, this.icon);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;
  final Color color; // Add color parameter

  const ItemCard(this.item, {super.key, required this.color}); // Make color required

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color, // Use the passed color for the background
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
          
          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Tambah Produk") {
            // Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup MoodEntryFormPage.
            // Navigasi ke halaman MoodEntryFormPage
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => const ProductEntryFormPage()),
             );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

