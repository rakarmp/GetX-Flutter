import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:ujikom_app/app/modules/home/views/home_view.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  DashboardView({Key? key}) : super(key: key);

  final authToken = GetStorage();

  void logoutNow() async {
    authToken.remove('token');
    Get.offAll(const HomeView());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Widget SafeArea menempatkan semua konten widget ke dalam area yang aman (safe area) dari layar.
      child: DefaultTabController(
        length: 3,
        // Widget DefaultTabController digunakan untuk mengatur tab di aplikasi.
        child: Scaffold(
          // Widget Scaffold digunakan sebagai struktur dasar aplikasi.
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120.0),
            // Widget PreferredSize digunakan untuk menyesuaikan tinggi appBar.
            child: Column(
              // Widget Column adalah widget yang menyatukan widget-childnya secara vertikal.
              children: [
                IconButton(
                    onPressed: () => logoutNow(),
                    icon: const Icon(Icons.logout)),
                ListTile(
                  // Widget ListTile digunakan untuk menampilkan tampilan list sederhana.
                  title: const Text(
                    "Hallo!",
                    textAlign: TextAlign.end,
                    // Properti textAlign digunakan untuk menentukan perataan teks.
                  ),
                  subtitle: const Text(
                    "Agung Wahyudi",
                    textAlign: TextAlign.end,
                    // Properti textAlign digunakan untuk menentukan perataan teks.
                  ),
                  trailing: Container(
                    // Widget Container digunakan untuk mengatur tampilan konten dalam kotak.
                    margin: const EdgeInsets.only(right: 10),
                    // Properti margin digunakan untuk menentukan jarak dari tepi kontainer ke tepi widget yang di dalamnya.
                    width: 50.0,
                    height: 50.0,
                    child: Lottie.network(
                      // Widget Lottie.network digunakan untuk menampilkan animasi Lottie dari suatu URL.
                      'https://gist.githubusercontent.com/olipiskandar/2095343e6b34255dcfb042166c4a3283/raw/d76e1121a2124640481edcf6e7712130304d6236/praujikom_kucing.json',
                      fit: BoxFit.cover,
                      // Properti fit digunakan untuk menyesuaikan ukuran konten agar sesuai dengan kontainer.
                    ),
                  ),
                ),
                const Align(
                  // Widget Align digunakan untuk menempatkan widget pada posisi tertentu di dalam widget induk.
                  alignment: Alignment.topLeft,
                  // Properti alignment digunakan untuk menentukan letak widget di dalam widget induk.
                  child: TabBar(
                    // Widget TabBar digunakan untuk menampilkan tab di aplikasi.
                    labelColor: Colors.black,
                    // Properti labelColor digunakan untuk menentukan warna teks tab yang dipilih.
                    indicatorSize: TabBarIndicatorSize.label,
                    // Properti indicatorSize digunakan untuk menentukan ukuran indikator tab yang dipilih.
                    isScrollable: true,
                    // Properti isScrollable digunakan untuk menentukan apakah tab dapat di-scroll atau tidak.
                    indicatorColor: Colors.white,
                    // Properti indicatorColor digunakan untuk menentukan warna indikator tab yang dipilih.
                    tabs: [
                      // Properti tabs digunakan untuk menentukan teks yang akan ditampilkan pada masing-masing tab.
                      Tab(text: "Headline"),
                      Tab(text: "Teknologi"),
                      Tab(text: "Sains"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            // Widget TabBarView digunakan untuk menampilkan konten yang terkait dengan masing-masing tab.
            children: [
              // Properti children digunakan untuk menentukan konten yang akan ditampilkan pada masing-masing tab.
              headline(),
              Center(child: Text('Berita Teknologi')),
              Center(child: Text('Berita Sains')),
            ],
          ),
        ),
      ),
    );
  }
}

ListView headline() {
  return ListView(
    shrinkWrap:
        true, // Mengatur agar ListView tidak memakan ruang kosong yang tidak diperlukan
    children: [
      Container(
        // Membuat sebuah container untuk mengandung gambar, judul, dan sumber berita
        padding: const EdgeInsets.only(
            top: 5,
            left: 8,
            right: 8,
            bottom: 5), // Mengatur padding di dalam container
        height: 110, // Mengatur tinggi container
        child: Row(
          crossAxisAlignment: CrossAxisAlignment
              .start, // Mengatur tata letak anak-anak dalam row secara vertikal di awal
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(8.0), // Mengatur radius border gambar
              child: Image.network(
                'https://picsum.photos/100', // Mengambil gambar dari url
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Mengatur tata letak anak-anak dalam column secara horizontal di awal
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Mengatur tata letak anak-anak dalam column secara vertikal dengan spasi yang sama di antara mereka
                children: [
                  const Text(
                      'Sri Mulyani Kecam Hidup Mewah Pejabat Pajak Buntut Kasus Rubicon - CNN Indonesia'), // Menampilkan judul berita
                  const SizedBox(
                    height: 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Mengatur tata letak anak-anak dalam column secara horizontal di awal
                    children: const [
                      Text(
                          'Author : Muhammad Azwar'), // Menampilkan nama penulis berita
                      Text('Sumber : detik.com'), // Menampilkan sumber berita
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
