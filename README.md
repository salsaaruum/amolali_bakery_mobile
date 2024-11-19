# Tugas 9
## 1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
Jawab: 
**Mengapa perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON?** 
- Untuk memastikan struktur data yang konsisten :
  - Model mendefinisika atribut dan tipe data yang spesifik sehingga semua data yang dikirim atau diterima mengikuti format yang sama
  - Seperti contohnya mengirim data Product, model memastikan data memiliki atribut name, price, description dengan tipenya misalkan string atau int.
- Untuk validasi data :
  - Model dapat melakukan validasi terhadap input, seperti memastikan bahwa price adalah angka positif atau name tidak kosong. Hal ini mencegah data tidak valid masuk ke sistem.
- Untuk integrasi dengan basis data (database) :
  - Dalam Django, model biasanya terhubung ke tabel database, memungkinkan data JSON untuk diolah atau disimpan secara langsung tanpa proses manual tambahan
- Untuk kemudahan serialisasi dan deserialisasi :
  - Model mendukung proses konversi data ke dan dari JSON melalui serialisasi, sehingga mempermudah komunikasi dengan API.
- Untuk Scalability dan maintenance :
  - Dengan menggunakan model, kode menjadi lebih modular dan mudah di-maintain saat aplikasi berkembang atau data berubah.

**Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?**
- Kesulitan validasi data :
  - Tanpa model, kita perlu memvalidasi struktur dan tipe data JSON secara manual, yang rawan error dan memakan waktu.
- Inkonsistensi data :
  - Data yang tidak memiliki struktur terdefinisi dapat menyebabkan masalah di kemudian hari, seperti data hilang, tidak terformat, atau salah tipe.
- Kehilangan integrasi dengan database :
  - Tanpa model, data JSON tidak dapat langsung disimpan atau diambil dari database tanpa kode tambahan untuk menangani struktur data.
- Potensi error lainnya :
  - Jika data JSON tidak sesuai dengan format yang diharapkan (misalnya, atribut hilang), API Anda mungkin menghasilkan error saat mencoba membaca atau memproses data tersebut.
  - Kode tidak efisien sehingga kita harus menulis ulang logika parsing tiap kali data JSON berubah
  - Kesulitan debugging dan mengharuskan kita memeriksa data JSON secara manual setiap saat, yang mempersulit proses debugging

## 2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Jawab:
- **Melakukan permintaan http**:
  - Library http di Android, seperti http atau http-client, digunakan untuk mengirimkan permintaan HTTP (GET, POST, PUT, DELETE, dll.) ke server yang menyediakan data atau layanan.
  - Misalnya, ketika kita ingin mengambil data JSON dari API, kita menggunakan metode GET untuk mengirim permintaan dan menerima respons dari server.
- **Mengelola respons dari server**:
  - Setelah mengirimkan permintaan, library http akan menangani respons dari server, mengonversinya menjadi format yang bisa digunakan oleh aplikasi misalnya JSON
  - Library ini biasanya menyediakan cara untuk membaca status kode respons HTTP, seperti 200 OK untuk sukses atau 404 Not Found jika resource tidak ditemukan.
- **Menyederhanakan pengelolaan jaringan**:
  - Library http menyederhanakan proses pembuatan dan pengelolaan permintaan HTTP dengan menyediakan antarmuka yang lebih mudah digunakan daripada menulis kode jaringan mentah.
  - Ini juga menangani pengelolaan koneksi dan pengaturan waktu tunggu (timeout) untuk permintaan yang lebih efisien.
- **Mengelola data JSON**:
  - Library ini sangat berguna untuk mengakses API yang mengirimkan data dalam format JSON. Anda dapat menggunakan library http untuk mengirimkan data ke server (misalnya, dalam format JSON) atau menerima data JSON dari server.

## 3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
Jawab:
**Jelaskan fungsi dari CookieRequest**:
- Menyimpan dan mengelola cookie otomotasi :
  - Saat aplikasi melakukan permintaan ke server yang mengharuskan autentikasi, server biasanya mengirimkan cookie dalam respons. CookieRequest menyimpan cookie ini untuk digunakan dalam permintaan selanjutnya.
  - Mempermudah aplikasi dalam mempertahankan sesi pengguna tanpa harus mengelola cookie secara manual.
