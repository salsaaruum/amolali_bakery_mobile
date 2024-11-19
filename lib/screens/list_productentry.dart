import 'package:flutter/material.dart';
import 'package:amolali_bakery_mobile/models/product_entry.dart';
import 'package:amolali_bakery_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:amolali_bakery_mobile/screens/product_detail_page.dart';

class ProductEntryPage extends StatefulWidget {
  const ProductEntryPage({super.key});

  @override
  State<ProductEntryPage> createState() => _ProductEntryPageState();
}

class _ProductEntryPageState extends State<ProductEntryPage> {
  Future<List<Product>> fetchProduct(CookieRequest request) async {
    // Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    final response = await request.get('http://localhost:8000/json/');

    // Melakukan decode response menjadi bentuk json
    var data = response;

    // Melakukan konversi data json menjadi object ProductEntry
    List<Product> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(Product.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'Belum ada data produk pada amolali bakery.',
                style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        name: snapshot.data![index].fields.name,
                        price: snapshot.data![index].fields.price,
                        description: snapshot.data![index].fields.description,
                        category: snapshot.data![index].fields.category,
                        imageUrl: snapshot.data![index].fields.image,
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 4, // Tinggi bayangan
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Margin antar kotak
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Radius sudut
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0), // Jarak isi ke tepi kotak
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${snapshot.data![index].fields.name}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8), // Spasi antara nama dan deskripsi
                        Text(
                          "${snapshot.data![index].fields.description}",
                          style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Rp ${snapshot.data![index].fields.price}",
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.pink,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
