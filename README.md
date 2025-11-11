# Tugas 7

Apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget:
Widget tree adalah struktur hierarki yang menggambarkan susunan widget di dalam aplikasi Flutter. Setiap widget di Flutter merupakan elemen visual atau fungsional yang membentuk tampilan aplikasi, mulai dari level tertinggi hingga terkecil. Hubungan parent-child (induk-anak) berarti bahwa setiap widget bisa memiliki widget lain di dalamnya sebagai anak. Parent bertanggung jawab menentukan bagaimana anak-anaknya ditampilkan atau diatur (misalnya posisi, ukuran, atau gaya). Ketika parent diubah atau dibangun ulang, anak-anaknya juga akan diperbarui sesuai perubahan tersebut. Dengan sistem ini, Flutter mampu membangun tampilan yang dinamis dan efisien karena setiap bagian UI dikelola secara terstruktur melalui pohon widget.

Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya:
1. Scaffold: Memberikan struktur dasar halaman, terdiri dari AppBar di atas dan body di bawahnya.
2. AppBar: Bagian atas halaman yang menampilkan judul “Football News” dengan warna latar dari tema aplikasi.
3. Padding: Memberikan jarak di sekitar elemen agar tampilan tidak terlalu menempel ke tepi layar.
4. Column: Menyusun elemen-elemen secara vertikal, seperti Row berisi InfoCard dan teks sambutan.
5. Row: Menyusun beberapa InfoCard secara horizontal di satu baris.
6. InfoCard (Widget kustom): Kartu kecil yang menampilkan informasi NPM, Nama, dan Kelas. Dibuat menggunakan Card, Container, dan Text.
7. Card: Menampilkan kotak dengan efek bayangan (elevation) untuk menonjolkan informasi di dalamnya.
8. Container: Digunakan untuk mengatur ukuran, padding, dan tata letak elemen di dalam Card.
9. Text: Menampilkan teks statis seperti nama, NPM, atau judul halaman.
10. SizedBox: Memberikan jarak vertikal antar elemen (misalnya antar Row dan teks sambutan).
11. Center: Meletakkan elemen di tengah halaman.
12. GridView.count: Menampilkan daftar item dalam bentuk grid (3 kolom) untuk setiap menu seperti All Product, My Product, dan Create Product.
13. ItemCard (Widget kustom): Kartu berwarna untuk setiap item menu, yang dapat ditekan.
14. Material: Memberikan efek visual material (warna, bayangan) pada ItemCard.
15. InkWell: Memberikan efek interaksi (ripple) saat kartu ditekan dan menampilkan SnackBar.
16. SnackBar: Pesan sementara yang muncul di bawah layar ketika pengguna menekan ItemCard.
17. MediaQuery: Digunakan untuk menyesuaikan lebar InfoCard berdasarkan ukuran layar perangkat.
18. Padding (inner): Digunakan di dalam GridView dan ItemCard untuk memberikan jarak antar elemen.
19. MaterialApp: Menjadi root utama aplikasi Flutter yang menyediakan konfigurasi global seperti tema dan routing.

Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root:
MaterialApp berfungsi sebagai wadah utama aplikasi Flutter yang mengatur konfigurasi global seperti tema (ThemeData), routing antar halaman, dan pengaturan tampilan berbasis Material Design. Widget ini sering digunakan sebagai root karena ia menjadi fondasi yang mengatur tampilan dan navigasi aplikasi secara keseluruhan. Tanpa MaterialApp, komponen seperti Scaffold atau AppBar tidak dapat bekerja maksimal karena mereka membutuhkan konteks Material Design yang disediakan oleh MaterialApp.

Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya:
StatelessWidget adalah widget yang tampilannya tidak berubah setelah dibangun. Ia cocok untuk komponen statis seperti teks, ikon, atau tombol yang tidak bergantung pada data yang dapat berubah.
StatefulWidget, sebaliknya, dapat berubah seiring waktu karena memiliki state yang dapat dimodifikasi, misalnya ketika pengguna berinteraksi dengan aplikasi.
StatelessWidget digunakan untuk tampilan yang tetap, sedangkan StatefulWidget digunakan saat tampilan harus diperbarui secara dinamis, seperti saat menekan tombol counter atau memuat data dari internet.

Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build:
BuildContext adalah objek yang merepresentasikan posisi atau lokasi suatu widget di dalam widget tree. Context ini digunakan untuk mengakses informasi tentang widget lain di atasnya, seperti tema, media query, atau navigator. Dalam metode build(), BuildContext menjadi parameter penting yang memungkinkan widget mengetahui di mana ia berada dan bagaimana ia harus menampilkan diri berdasarkan lingkungannya. Misalnya, Theme.of(context) digunakan untuk mengambil tema warna, dan Navigator.of(context) digunakan untuk berpindah halaman.

Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart":
Hot reload adalah fitur Flutter yang memungkinkan pengembang melihat perubahan kode secara langsung tanpa kehilangan state aplikasi. Flutter hanya memuat ulang bagian kode yang diubah dan memperbarui tampilan secara cepat, sehingga sangat membantu saat melakukan eksperimen UI.
Sedangkan hot restart akan memuat ulang seluruh aplikasi dari awal, menghapus seluruh state yang sedang berjalan. Perbedaannya adalah hot reload mempertahankan data atau status aplikasi saat ini, sementara hot restart mengulang semuanya seperti saat aplikasi pertama kali dijalankan.