- Mengirim cookies secara otomatis :
  - CookieRequest akan menyertakan cookie yang disimpan dalam setiap permintaan ke server yang sama. Hal ini memastikan bahwa server mengenali sesi pengguna dan tidak meminta login ulang.
- Mendukung operasi otentikasi :
  - Dalam aplikasi berbasis API, seperti yang menggunakan Django dengan autentikasi berbasis sesi, CookieRequest membantu mengelola login pengguna dengan cara: 
    - Menyimpan cookie sesi setelah pengguna berhasil login.
    - Menggunakan cookie ini untuk memverifikasi pengguna dalam permintaan berikutnya, seperti mengambil data profil atau melakukan operasi lain yang membutuhkan autentikasi.
- Keamanan dan kontrol sesi :
  - CookieRequest memastikan bahwa sesi pengguna aman dengan menyimpan cookie secara lokal dan hanya menggunakannya dalam koneksi yang diizinkan.

**Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter**
- Konsistensi sesi :
  - Aplikasi Flutter biasanya terdiri dari beberapa halaman atau modul. Jika instance CookieRequest tidak dibagikan secara global, setiap halaman atau modul akan memiliki instance terpisah, yang berarti data cookie tidak akan konsisten.
  - Dengan membagikan satu instance, semua komponen aplikasi menggunakan cookie yang sama untuk mengakses data sesi pengguna.
- Efisiensi dan reusability :
  - Membuat banyak instance CookieRequest dapat menyebabkan pengelolaan cookie yang tidak efisien. Instance tunggal memastikan bahwa cookie hanya disimpan dan dikelola sekali, mengurangi overhead.
- Kemudahan implementasi :
  - Dengan instance yang dibagikan, proses autentikasi, validasi, dan pengambilan data menjadi lebih sederhana. Komponen aplikasi dapat langsung menggunakan instance yang sudah ada tanpa harus mengatur ulang atau menyinkronkan cookie.
- Mendukung navigasi antar halaman :
  - Dalam aplikasi dengan banyak halaman, seperti dashboard, profil, dan pengaturan, setiap halaman sering membutuhkan data sesi yang sama. Instance tunggal memastikan bahwa sesi tetap aktif dan dapat diakses oleh semua halaman.

## 4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Jawab:
- **Input data di productentry_form.dart**:
  - User mengisi input: seperti name, price, description, category, dan imageUrl dimasukkan oleh pengguna melalui form yang disediakan oleh widget TextFormField
  - Validasi data: seperti name tidak boleh kosong, atau price harus berupa angka. Setiap field memiliki validator untuk memastikan data yang dimasukkan valid
  - Mengirim data ke server: 
    - Setelah semua field valid, data yang diinputkan dikirim ke server menggunakan metode postJson dari CookieRequest.
    - URL tujuan adalah http://localhost:8000/create-flutter/, yang merupakan endpoint Django untuk menangani data baru.
    - Data dikirim dalam format JSON.
- **Penyimpanan data di server django**:
  - Endpoint Django menerima data: Data yang dikirim dari Flutter diterima oleh endpoint Django create-flutter/.
  - Validasi data di Django: Django memeriksa apakah data yang dikirim lengkap dan sesuai dengan model.
  - Penyimpanan di database: Jika data valid, Django menyimpan data ke dalam database menggunakan model produk Anda. 
- **Pengambilan data dari server ke flutter di file list_productentry.dart**:
  - Flutter meminta data: Widget FutureBuilder memanggil fungsi fetchProduct, yang menggunakan metode request.get dari CookieRequest untuk mengambil data dari endpoint Django di http://localhost:8000/json/
  - Django mengirimkan data: Endpoint Django json/ mengembalikan daftar data produk dalam format JSON yang sudah disimpan di database.
  - Parsing data di Flutter: Data JSON yang diterima oleh Flutter diubah menjadi daftar objek Product menggunakan metode fromJson.
