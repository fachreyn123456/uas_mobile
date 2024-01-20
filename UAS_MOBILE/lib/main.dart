import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FashionStore App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FashionStore App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to FashionStore App'),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              icon: Icon(Icons.person),
              label: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _handleRegistration() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage(username: username)),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Username and password are required.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleRegistration,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  final String username;

  WelcomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, $username!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

class UserPage extends StatelessWidget {
  final String username;
  final String password;
  final List<String> loggedInUsers; // Menyimpan daftar pengguna yang sudah login

  UserPage({
    required this.username,
    required this.password,
    required this.loggedInUsers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User Information:'),
            SizedBox(height: 10),
            Text('Username: $username'),
            Text('Password: $password'),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                // Tampilkan daftar pengguna yang sudah login
                _showLoggedInUsers(context);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Show Logged In Users',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLoggedInUsers(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logged In Users'),
          content: Column(
            children: loggedInUsers.map((user) => Text(user)).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DashboardItem(
              icon: Icons.shopping_cart,
              label: 'Products',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductPage()),
                );
              },
            ),
            DashboardItem(
              icon: Icons.category,
              label: 'Categories',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoriesPage()),
                );
              },
            ),
            DashboardItem(
              icon: Icons.local_offer,
              label: 'Tags',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TagPages()),
                );
              },
            ),
            DashboardItem(
              icon: Icons.person,
              label: 'User',
              onPressed: () {
                // Navigasi ke halaman pengguna
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();

  List<Map<String, dynamic>> productList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: productNameController,
              decoration: InputDecoration(
                labelText: 'Product Name',
                prefixIcon: Icon(Icons.shopping_cart),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: productPriceController,
              decoration: InputDecoration(
                labelText: 'Product Price',
                prefixIcon: Icon(Icons.attach_money),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    String productName = productNameController.text;
                    String productPrice = productPriceController.text;

                    if (productName.isNotEmpty && productPrice.isNotEmpty) {
                      // Menambahkan produk ke dalam daftar
                      setState(() {
                        productList.add({
                          'name': productName,
                          'price': double.parse(productPrice),
                        });
                      });

                      // Membersihkan input setelah produk ditambahkan
                      productNameController.clear();
                      productPriceController.clear();
                    }
                  },
                  child: Text('Add Product'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Membersihkan input jika tombol "Cancel" ditekan
                    productNameController.clear();
                    productPriceController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Warna merah
                  ),
                  child: Text('Cancel'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(productList[index]['name']),
                    subtitle: Text('Price: \$${productList[index]['price']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Tampilkan dialog atau navigasi untuk memperbarui produk
                            _showEditDialog(index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Hapus produk dari daftar
                            setState(() {
                              productList.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Menampilkan dialog untuk memperbarui produk
  void _showEditDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: TextEditingController(text: productList[index]['name']),
                decoration: InputDecoration(
                  labelText: 'Product Name',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: TextEditingController(text: productList[index]['price'].toString()),
                decoration: InputDecoration(
                  labelText: 'Product Price',
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Perbarui produk dalam daftar
                setState(() {
                  productList[index]['name'] = productNameController.text;
                  productList[index]['price'] = double.parse(productPriceController.text);
                });

                // Membersihkan input setelah produk diperbarui
                productNameController.clear();
                productPriceController.clear();

                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }
}

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  TextEditingController categoryController = TextEditingController();
  List<String> categoriesList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: categoryController,
              decoration: InputDecoration(
                labelText: 'Category Name',
                prefixIcon: Icon(Icons.category),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    String category = categoryController.text;

                    if (category.isNotEmpty) {
                      setState(() {
                        categoriesList.add(category);
                      });

                      // Membersihkan input setelah kategori ditambahkan
                      categoryController.clear();
                    }
                  },
                  child: Text('Add Category'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Membersihkan input jika tombol "Cancel" ditekan
                    categoryController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Warna merah
                  ),
                  child: Text('Cancel'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: categoriesList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(categoriesList[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Hapus kategori dari daftar
                        setState(() {
                          categoriesList.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TagPages extends StatefulWidget {
  @override
  _TagPagesState createState() => _TagPagesState();
}

class _TagPagesState extends State<TagPages> {
  List<String> tags = [];
  TextEditingController _tagController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tags'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('FashionStore Tags Page'),
            SizedBox(height: 20), // Spacer
            TagInput(
              tagController: _tagController,
              onTagSubmitted: (String tag) {
                setState(() {
                  tags.add(tag);
                });
              },
            ),
            SizedBox(height: 20), // Spacer
            TagList(
              tags: tags,
              onDelete: (int index) {
                setState(() {
                  tags.removeAt(index);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TagInput extends StatelessWidget {
  final TextEditingController tagController;
  final Function(String) onTagSubmitted;

  TagInput({required this.tagController, required this.onTagSubmitted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: tagController,
              decoration: InputDecoration(
                labelText: 'Enter Tag',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              String enteredTag = tagController.text;
              if (enteredTag.isNotEmpty) {
                onTagSubmitted(enteredTag);
                tagController.clear();
              }
            },
            child: Text('Add Tag'),
          ),
        ],
      ),
    );
  }
}

class TagList extends StatelessWidget {
  final List<String> tags;
  final Function(int) onDelete;

  TagList({required this.tags, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tags.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tags[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                onDelete(index);
              },
            ),
          );
        },
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  DashboardItem({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
