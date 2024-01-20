import 'package:flutter/material.dart';

void main() {
  runApp(TrackingApp());
}

class TrackingApp extends StatefulWidget {
  @override
  _TrackingAppState createState() => _TrackingAppState();
}

class _TrackingAppState extends State<TrackingApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    OtherPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracking App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tracking App'),
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Other',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(16), // Optional margin for the card
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Hello Word',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16), // Add some spacing
              Text(
                ' This is my mobile programming assignment',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Left-side content (employment and education history)
          Container(
            width: 200, // Adjust the width as needed
            padding: EdgeInsets.all(20), // Add padding as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
              children: [
                // Employment History with bold text
                Text(
                  'Employment History:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8), // Add space between sections
                Text('1. Sebagai CS di PT. Citra Akses Indonusa'),

                // Add more space between sections
                SizedBox(height: 16),

                // Education History with bold text
                Text(
                  'Education History:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8), // Add space between sections
                Text('1. MAN 1 Trenggalek - 2020'),
                Text('2. Menempuh S1 di Universitas Esa Unggul'),
              ],
            ),
          ),

          // Right-side content (if needed)
          // For example, add a Text widget with content for the right side.
          // Text('Right Side Content'),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 90, // Adjust the size as needed
            backgroundImage: AssetImage('assets/images/profilImage.jpeg'), // Correct image file path
            // Add padding to the CircleAvatar
            child: Padding(
              padding: EdgeInsets.only(bottom: 30),
            ),
          ),
          SizedBox(height: 25), // Add some spacing
          Text('Nama : Fachreyn Nurika Fitri'),
          Text('NIM  : 20210801258'),
          Text('Prodi : Teknik Informatika'),
          Text('Fakultas : Ilmu Komputer'),
        ],
      ),
    );
  }
}




