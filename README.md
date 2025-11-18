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

# Tugas 9

Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability): Model Dart diperlukan saat mengambil atau mengirim data JSON karena model memberikan struktur yang jelas terhadap data yang diterima dari backend. Dengan model, setiap field memiliki tipe yang terdefinisi sehingga proses parsing menjadi lebih aman dan terkontrol. Jika langsung memetakan data ke dalam Map<String, dynamic> tanpa model, aplikasi kehilangan validasi tipe, rawan terjadi error null-safety, dan kode akan sulit dirawat ketika struktur data bertambah kompleks. Penggunaan model membuat proses konversi dari JSON ke objek lebih terstandarisasi dan memudahkan pengembangan jangka panjang.

Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest: Package http digunakan untuk melakukan request dasar ke server tanpa membutuhkan autentikasi, seperti pengambilan data publik. Sementara itu, CookieRequest berfungsi untuk melakukan request yang membutuhkan autentikasi berbasis session Django. CookieRequest menyimpan dan mengirim kembali session cookie secara otomatis, sehingga cocok digunakan untuk login, register, atau endpoint yang hanya boleh diakses oleh pengguna yang sudah masuk. Dengan demikian, http menangani komunikasi biasa, sedangkan CookieRequest menangani komunikasi yang membutuhkan status login.

Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter: Instance CookieRequest perlu dibagikan ke semua komponen aplikasi karena objek ini menyimpan status autentikasi pengguna. Seluruh halaman yang memerlukan login harus menggunakan instance yang sama agar session tetap konsisten. Jika setiap widget membuat instance sendiri, maka session Django tidak tersinkronisasi dan pengguna dapat terlihat seperti keluar masuk login secara tidak sengaja. Dengan menggunakan Provider, satu instance CookieRequest dapat diakses oleh seluruh widget sehingga status login tetap berkelanjutan.

elaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar: Konfigurasi konektivitas antara Flutter dan Django melibatkan beberapa langkah penting. Penambahan 10.0.2.2 pada ALLOWED_HOSTS diperlukan karena emulator Android mengakses localhost komputer melalui alamat tersebut. CORS perlu diaktifkan agar Django mengizinkan request dari aplikasi Flutter yang berasal dari origin berbeda. Pengaturan SameSite dan cookie memastikan bahwa session dapat dikirim dari Django ke Flutter tanpa diblokir. Di sisi Android, izin akses internet harus ditambahkan agar aplikasi dapat mengirim request ke server. Jika salah satu konfigurasi tidak benar, maka request akan ditolak, login gagal, cookie tidak tersimpan, atau aplikasi tidak dapat berkomunikasi dengan backend.

Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter: Mekanisme pengiriman data dimulai dari input pengguna pada Flutter kemudian nilai-nilai tersebut dikumpulkan menjadi JSON atau form-data. Data tersebut dikirim ke Django menggunakan CookieRequest. Django memvalidasi data, menyimpannya ke database, dan mengembalikan JSON sebagai respon. Flutter kemudian mengambil data tersebut melalui endpoint GET, mengonversinya ke model Dart, dan menampilkan data pada widget seperti ListView atau Card sehingga pengguna dapat melihat hasil inputnya.

Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter: Mekanisme autentikasi dimulai dari proses register, di mana Flutter mengirim data akun ke Django dan Django membuat user baru. Pada proses login, Flutter mengirim username dan password melalui CookieRequest, lalu Django melakukan verifikasi dan mengembalikan session cookie. CookieRequest menyimpan cookie tersebut sehingga status login menjadi aktif dan Flutter menampilkan menu utama menggunakan Navigator.pushReplacement(). Selama pengguna login, semua request berikutnya membawa session tersebut sehingga Django mengenali pengguna. Pada proses logout, Flutter memanggil endpoint logout Django yang menghapus session, lalu aplikasi kembali ke halaman login dan status pengguna direset sepenuhnya.

Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial) :

Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik: Di langkah ini saya cek terlebih dahulu apakah football shop yang saya buat di django sudah berfungsi dengan baik, dari segi backend nya di fetch product dan penambahannya, untuk menghubungkan ke flutter saya membuat beberapa endpoint yang nanti dipanggil di fitur yang bersesuaian: endpoint login, register, create product, dan proxy image sebagai helper menampilkan gambar.

Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter: Setelah endpoint nya dibuat, di flutter tinggal membuat UI dan logika untuk registrasi akun lalu memanggil endpoint nya yang mereturn json dengan status, dan status tersebut akan digunakan untuk verifikasi registrasi nya.

Membuat halaman login pada proyek tugas Flutter: mirip seperti pembuatan register, Setelah endpoint nya dibuat, di flutter tinggal membuat UI dan logika untuk registrasi akun lalu memanggil endpoint nya yang mereturn json dengan status, dan status tersebut akan digunakan untuk verifikasi registrasi nya.

Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter: Karena dari backend sudah menggunakan backend yang sama yaitu di django, semua akun yang tadinya ada di django sudah terhubung ke project di flutter, karena pengecekan akun ada atau tidak dan pembuatannya dilakukan di django.

Membuat model kustom sesuai dengan proyek aplikasi Django: untuk pembuatan model ini kita perlu membuat class baru di flutter yang akan digunakan sebagai struktur dari Product, variable-variable ini class Product ini disesuaikan dengan data model di django yang juga bersesuaian dengan return JSON dari product di endpoint django.

Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
 Tampilkan name, price, description, thumbnail, category, dan is_featured dari masing-masing item pada halaman ini (Dapat disesuaikan dengan field yang kalian buat sebelumnya): untuk melakukan langkah ini saya membuat product_entry_list.dart yang menggunakan widget FutureBuilder untuk fetchProduct, jika data sudah didapat mereturn GridView.builder yang melakukan mapping ke setiap data product dan membentuknya ke ProductEntryCard yang saya buat di product_entry_card.dart isi dari class ini adalah tampilan ui untuk variable productnya yang sudah di passing sebagai argumen.

 Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
 Halaman ini dapat diakses dengan menekan salah satu card item pada halaman daftar Item.
 Tampilkan seluruh atribut pada model item kamu pada halaman ini.
 Tambahkan tombol untuk kembali ke halaman daftar item: Karena di product_entry_card sudah menerima fungsi untuk onTap() di product_entry_list.dart saya tinggal mendefinisikan fungsinya dengan Navigator.push() ke ProductDetailPage yang dibuat di product_detail.dart, di product detail ini mirip seperti product card menampilkan variable-variable dari product, untuk tombol back nya saya sudah memanggil app bar, jadi jika sudah diatas sebuah stack otomatis ada tombol back untuk melakukan pop().

 Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login: untuk melakukan filter ini, saya melakukan passing argumen userId yang didapat dari login ke setiap page yang membutuhkannya yang menyebabkan hampir semua page menerima parameter ini. Saat product_entry_list sudah mempunyai variable ini, saya tinggal membuat flag boolean untuk toogle filter, dan jika flag ini true/on product yang ditampilkan hanya product yang memenuhi kondisi product.userId = userId.