import 'package:flutter/material.dart';
import 'package:football_shop/widgets/left_drawer.dart';


class ProductFormPage extends StatefulWidget {
    const ProductFormPage({super.key});

    @override
    State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  int _price = 0;
  String _content = "";
  String _category = "sepatu"; // default
  String _thumbnail = "";
  bool _isFeatured = false; // default

  final List<String> _categories = [
    'sepatu',
    'kaoskaki',
    'bola',
    'deker',
    'glove',
    'jersey',
  ];
    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Form Tambah Product',
              ),
            ),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
          // TODO: Tambahkan drawer yang sudah dibuat di sini
          drawer: LeftDrawer(),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  // === Title ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Nama Product",
                        labelText: "Nama Product",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _title = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Nama tidak boleh kosong!";
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Masukkan harga produk",
                        labelText: "Harga Produk",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        final parsed = int.tryParse(value!);
                          if (parsed == null) {
                            _price = 0;
                          } else {
                            _price = parsed;
                          }
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Harga produk tidak boleh kosong!";
                        }
                        final harga = double.tryParse(value);
                        if (harga == null || harga <= 0) {
                          return "Masukkan harga yang valid!";
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Deskripsi Product",
                        labelText: "Deskripsi Product",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _content = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Deskripsi product tidak boleh kosong!";
                        }
                        return null;
                      },
                    ),
                  ),

                  // === Category ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: "Kategori",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      initialValue: _category,
                      items: _categories
                          .map((cat) => DropdownMenuItem(
                                value: cat,
                                child: Text(
                                    cat[0].toUpperCase() + cat.substring(1)),
                              ))
                          .toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _category = newValue!;
                        });
                      },
                    ),
                  ),

                  // === Thumbnail URL ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "URL Thumbnail (opsional)",
                        labelText: "URL Thumbnail",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _thumbnail = value!;
                        });
                      },
                    ),
                  ),

                  // === Is Featured ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SwitchListTile(
                      title: const Text("Featured Product"),
                      value: _isFeatured,
                      onChanged: (bool value) {
                        setState(() {
                          _isFeatured = value;
                        });
                      },
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.indigo),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Product berhasil disimpan!'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Nama: $_title'),
                                        Text('Harga: $_price'),
                                        Text('Deskripsi: $_content'),
                                        Text('Kategori: $_category'),
                                        Text('Thumbnail: $_thumbnail'),
                                        Text(
                                            'Featured: ${_isFeatured ? "Ya" : "Tidak"}'),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                            _formKey.currentState!.reset();
                          }
                        },
                        child: const Text(
                          "Simpan",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ]
              ),
            ),
          )
        );
    }
}