# Tugas 8

Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu:
Navigator.push() digunakan untuk menambahkan halaman baru ke atas tumpukan (stack) navigasi tanpa menghapus halaman sebelumnya. Dengan cara ini, pengguna masih dapat kembali ke halaman sebelumnya menggunakan tombol “back”.
Sementara itu, Navigator.pushReplacement() akan mengganti halaman saat ini dengan halaman baru, sehingga pengguna tidak bisa kembali ke halaman sebelumnya.
Dalam aplikasi Football Shop, Navigator.push() cocok digunakan ketika pengguna berpindah dari halaman utama ke halaman detail produk, agar mereka bisa kembali lagi setelah melihat detail. Sedangkan Navigator.pushReplacement() lebih tepat digunakan setelah proses login atau logout, di mana pengguna tidak perlu kembali ke halaman sebelumnya karena konteksnya sudah berubah sepenuhnya.

Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi:
Scaffold digunakan sebagai kerangka utama setiap halaman agar memiliki struktur dasar yang konsisten, seperti AppBar di bagian atas dan body di bawahnya.
AppBar berfungsi menampilkan judul halaman atau tombol navigasi, sehingga setiap halaman memiliki tampilan yang seragam dan mudah dikenali pengguna.
Drawer digunakan sebagai menu navigasi samping yang berisi tautan ke berbagai fitur, seperti “All Product”, “My Product”, dan “Create Product”.
Dengan memanfaatkan ketiga widget ini secara konsisten, seluruh halaman dalam aplikasi Football Shop memiliki struktur dan pengalaman pengguna yang seragam, sehingga tampilan terasa profesional dan mudah digunakan.

Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu:
Padding digunakan untuk memberikan jarak antar elemen form, sehingga tampilan tidak terlalu rapat dan lebih nyaman dilihat.
SingleChildScrollView memungkinkan seluruh isi form dapat discroll, terutama ketika isi form panjang dan tidak muat di layar kecil.
ListView berguna saat elemen form jumlahnya dinamis atau banyak, karena secara otomatis dapat mengscroll dan mengatur posisi elemen.
Dalam aplikasi Football Shop, kombinasi ketiganya digunakan pada halaman Create Product, di mana form input dibungkus dengan Padding agar rapi, serta dibungkus diluarnya dengan SingleChildScrollView.


Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko:
Penyesuaian warna tema dilakukan melalui pengaturan ThemeData di widget MaterialApp di main.dart. Warna utama (primarySwatch) diisi dengan warna yang diinginkan, yang disini untuk sementara warna biru.