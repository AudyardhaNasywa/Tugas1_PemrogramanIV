import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<Map<String, String>> salesData = [
    {
      'noFaktur': '001',
      'tanggal': '2024-10-01',
      'namaCustomer': 'Andi Egidia',
      'jumlahBarang': '5',
      'totalPenjualan': '500.000',
    },
    {
      'noFaktur': '002',
      'tanggal': '2024-10-02',
      'namaCustomer': 'Dina Oktafiani',
      'jumlahBarang': '3',
      'totalPenjualan': '300.000',
    },
    {
      'noFaktur': '003',
      'tanggal': '2024-10-03',
      'namaCustomer': 'Dwi Aprilya Sari',
      'jumlahBarang': '2',
      'totalPenjualan': '200.000',
    },
  ];

  void _addSalesData(Map<String, String> newSale) {
    setState(() {
      salesData.add(newSale);
    });
  }

  void _showAddSalesForm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddSalesForm(onAdd: _addSalesData);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.pink[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Daftar Penjualan',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink[800],
                  ),
                ),
                ElevatedButton(
                  onPressed: _showAddSalesForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[100],
                  ),
                  child: const Text('+ Tambah'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: salesData.length,
                itemBuilder: (context, index) {
                  final sale = salesData[index];
                  return SalesCard(
                    noFaktur: sale['noFaktur']!,
                    tanggal: sale['tanggal']!,
                    namaCustomer: sale['namaCustomer']!,
                    jumlahBarang: sale['jumlahBarang']!,
                    totalPenjualan: sale['totalPenjualan']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.pink[300],
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

class AddSalesForm extends StatelessWidget {
  final Function(Map<String, String>) onAdd;
  final TextEditingController fakturController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController namaCustomerController = TextEditingController();
  final TextEditingController jumlahBarangController = TextEditingController();
  final TextEditingController totalPenjualanController =
      TextEditingController();

  AddSalesForm({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Tambah Penjualan',
        style: TextStyle(
          color: Colors.pink,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: fakturController,
              decoration: const InputDecoration(labelText: 'No. Faktur'),
            ),
            TextField(
              controller: tanggalController,
              decoration: const InputDecoration(labelText: 'Tanggal'),
            ),
            TextField(
              controller: namaCustomerController,
              decoration: const InputDecoration(labelText: 'Nama Customer'),
            ),
            TextField(
              controller: jumlahBarangController,
              decoration: const InputDecoration(labelText: 'Jumlah Barang'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: totalPenjualanController,
              decoration: const InputDecoration(labelText: 'Total Penjualan'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Batal'),
        ),
        ElevatedButton(
          onPressed: () {
            final newSale = {
              'noFaktur': fakturController.text,
              'tanggal': tanggalController.text,
              'namaCustomer': namaCustomerController.text,
              'jumlahBarang': jumlahBarangController.text,
              'totalPenjualan': totalPenjualanController.text,
            };
            onAdd(newSale);
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink[300],
          ),
          child: const Text('Simpan'),
        ),
      ],
    );
  }
}

class SalesCard extends StatelessWidget {
  final String noFaktur;
  final String tanggal;
  final String namaCustomer;
  final String jumlahBarang;
  final String totalPenjualan;

  const SalesCard({
    super.key,
    required this.noFaktur,
    required this.tanggal,
    required this.namaCustomer,
    required this.jumlahBarang,
    required this.totalPenjualan,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Detail Penjualan: $noFaktur',
                style: TextStyle(
                  color: Colors.pink[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tanggal: $tanggal'),
                  Text('Nama Customer: $namaCustomer'),
                  Text('Jumlah Barang: $jumlahBarang'),
                  Text('Total Penjualan: Rp$totalPenjualan'),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.pink[300],
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Tutup'),
                ),
              ],
            );
          },
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'No Faktur: $noFaktur',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.pink[800]),
              ),
              const SizedBox(height: 8),
              Text('Tanggal: $tanggal'),
              Text('Nama Customer: $namaCustomer'),
              Text('Jumlah Barang: $jumlahBarang'),
              Text(
                'Total Penjualan: Rp$totalPenjualan',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