- **Menampilkan data di flutter di file list_productentry.dart**:
  - Menunggu data: Widget FutureBuilder menunggu data dari fetchProduct. Jika data belum tersedia, Flutter menampilkan indikator CircularProgressIndicator.
  - Menampilkan daftar produk: Setelah data tersedia, Flutter membuat widget untuk setiap produk menggunakan ListView.builder.
  - Data seperti nama, harga, deskripsi, kategori, dan URL gambar ditampilkan dalam widget berbasis teks.

## 5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Jawab: 
- Login : auth/login di views.py
  - Permintaan POST diterima: Backend menerima username dan password dari Flutter. Fungsi authenticate() mengecek apakah kombinasi username-password valid.
  - Jika valid: Fungsi auth_login() digunakan untuk menyimpan sesi login pengguna. JSON Response dikirim dengan: username, status, message
  - Jika tidak valid: Response JSON dengan status False dan pesan error.
  - Saat tombol 'Login' ditekan pada flutter: 
    - Flutter mengirim username dan password ke endpoint /auth/login/ menggunakan CookieRequest.login(). 
    - Jika login berhasil (request.loggedIn bernilai true): Flutter menampilkan pesan sukses menggunakan SnackBar. Navigasi ke halaman utama dengan Navigator.pushReplacement.
    - Jika gagal: Pesan error ditampilkan dalam dialog menggunakan AlertDialog.

- Register : auth/register di views.py
  - Permintaan POST diterima: Backend menerima data username, password1, dan password2 dari Flutter. Validasi dilakukan:
    - Jika validasi lolos: Pengguna baru dibuat dengan User.objects.create_user() dan disimpan. JSON Response dikirim dengan username, status, message: pesan "User created successfully!".
    - Jika gagal: Response JSON dikirim dengan status False dan pesan error.
  - Saat tombol 'Register' ditekan pada flutter: 
    - Flutter mengirim data username dan password ke endpoint /auth/register/ menggunakan request.postJson().
    - Jika pendaftaran berhasil: Pesan sukses ditampilkan menggunakan SnackBar. Navigasi kembali ke halaman login menggunakan Navigator.pushReplacement.
    - Jika gagal: Pesan error ditampilkan menggunakan SnackBar.

- Logout : auth/logout di views.py
  - Saat permintaan diterima: Backend memanggil fungsi auth_logout() untuk menghapus sesi pengguna. JSON Response dikirim dengan username,  status, message: pesan "Logout berhasil".
  - Saat logout ditekan di flutter (dari halaman utama): 
    - Flutter mengirim permintaan ke endpoint /auth/logout/. Jika logout berhasil: Navigasi kembali ke halaman login.

