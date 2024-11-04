# Tugas 7
## 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
Jawab :
**Definisi StatelessWidget** : adalah widget yang statis yang artinya tidak memiliki state yang bisa berubah. Begitu widget dirender, maka tampilannya tidak akan berubah selama aplikasi berjalan, kecuali jika dipicu oleh parent wiget yang merender ulang widget tersebut.
**Perbedaan** : StatelessWidget biasanya digunakan untuk tampilan yang tidak memerlukan pembaruan dinamis seperti teks, ikon, atau elemen-elemen statis lainnya yang tidak bergantung pada input pengguna atau perubahan data, tidak memiliki state yang dapat berubah, kinerjanya lebih ringan karena tidak memerlukan pengelolaan state

**Definisi StatefullWidget** : adalah widget yang dinamis yang dapat memiliki state yang bisa berubah selama aplikasi berjalan. StatefulWidget terdiri atas dua kelas, yaitu widget itu sendiri (StatefulWidget) dan objek state (State). objek ini yang menyimpan data yang dapat berubah dengan mengontrol tampilan widget.
**Perbedaan** : StatefulWidget biasanya digunakan ketika elemen tampilannya membutuhkan pembaruan dinamis berdasarkan input dari pengguna, pengatur waktu, atau perubahan data, memiliki state yang dapat berubah saat aplikasi berjalan, sedikit lebih berat karena harus mengelola objek state

## 2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
Jawab:
- **Widget MaterialApp** 
Fungsi : 
Ini adalah widget utama untuk aplikasi berbasis Material Design. MaterialApp menyediakan konfigurasi global seperti tema (ThemeData), judul aplikasi, dan home widget (tampilan pertama yang ditampilkan)

- **Widget Scaffold**
Fungsi :
Sbegaia struktur dasar dari halaman aplikasi yang mencakup berbagai elemen seperti AppBar, Body, FloatingActionButton, dll. Scaffol mempermudah penataan antarmuka pengguna

- **AppBar**
Fungsi :
Sebagai bar di bagian atas layar yang menampilkan judul halaman atau ikon navigasi. Contohnya di aplikasi ini adalah AppBarr menampilkan judul *e-commerce* "Amolali Bakery"

- ***Padding**
Fungsi :
Untuk menambahkan ruang di sekitar widget anaknya. Padding membantu mengatur jarak antara elemen, sehingga antarmuka lebih rapi

- **Column**
Fungsi :
Sebagai widget yang menyusun anak-anaknya secara vertikal. Column digunakan untuk menampilkan beberapa widget satu per satu dari atas ke bawah

- **Row**
Fungsi :
Sebagai wdiget yang menyusun anak-anaknya secara horizontal. Row mempermudah penataan elemen yang disusun berdampingan

- **Text**
Fungsi :
Untuk menampilkan teks pada layar. Dapat disesuaikan dengan berbagai gaya seperti warna, ukuran font, dan pengaturan lain

- **Card**
Fungsi :
Sebagai widget dengan efek bayangan yang membuat tampilan seperti sebuah kartu. Seringkali digunakan untuk mengelompokkan suatu informasi

- **Container**
Fungsi :
Sebagai widget dasar yang dapat digunakan untuk mengatur tata letak, ukuran, warna, dan dekorasi lainnya pada widget

- **GridView.count**
Fungsi :
Sebagai widget yang menampilkan widget anaknya dalam tata letak grid dengan jumlah kolom tetap. GridView.count memungkinkan pengaturan grid yang fleksibel dengan jumlah kolom tertentu

- **InkWell**
Fungsi :
Untuk menambahkan efek klik (ripple effect) pada widget. Digunakan untuk membuat area yang dapat diklik

- **SnackBar**
Fungsi :
sebagai widget yang muncul sementara di bagian bawah layar untuk memberikan notifikasi kepada pengguna. Pada aplikasi ini digunakan untuk menampilkan pesan saat pengguna mengklik tombol

- **Icon**
Fungsi :
Untuk menampilkan ikon sesuai dengan IconData yang diberikan ikon dapat diberi warna dan ukuran sesuai kebutuhan

- **MediaQuery**
Fungsi :
Digunakan untuk mendapatkan informasi tentang ukuran layar atau perangkat. MediaQuery digunakan di aplikasi untuk menyesuaikan lebar InfoCard sesuai ukuran layar

- **List**
Fungsi :
Tipe data untuk menyimpan daftar item yang digunakan sebagai data dinamis. Dalam proyek ini, List digunakan untuk menyimpan daftar item dari menu utama (Lihat produk, Tambah produk, Logout)

- **Material**
Fungsi :
Untuk memberikan efek material seperti bayangan di radius sudut untuk tampilan yang lebih menarik. Materila digunakan untuk pembungkus InkWell dalam ItemCard agar tampak menyatu dengan efek ripple

## 3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Jawab :
- **Fungsi setState()**
setState() adalah metode yang digunakan di dalam kelas State dari StatefulWidget untuk memperbarui tampilan atau antarmuka pengguna ketika suatu variabel atau data berubah. Fungsi ini memberi tahu flutter bahwa terdapat perubahan yang perlu di-render ulang di layar. Tanpa setState(), perubahan data tidak akan memicu pembaruan tampilan. 

