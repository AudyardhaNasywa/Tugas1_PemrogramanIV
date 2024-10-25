import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController _invoiceController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _customerController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _totalController = TextEditingController();

  void _addSale() {
    if (_invoiceController.text.isNotEmpty &&
        _dateController.text.isNotEmpty &&
        _customerController.text.isNotEmpty &&
        _quantityController.text.isNotEmpty &&
        _totalController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sale added!')),
      );

      // Clear the text fields after adding
      _invoiceController.clear();
      _dateController.clear();
      _customerController.clear();
      _quantityController.clear();
      _totalController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Page'),
        backgroundColor: Colors.pink[100],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.blue[300]!, width: 2), // Border di sekitar
              borderRadius: BorderRadius.circular(12.0), // Sudut yang membulat
              color: Colors.white, // Warna latar belakang
            ),
            padding: const EdgeInsets.all(16.0), // Jarak di dalam border
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Tambah Penjualan',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                const SizedBox(height: 16),
                _buildTextField(_invoiceController, 'No Faktur Penjualan'),
                _buildTextField(_dateController, 'Tanggal Penjualan',
                    keyboardType: TextInputType.datetime),
                _buildTextField(_customerController, 'Nama Customer'),
                _buildTextField(_quantityController, 'Jumlah Barang',
                    keyboardType: TextInputType.number),
                _buildTextField(_totalController, 'Total Penjualan',
                    keyboardType: TextInputType.number),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _addSale,
                  child: Text('Tambah Penjualan'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[100],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.blue[100],
        child: const Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SizedBox(
        width: 300, // Atur lebar TextField sesuai kebutuhan
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.blue[600]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.blue[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.blue[400]!),
            ),
            hintText: 'Masukkan $label',
            hintStyle: TextStyle(color: Colors.grey[400]),
          ),
        ),
      ),
    );
  }
}