## 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
Jawab:
- **Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik**: Flutter sudah bisa menampilkan data-data suatu akun yang dilakukan login
- **Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter**:
  1. Modifikasi file views.py pada direkrtori authentication/views.py:
    from django.contrib.auth.models import User
    import json

    ...

    @csrf_exempt
    def register(request):
        if request.method == 'POST':
            data = json.loads(request.body)
            username = data['username']
            password1 = data['password1']
            password2 = data['password2']

            # Check if the passwords match
            if password1 != password2:
                return JsonResponse({
                    "status": False,
                    "message": "Passwords do not match."
                }, status=400)
            
            # Check if the username is already taken
            if User.objects.filter(username=username).exists():
                return JsonResponse({
                    "status": False,
                    "message": "Username already exists."
                }, status=400)
            
            # Create the new user
            user = User.objects.create_user(username=username, password=password1)
            user.save()
            
            return JsonResponse({
                "username": user.username,
                "status": 'success',
                "message": "User created successfully!"
            }, status=200)
        
        else:
            return JsonResponse({
                "status": False,
                "message": "Invalid request method."
            }, status=400)
  2. Tambahkan path baru pada authentication/urls.py :
    from authentication.views import login, register  # Tambahkan register di baris ini
    ...
    path('register/', register, name='register'),
  3. Pada proyek Flutter buatlah folder screens dan buat file baru bernama register.dart:
    import 'dart:convert';
    import 'package:flutter/material.dart';
    import 'package:mental_health_tracker/screens/login.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    class RegisterPage extends StatefulWidget {
      const RegisterPage({super.key});

      @override
      State<RegisterPage> createState() => _RegisterPageState();
    }

    class _RegisterPageState extends State<RegisterPage> {
      final _usernameController = TextEditingController();
      final _passwordController = TextEditingController();
      final _confirmPasswordController = TextEditingController();

      @override
      Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
          appBar: AppBar(
            title: const Text('Register'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          hintText: 'Enter your username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12.0),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12.0),
                      TextFormField(
                        controller: _confirmPasswordController,
                        decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          hintText: 'Confirm your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24.0),
                      ElevatedButton(
                        onPressed: () async {
                          String username = _usernameController.text;
                          String password1 = _passwordController.text;
                          String password2 = _confirmPasswordController.text;

                          // Cek kredensial
                          // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                          // Untuk menyambungkan Android emulator dengan Django pada localhost,
                          // gunakan URL http://10.0.2.2/
                          final response = await request.postJson(
                              "http://[APP_URL_KAMU]/auth/register/",
                              jsonEncode({
                                "username": username,
                                "password1": password1,
                                "password2": password2,
                              }));
                          if (context.mounted) {
                            if (response['status'] == 'success') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Successfully registered!'),
                                ),
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Failed to register!'),
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        child: const Text('Register'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }
  4. Jangan lupa,tambahkan path('auth/', include('authentication.urls')), pada file mental_health_tracker/urls.py.

- **Membuat halaman login pada proyek tugas Flutter**:
  1. Buatlah sebuah metode view untuk login pada authentication/views.py:
    from django.contrib.auth import authenticate, login as auth_login
    from django.http import JsonResponse
    from django.views.decorators.csrf import csrf_exempt

    @csrf_exempt
    def login(request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                auth_login(request, user)
                # Status login sukses.
                return JsonResponse({
                    "username": user.username,
                    "status": True,
                    "message": "Login sukses!"
                    # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
                }, status=200)
            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login gagal, akun dinonaktifkan."
                }, status=401)

        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, periksa kembali email atau kata sandi."
            }, status=401)
  2. Buat file urls.py pada folder authentication dan tambahkan URL routing terhadap fungsi yang sudah dibuat dengan endpoint login/:
    from django.urls import path
    from authentication.views import login

    app_name = 'authentication'

    urlpatterns = [
        path('login/', login, name='login'),
    ]

- **Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter**:
  1. Install package yang sudah disediakan tim asdos dengan mengetik pada terminal:
    flutter pub add provider
    flutter pub add pbp_django_auth
  2. Gunakan package untuk menyediakan CookieRequest library ke semua child widgets menggunakan Provider. Ubahlah pada file main.dart:
    import 'package:flutter/material.dart';
    import'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';
    import 'package:amolali_bakery_mobile/screens/login.dart';

    void main() {
      runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
      const MyApp({super.key});

      @override
      Widget build(BuildContext context) {
        return Provider(
          create: (_) {
            CookieRequest request = CookieRequest();
            return request;
          },
          child: MaterialApp(
            title: 'Amolali Bakery',
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.pink,
              ).copyWith(secondary: Colors.pink[50]),
            ),
            home: const LoginPage(),
          ),
        );
      }
    }

- **Membuat model kustom sesuai dengan proyek aplikasi Django**:
  1. Bukalah endpoint JSON yang sudah kamu buat sebelumnya pada tutorial 2.
  2. Salinlah data JSON dan buka situs web Quicktype.
  3. Pada situs web Quicktype, ubahlah setup name menjadi MoodEntry, source type menjadi JSON, dan language menjadi Dart.
  4. Tempel data JSON yang telah disalin sebelumnya ke dalam textbox yang tersedia pada Quicktype.
  5. Klik pilihan Copy Code pada Quicktype. Buat folder baru di lib/models/product_entry.dart :
    // To parse this JSON data, do
    //
    //     final product = productFromJson(jsonString);

    import 'dart:convert';

    List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

    String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

    class Product {
        String model;
        String pk;
        Fields fields;

        Product({
            required this.model,
            required this.pk,
            required this.fields,
        });

        factory Product.fromJson(Map<String, dynamic> json) => Product(
            model: json["model"],
            pk: json["pk"],
            fields: Fields.fromJson(json["fields"]),
        );

        Map<String, dynamic> toJson() => {
            "model": model,
            "pk": pk,
            "fields": fields.toJson(),
        };
    }

    class Fields {
        int user;
        String name;
        int price;
        String description;
        String category;
        String image;

        Fields({
            required this.user,
            required this.name,
            required this.price,
            required this.description,
            required this.category,
            required this.image,
        });

        factory Fields.fromJson(Map<String, dynamic> json) => Fields(
            user: json["user"],
            name: json["name"],
            price: json["price"],
            description: json["description"],
            category: json["category"],
            image: json["image"],
        );

        Map<String, dynamic> toJson() => {
            "user": user,
            "name": name,
            "price": price,
            "description": description,
            "category": category,
            "image": image,
        };
    }

- **Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy. Tampilkan name, price, dan description dari masing-masing item pada halaman ini**:
  1. Buatlah berkas baru pada direktori lib/screens dengan nama list_productentry.dart.
  2. Pada berkas list_productentry.dart, impor library yang dibutuhkan. Ubahlah [APP_NAME] sesuai dengan nama proyek Flutter yang dibuat:
    import 'package:flutter/material.dart';
    import 'package:amolali_bakery_mobile/models/product_entry.dart';
    ...
  3. Salinlah potongan kode berikut dan paste pada list_productentry.dart:
    import 'package:flutter/material.dart';
    import 'package:amolali_bakery_mobile/models/product_entry.dart';
    import 'package:amolali_bakery_mobile/widgets/left_drawer.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

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
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        'Belum ada data product pada amolali bakery.',
                        style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${snapshot.data![index].fields.name}",
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text("${snapshot.data![index].fields.price}"),
                          const SizedBox(height: 10),
                          Text("${snapshot.data![index].fields.description}"),
                          const SizedBox(height: 10),
                          Text("${snapshot.data![index].fields.category}"),
                          const SizedBox(height: 10),
                          // Tampilkan gambar dari URL menggunakan Image.network
                          snapshot.data![index].fields.image.isNotEmpty
                              ? Image.network(
                                  snapshot.data![index].fields.image,
                                  height: 150, // Sesuaikan tinggi gambar
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                )
                              : const Text(
                                  "No image available",
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                        ],
                      ),
                    ),
                  );
                }
              }
            },
          ),
        );
      }
    }

