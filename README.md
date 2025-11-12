# football_shop

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Jawaban Pertanyaan Flutter

### 1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

Widget tree adalah struktur hierarki yang mewakili semua widget dalam aplikasi Flutter. Setiap widget dapat memiliki satu atau lebih widget anak (child), dan hubungan parent-child bekerja dengan cara widget induk (parent) yang berisi dan mengatur widget anaknya. Data dan konfigurasi mengalir dari parent ke child melalui konstruktor widget, dan widget child dapat mengakses konteks dari parent-nya. Struktur ini memungkinkan Flutter untuk membangun UI secara efisien dengan cara yang deklaratif.

### 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

- **MaterialApp**: Widget root yang menyediakan konfigurasi aplikasi Material Design, termasuk tema, navigasi, dan routing.
- **Scaffold**: Menyediakan struktur dasar layout Material Design, termasuk AppBar, body, dan floating action button.
- **AppBar**: Bilah aplikasi di bagian atas layar yang menampilkan judul dan kontrol navigasi.
- **Center**: Widget yang memusatkan child-nya di dalam parent container.
- **Column**: Mengatur child widget secara vertikal dalam satu kolom.
- **ElevatedButton**: Tombol yang terangkat dengan efek bayangan, digunakan untuk interaksi pengguna.
- **Icon**: Menampilkan ikon dari set ikon Material Design.
- **SizedBox**: Widget yang menyediakan ruang kosong dengan ukuran tertentu, digunakan untuk spacing.
- **Text**: Menampilkan teks dengan gaya tertentu.
- **SnackBar**: Pesan singkat yang muncul di bagian bawah layar untuk memberikan feedback kepada pengguna.
- **ScaffoldMessenger**: Mengelola tampilan SnackBar dalam konteks Scaffold.

### 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

MaterialApp adalah widget yang menyediakan konfigurasi dasar untuk aplikasi Flutter yang menggunakan desain Material. Fungsinya meliputi pengaturan tema aplikasi, navigasi antar halaman, dan penyediaan widget seperti Navigator untuk routing. Widget ini sering digunakan sebagai root karena menyediakan konfigurasi global yang diperlukan untuk aplikasi Material Design, seperti tema warna, font, dan perilaku navigasi, sehingga memudahkan pengembangan aplikasi yang konsisten.

### 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

StatelessWidget adalah widget yang tidak memiliki state internal dan tidak dapat berubah setelah dibuat. Mereka immutable dan cocok untuk widget yang tampilannya hanya bergantung pada konfigurasi yang diberikan melalui konstruktor. StatefulWidget memiliki state internal yang dapat berubah selama masa hidup widget, dan mereka dapat memperbarui UI ketika state berubah dengan memanggil setState(). Kita memilih StatelessWidget ketika widget tidak perlu menyimpan state atau merespons perubahan data, seperti widget statis atau yang hanya menampilkan data. Kita memilih StatefulWidget ketika widget perlu merespons interaksi pengguna, mengelola data yang berubah, atau memperbarui tampilan berdasarkan state, seperti counter atau form input.

### 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

BuildContext adalah objek yang menyediakan informasi tentang lokasi widget dalam widget tree dan memberikan akses ke berbagai layanan seperti tema, media query, dan navigator. BuildContext penting karena memungkinkan widget untuk berinteraksi dengan framework Flutter, seperti mengakses data dari ancestor atau melakukan navigasi. Di metode build, BuildContext digunakan sebagai parameter untuk membangun widget dan memberikan konteks yang diperlukan untuk operasi seperti Theme.of(context) atau MediaQuery.of(context).

### 6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Hot reload adalah fitur Flutter yang memungkinkan pengembang untuk memperbarui kode aplikasi secara instan tanpa menghentikan eksekusi aplikasi. Perubahan kode diterapkan langsung ke aplikasi yang sedang berjalan, mempertahankan state aplikasi dan navigasi saat ini. Hot restart, di sisi lain, menghentikan aplikasi sepenuhnya dan memulai ulang dari awal, yang mengatur ulang semua state aplikasi. Hot reload lebih cepat dan berguna untuk perubahan UI kecil, sedangkan hot restart diperlukan untuk perubahan struktural seperti modifikasi main() atau perubahan yang mempengaruhi inisialisasi aplikasi.

## Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements

### Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

Navigator.push() menambahkan halaman baru ke stack navigasi, sehingga pengguna dapat kembali ke halaman sebelumnya dengan tombol back. Navigator.pushReplacement() menggantikan halaman saat ini dengan halaman baru, menghapus halaman sebelumnya dari stack, sehingga pengguna tidak dapat kembali. Pada aplikasi Football Shop, saya menggunakan Navigator.push() untuk navigasi ke halaman form tambah produk dari halaman utama, karena pengguna mungkin ingin kembali ke halaman utama setelah menambah produk. Navigator.pushReplacement() bisa digunakan jika setelah login atau splash screen, kita tidak ingin pengguna kembali ke halaman tersebut.

### Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Scaffold menyediakan struktur dasar untuk setiap halaman, termasuk AppBar di atas dan body di tengah. AppBar menampilkan judul halaman dan dapat menyertakan ikon untuk membuka Drawer. Drawer menyediakan menu navigasi yang konsisten di seluruh aplikasi, dengan opsi untuk kembali ke halaman utama atau navigasi ke halaman tambah produk. Struktur ini memastikan bahwa setiap halaman memiliki layout yang seragam, dengan navigasi yang mudah diakses melalui Drawer, dan AppBar yang memberikan konteks halaman saat ini.

### Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Padding memberikan ruang kosong di sekitar widget untuk meningkatkan keterbacaan dan estetika, mencegah elemen form terlalu dekat dengan tepi layar. SingleChildScrollView memungkinkan konten form dapat di-scroll jika tinggi konten melebihi tinggi layar, sehingga form tetap dapat diakses di perangkat dengan layar kecil. ListView dapat digunakan untuk menampilkan daftar elemen form secara vertikal, tetapi dalam aplikasi saya, saya menggunakan Column untuk form sederhana. Contoh penggunaan: Padding digunakan di sekitar body form untuk memberikan margin 16.0, SingleChildScrollView membungkus Column form agar dapat di-scroll jika diperlukan, dan Column mengatur elemen-elemen form seperti TextFormField secara vertikal.

### Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Saya menggunakan ThemeData dengan colorScheme.fromSeed(seedColor: Colors.blue) untuk menetapkan skema warna dasar biru yang konsisten. AppBar menggunakan backgroundColor dari Theme.of(context).colorScheme.inversePrimary untuk warna yang harmonis dengan tema. Drawer menggunakan warna biru untuk header, dan tombol-tombol menggunakan warna yang berbeda (biru, hijau, merah) untuk membedakan fungsi, tetapi tetap dalam palet warna yang konsisten. ElevatedButton untuk "Create Product" menggunakan warna merah untuk menarik perhatian pada aksi utama.