- **Variabel yang terdampak**
1. Variable angka atau counter : Digunakan ketika perlu menghitung atau menampilkan angka yang berubah, seperti jumlah klik atau waktu.
2. Variabel boolean : Cocok untuk variabel status, seperti apakah tombol dinonaktifkan atau diaktifkan, atau apakah widget tertentu ditampilkan.
3. List atau koleksi data : Jika memiliki daftar yang diperbarui secara dinamis, seperti item keranjang belanja atau daftar tugas, gunakan setState() untuk merender ulang data terbaru.
4. Variabel string : Berguna untuk memperbarui teks secara dinamis, seperti pesan selamat datang yang berubah berdasarkan input pengguna.
5. Variabel yang berhubungan dengan UI : Seperti warna, ukuran, posisi elemen, dan sebagainya, yang akan membuat tampilan lebih dinamis.

## 4. Jelaskan perbedaan antara const dengan final.
**Definisi const** : *const* digunakan untuk membuat variabel yang bersifat konstanta waktu kompilasi (compile-time constant) yang artinya nilai variabel *const* harus sudah diketahui dan dapat ditentukan pada saat kompilasi (sebelum program dijalankan)
**Perbedaan** :
- Nilai variabel const tidak dapat diubah setelah ditetapkan. Nilai ditetapkan di waktu kompilasi
- Waktu inisialisasi harus diketahui saat kopilasi
- Penggunaannya untuk nilai yang pasti diketahui sejak awal
- Bersifat immutable dan hanya dapat berisi nilai-nilai yang juga immutable seperti angka, string, objek
- Instance bersifat global dan hanya satu instance di seluruh aplikasi

**Definisi final** : *final* digunakan untuk variabel yang nilainya hanya bisa ditetapkan sekali dan tidak dapat diubah setelah itu, namun nilainya bisa baru diketahui pada saat runtime (saat program dijalankan)
**Perbedaan** : 
- Nilai variabel final hanya dapat ditetapkan satu kali, tetapi tidak dapat diinisialisasi pada saat runtime
- Waktu inisialisasi dapat ditentukan saat runtime
- penggunaanya untuk nilai yang tidak berubah setelah diinisialisasi
- Bersifat immutable tetapi setiap deklarasi final menghasilkan instance terpisah
- Instance harus dibuat baru untuk tiap deklarasi
- Lebih fleksibel karena menyimpan nilai yang baru diketahui saat program berjalan

## 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
1. Membuat sebuah program flutter dengan tema tugas sebelumnya yaitu'Amolali Bakery'
- Donwload dan Install flutter 
- Menggunakan IDE pada VS Code yaitu dengan menginstall extension Dart dan Flutter 
- Buka terminal lalu ketik 'flutter create amolali_bakery_mobile'
- Ketik 'cd amolali_bakery_mobile'
- Jangan lupa untuk membuat folder lokal yang baru sehingga tidak tercampur dengan tugas sebelumnya dan membuat repository baru juga di github dengan nama 'amolali_bakery_mobile'
- Ketik 'flutter run' untuk menjalankan proyek
- Saat cek wireless devices pilih '3' untuk membuka proyek di 'chrome'
- Proyek flutter sudah bisa dilihat
- Buat file 'main.dart' dan 'menu.dart' untuk mengatur widget, isi, informasi, warna, ikon yang diinginkan di dalam proyek flutter

2. Membuat 3 tombol sederhana dengan ikon teks
- buat class baru 'ItemHomepage' untuk atribut card letakkan di file 'menu.dart'
...
class ItemHomepage {
     final String name;
     final IconData icon;

     ItemHomepage(this.name, this.icon);
}
...

- buat list of ItemHomepage yang berisi tombol pada class MyHomePage
class MyHomePage extends StatelessWidget {
...
  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Produk", Icons.shopping_cart),
    ItemHomepage("Tambah Produk", Icons.add),
    ItemHomepage("Logout", Icons.logout),
  ];
...
}

- buat class 'ItemCard' untuk menampilkan tombol-tombol dan menampilkan snackbar berisi pesan 'Kamu telah menekan tombol [nama button]
...
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
...

3. Mengimplementasikan warna-warna yang berbeda untuk setiap tombol
- Buat widget GridView.count di dalam widget Column
- Untuk setiap ItemCard, tetapkan warna berbeda dengan mengubah parameter color
...
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
...
- ItemCard(items[0], color: Colors.pink.shade400), //Tombol Lihat Produk (warna berbeda untuk Tombol Lihat Produk)
- ItemCard(items[1], color: Colors.pink.shade700), // Tombol Tambah Produk (warna berbeda untuk Tombol Tambah Produk)
- ItemCard(items[2], color: Colors.pink.shade900), // Tombol Logout (warna berbeda untuk Tombol Logout)

4. Memunculkan snackbar saat menekan tombol
- Gunakan widget InkWell di dalam ItemCard, saat pengguna menekan salah satu tombol, InkWell akan menjalankan fungsi onTap, yang menampilkan SnackBar menggunakan ScaffoldMessenger
...
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



# amolali_bakery_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