- **Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item**. 
  - **Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item**:
    1. Buat file baru bernama product_detail_page.dart
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
    2. Jangan lupa untuk import halaman di list_productentry.dart yang menuju ke halaman baru ketika memencet tombol (melalui nama makanan) dan melihat detail
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
  
  - **Tampilkan seluruh atribut pada model item kamu pada halaman ini**:  
    1. Kode untuk menampilkan atribut detail item:
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

  - **Tambahkan tombol untuk kembali ke halaman daftar item**:
    1. Kode untuk kembali ke halaman daftar item:
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
                  }
                )
        )

- **Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login**:
  1. Gunakan request.user contohnya pada list_productentry.dart:
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
    }
  2. Gunakan ForeignKey pada model user
  3. Pastikan views.py dan urls.py saling terintegrasi supaya tidak ada error




# Tugas 8
## 1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
Jawab :
- **Apa kegunaan const di Flutter?** : const digunakan untuk mendefinisikan objek atau widget sebagai objek yang bersifat immutable (tidak dapat diubah) dan diinisialisasi saat kompilasi (compile time constant), seingga bisa hemat dalam memori dan tidak perlu dibuat ulang setiap kali widget dirender ulang
- **Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter** : 
keuntungan menggunakan const antara lain:
  - **Efisiensi memori** : Objek yang bersifat const hanya dibuat satu kali di memori, sehingga tidak perlu dialokasikan ulang setiap kali digunakan
  - **Peningkatakn performa** : Flutter menghindari pembuatan ulang objek konstan, yang mempercepat rendering UI
  - **Optimisasi di compile time** : Karena nilai const dihitung saat compile time, Flutter bisa melakukan optimisasi lebih lanjut di awal dan mengurangi pekerjaan di runtime
  - **Membuat kode lebih stabil** : Dengan mengunakan const, kita bisa memastikan bahwa nilai-nilai tersebut tidak akan berubah secara tidak terduga di runtime, sehingga lebih mudah melacak dan mengelola state aplikasi
