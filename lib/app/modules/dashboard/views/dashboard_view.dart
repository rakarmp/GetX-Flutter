import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashboardView'),
        centerTitle: true,
      ),
      body: TabBarView(children: [
        headline(),
        const Center(
          child: Text('Berita Teknologi'),
        ),
        const Center(
          child: Text('Berita Sains'),
        ),
      ]),
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
