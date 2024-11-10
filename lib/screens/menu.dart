import 'package:flutter/material.dart';
// Impor drawer widget
import 'package:amolali_bakery_mobile/widgets/left_drawer.dart';
import 'package:amolali_bakery_mobile/widgets/product_card.dart';
//import 'package:amolali_bakery_mobile/productentry_form.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String npm = '2306245560'; // NPM
  final String name = 'Salsabila Arumdapta'; // Nama
  final String className = 'PBP A'; // Kelas

  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Produk", Icons.shopping_cart),
    ItemHomepage("Tambah Produk", Icons.add),
    ItemHomepage("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '🍰 Amolali Bakery 🍰',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        // Mengganti warna icon drawer menjadi putih
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      '🍰 Welcome to Amolali Bakery 🍰',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: [
                      ItemCard(items[0], color: Colors.pink.shade400), // Tombol Lihat Produk
                      ItemCard(items[1], color: Colors.pink.shade700), // Tombol Tambah Produk
                      ItemCard(items[2], color: Colors.pink.shade900), // Tombol Logout
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  // Kartu informasi yang menampilkan title dan content.
  
  final String title;  // Judul kartu.
  final String content;  // Isi kartu.

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Membuat kotak kartu dengan bayangan dibawahnya.
      elevation: 2.0,
      child: Container(
        // Mengatur ukuran dan jarak di dalam kartu.
        width: MediaQuery.of(context).size.width / 3.5, // menyesuaikan dengan lebar device yang digunakan.
        padding: const EdgeInsets.all(16.0),
        // Menyusun title dan content secara vertikal.
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

// class ItemHomepage {
//      final String name;
//      final IconData icon;

//      ItemHomepage(this.name, this.icon);
// }

// class ItemCard extends StatelessWidget {
//   final ItemHomepage item;
//   final Color color; // Add color parameter

//   const ItemCard(this.item, {super.key, required this.color}); // Make color required

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: color, // Use the passed color for the background
//       borderRadius: BorderRadius.circular(12),
//       child: InkWell(
//         onTap: () {
//           ScaffoldMessenger.of(context)
//             ..hideCurrentSnackBar()
//             ..showSnackBar(
//               SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
//             );
          
//           // Navigate ke route yang sesuai (tergantung jenis tombol)
//           if (item.name == "Tambah Produk") {
//             // Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup MoodEntryFormPage.
//             // Navigasi ke halaman MoodEntryFormPage
//              Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => const ProductEntryFormPage()),
//              );
//           }
//         },
//         child: Container(
//           padding: const EdgeInsets.all(8),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   item.icon,
//                   color: Colors.white,
//                   size: 30.0,
//                 ),
//                 const Padding(padding: EdgeInsets.all(3)),
//                 Text(
//                   item.name,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