- **Kapan sebaiknya kita menggunakan const**:
  - **Widget yang tidak berubah** : Gunakan const pada widget yang sifatnya **statis** dan tidak bergantung pada nilai dinamis atau state aplikasi. Contohnya : Icon(Icons.add)
  - **Konstanta global** : Jika memiliki nilai konstan yang akan digunakan berulang kali di berbagai aplikasi, seperti warna atau ukuran tertentu, deklarasikan nilai dengan const
  - **List atau Map tidak berubah** : Jika menggunakan List atau Map yang nilai di dalamnya tidak akan berubah, deklarasikan sebagai const untuk menghemat alokasi memori
- **Kapan sebaiknya tidak digunakan** :
  - **Nilai dinamis** : Jika nilai atau widget bergantung pada data yang berubah selama runtime (misal, dari API atau input pengguna), maka tidak perlu menggunakan const
  - **Objek yang bergantung pada state** : Misal, jika sebuah widget perlu memperbarui tampilannya berdasarkan perubahan state, maka tidak seharusnya menggunakan const

## 2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
Jawab :
**Deskripsi Column**: Column digunakan untuk menata widget-widget anak dalam arah vertikal (dari atas ke bawah). Properti yang biasa digunakan seperti mainAxisAlignment, crossAxisAlignment, dan children.
**Perbedaan Column**:
  - Arah layout nya vertikal (atas ke bawah)
  - Sumbu utamanya vertikal dan sumbu sekundernya horizontal
  - Kegunaannya untuk menampikan item berurutan kebawah
  - mainAxisAlignment digunakan untuk mengatur distribusi vertikal dan mainAxisAlignment digunakan untuk mengatur alignment horizontal
**Contoh Implementasi di tugas**: widget column digunakan dalam LeftDrawer untuk menampilkan teks secara vertikal 

DrawerHeader(
  decoration: BoxDecoration(
    color: Theme.of(context).colorScheme.primary,
  ),
  child: Column(
    children: const [
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
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      ),
    ],
  ),
)

**Deskripsi Row**: Row digunakan untuk menata widget-widget anak dalam arah horizontal (dari kiri ke kanan). Properti yang biasa digunakan seperti mainAxisAlignment, crossAxisAlignment, dan children.
**Perbedaan Row**:
  - Arah layout nya horizontal (kiri ke kanan)
  - Sumbu utamanya horizontal dan sumbu sekundernya vertikal
  - Kegunaannya untuk menampikan item berurutan kesamping
  - mainAxisAlignment digunakan untuk mengatur distribusi horizontal dan mainAxisAlignment digunakan untuk mengatur alignment vertikal
**Contoh Implementasi di tugas**: Row digunakan di product_card.dart untuk menampilkan ikon dan teks secara horizontal 

class ItemCard extends StatelessWidget {
  final ItemHomepage item;
  final Color color;

