import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.pink[100], // Warna pastel untuk AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .center, // Ubah menjadi center untuk memusatkan seluruh kolom
          children: [
            Center(
              // Menambahkan Center untuk memusatkan judul
              child: Text(
                'Tabel Penjualan', // Judul di atas tabel
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink[800], // Warna judul
                ),
              ),
            ),
            const SizedBox(height: 16), // Jarak antara judul dan tabel
            Center(
              // Menambahkan Center untuk menempatkan tabel di tengah
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  border: TableBorder.all(
                    color: Colors.blue[200]!,
                    width: 2,
                  ), // Border dengan warna biru pastel
                  headingRowColor: MaterialStateProperty.all(
                      Colors.blue[100]), // Warna header biru muda pastel
                  columnSpacing: 12.0, // Jarak antar kolom
                  columns: const [
                    DataColumn(
                      label: Center(
                        child: Text(
                          'No Faktur',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center, // Pusatkan teks
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Center(
                        child: Text(
                          'Tanggal',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center, // Pusatkan teks
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Center(
                        child: Text(
                          'Nama Customer',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center, // Pusatkan teks
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Center(
                        child: Text(
                          'Jumlah Barang',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center, // Pusatkan teks
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Center(
                        child: Text(
                          'Total Penjualan',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center, // Pusatkan teks
                        ),
                      ),
                    ),
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text('001')),
                      DataCell(Text('2024-10-01')),
                      DataCell(Text('Andi Egidia')),
                      DataCell(Text('5')),
                      DataCell(Text('500.000')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('002')),
                      DataCell(Text('2024-10-02')),
                      DataCell(Text('Dina Oktafiani')),
                      DataCell(Text('3')),
                      DataCell(Text('300.000')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('003')),
                      DataCell(Text('2024-10-03')),
                      DataCell(Text('Dwi Aprilya Sari')),
                      DataCell(Text('2')),
                      DataCell(Text('200.000')),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.pink[300], // Warna pastel untuk tombol
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
