import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Universitas Esa Unggul',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Tangerang, Indonesia',
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.blue[800],
          ),
          const Text('4.5'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Universitas Esa Unggul, atau disingkat UEU, adalah perguruan tinggi swasta yang didirikan pada tahun 1993 di Jakarta oleh Yayasan Pendidikan Kemala',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Pertemuan 4',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pertemuan 4'),
          centerTitle: true,
        ),

        body: ListView(
          children: [
            Image.network(
              'https://sekawantriasa.com/wp-content/uploads/2021/08/Esa-Unggul-Tangerang.jpg',
              width: 800,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 155), // Adjust the margin here
          child: FloatingActionButton(
            onPressed: () {
              // Handle the back button action here
              Navigator.of(context).pop();
            },
            backgroundColor: Colors.blue,
            child: Text(
              'Back',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // Add BottomNavigationBar
        bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
        label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business), // Replace with your icon for "Other"
        label: 'Other',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person), // Replace with your icon for "Profile"
        label: 'Profile',
      ),
    ),
  };

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