  const ItemCard(this.item, {super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );

          if (item.name == "Tambah Produk") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductEntryFormPage()),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const SizedBox(width: 8), // Memberi jarak antara ikon dan teks
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

## 3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Jawab :
- **Elemen input yang digunakan** : 
  - **TextFormField** : 
    - Digunakan untuk input teks pada form : nama produk (product), harga *(price), deskripsi (description), kategori (category), dan link url gambar makanan (imgUrl)
    - Setiap TextFormField memiliki properti decoration untuk menambahkan hint, label, border, dan validator untuk validasi input
    - Pada variabel harga (price) terdapat pengecekan tambahan agar input berupa angka menggunakan int.tryParse
  - **ElevatedButton** :
    - Digunakan untuk tombol "Save" dibagian bawah form yang akan memvalidasi input pengguna saat ditekan
    - Jika semua input nya valid, maka tombol ini akan menampilkan dialg konfirmasi menggunakan AlertDialog

- **Elemen input yang tidak digunakan** :
  - **DropdownButtonFormField** : Cocok digunakan untuk pilihan kategori yang terbatas. Elemen ini memungkinkan pengguna memilih dari daftar opsi tanpa mengetik
  - **Checkbox** atau **Switch** : Berguna untuk opsi biner, seperti memindai produk sebagai "available" atau tidak yang tidak ada di form
  - **Radio** : Cocok untuk input dengan beberapa pilihan eksklusif, misalnya, untuk tipe produk yang hanya memiliki satu pilihan di antara beberapa opsi
  - **Slider** : Berguna untuk input nilai dalam rentang tertentu, seperti harga produk jika perlu diatur dalam rentang tertentu
  -**DatePicker** : Digunakan jika form memerlukan input tanggal, misalnya tanggal kadaluarsa produk

## 4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Jawab : 
- Untuk mengatur dan menetapkan tema pada aplikasi Flutter, agar konsisten, kita bisa gunakan **"ThemeData"**. Ini memungkinkan kita untuk menentukan gaya umum untuk seluruh isi aplikasi, seperti warna, teks, ikon. Implementasi tema ini dilakukan di dalam **"MateriaApp"** sehingga setiap widget dalam aplikasi mengikuti tema yang ditentukan

- **cara implementasinya** :
  - Membuat tema global dengan ThemeData : kita bisa menentukan tema utama di MaterialApp pada parameter theme. Disini ThemeData digunakan untuk menentukan warna utama (primarySwatch) dan warna latar (backgroundColor), font, dan gaya teks
  import 'package:flutter/material.dart';
  import 'package:amolali_bakery_mobile/screens/menu.dart';

  void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a pink toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
          ).copyWith(
            secondary: Colors.pink[50]),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      );
    }
  }
  - Menggunakan tema pada widget : Dengan menggunakan **"Theme.of(context)"**, kita bisa mengakses dan menerapkan gaya dari ThemeData yang telah ditentukan. contoh, 
  DrawerHeader(
            // Bagian drawer header
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: const Column(
                  children: []))

- **Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?** : Ya, dengan mengimplementasikan Theme.of(context) pada bagian yang ingin dijadikan konsisten mengikuti tema utama tanpa perlu mendefinisikan individual lagi di tiap widget

## 5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Jawab :
- **Navigasi dengan Navigator.push**:
  - Ketika pengguna mengetuk tombol atau item di aplikasi, seperti tombol "Tambah Produk" di ItemCard, navigasi dilakukan menggunakan **Navigator.push**
  - **Navigator.push** menambahkan halaman baru ke tumpukan halaman dan menampilkan halaman tersebut tanpa mengganti halaman sebelumnya. Di tugas kali ini, **Navigator.push** digunakan untuk membuka halaman **ProductEntryFormPage**
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ProductEntryFormPage()),
  );
  - Ketika halaman baru ditambahkan ke tumpukan, pengguna dapat menekan tombol kembali untuk kembali ke halaman sebelumnya.

- **Navigasi dengan Navigator.pushReplacement**:
  - Di dalam left_drawet.dart, ketika pengguna mengetuk "Halaman Utama", kode di tugas ini menggunakan **Navigator.pushReplacement** untuk mengganti halaman saat ini dengan halaman MyHomePage
  - **Navigator.pushReplacement** mengapus halaman saat ini dari tumpukan navigasi sebelum menambahkan halaman baru, sehingga ketika halaman baru dimuat maka pengguna tidak dapat kembali ke halaman sebelumnya dengan tombol kembali
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => MyHomePage(),
    ),
  );


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
