import 'package:flutter/material.dart';
import 'package:amolali_bakery_mobile/screens/menu.dart';
import 'package:amolali_bakery_mobile/screens/productentry_form.dart';
import 'package:amolali_bakery_mobile/screens/list_productentry.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            // Bagian drawer header
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: const Column(
                  children: [
                    Text(
                      '🍰 Amolali Bakery 🍰',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Text(
                      "Ayo isi perutmu dengan makanan enak!",
                      // Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
          ),
            // Bagian routing
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Halaman Utama'),
                // Bagian redirection ke MyHomePage
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Tambah Produk'),
                // Bagian redirection ke ProductEntryFormPage
                onTap: () {
                  Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEntryFormPage(),
                ),);
            },
          ),
          // Kode ListTile Menu
          ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Lihat Produk'),
              onTap: () {
                  // Route menu ke halaman product
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProductEntryPage()),
                  );
              },
          ),
        ],
      ),
    );
  }
}