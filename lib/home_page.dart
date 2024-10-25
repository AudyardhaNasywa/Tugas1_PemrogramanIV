import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'add_page.dart';
import 'update_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Management System'),
        backgroundColor: Colors.pink[100], // Menggunakan warna pastel
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Memastikan teks di sebelah kiri
              children: [
                Text(
                  'Audyardha Nasywa Andini', // Ganti dengan namamu
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8), // Jarak antara nama dan NPM
                Text(
                  '714220020', // Ganti dengan NPM-mu
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                // Dashboard
                Card(
                  color: Colors.blue[100], // Warna untuk Dashboard
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardPage()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.dashboard, size: 50), // Ikon Dashboard
                        SizedBox(height: 8),
                        Text('Dashboard'),
                      ],
                    ),
                  ),
                ),
                // Add
                Card(
                  color: Colors.green[100], // Warna untuk Add
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddPage()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, size: 50), // Ikon Add
                        SizedBox(height: 8),
                        Text('Add'),
                      ],
                    ),
                  ),
                ),
                // Update
                Card(
                  color: Colors.orange[100], // Warna untuk Update
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdatePage()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.update, size: 50), // Ikon Update
                        SizedBox(height: 8),
                        Text('Update'),
                      ],
                    ),
                  ),
                ),
                // Logout
                Card(
                  color: Colors.red[100], // Warna untuk Logout
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout, size: 50), // Ikon Logout
                        SizedBox(height: 8),
                        Text('Logout'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
