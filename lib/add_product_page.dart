import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:football_shop/screens/menu.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _thumbnailController = TextEditingController();
  final _categoryController = TextEditingController();
  final _stockController = TextEditingController();

  bool _isFeatured = false;

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _thumbnailController.dispose();
    _categoryController.dispose();
    _stockController.dispose();
    super.dispose();
  }

  Future<void> _saveProduct() async {
    if (!_formKey.currentState!.validate()) return;

    final request = context.read<CookieRequest>();

    final data = {
      "name": _nameController.text,
      "price": int.parse(_priceController.text),
      "description": _descriptionController.text,
      "thumbnail": _thumbnailController.text,
      "category": _categoryController.text,
      "stock": int.parse(_stockController.text),
      "is_featured": _isFeatured,
    };

    final response = await request.postJson(
      "http://127.0.0.1:8000/api/products/create/",
      jsonEncode(data),
    );

    if (!mounted) return;

    if (response['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product successfully saved!')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => FootballShopHome()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['message'] ?? 'Failed to save product!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    if (value.length < 3) {
                      return 'Name must be at least 3 characters';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: _priceController,
                  decoration: const InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a price';
                    }
                    if (int.tryParse(value) == null || int.parse(value) <= 0) {
                      return 'Price must be a positive number';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: _stockController,
                  decoration: const InputDecoration(labelText: 'Stock'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter stock';
                    }
                    if (int.tryParse(value) == null || int.parse(value) < 0) {
                      return 'Stock must be a non-negative number';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    if (value.length < 10) {
                      return 'Description must be at least 10 characters';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: _thumbnailController,
                  decoration: const InputDecoration(labelText: 'Thumbnail URL'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a thumbnail URL';
                    }
                    final uri = Uri.tryParse(value);
                    if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
                      return 'Invalid URL';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: _categoryController,
                  decoration: const InputDecoration(labelText: 'Category'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a category';
                    }
                    return null;
                  },
                ),

                CheckboxListTile(
                  title: const Text("Featured Product"),
                  value: _isFeatured,
                  onChanged: (v) => setState(() => _isFeatured = v ?? false),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: _saveProduct,
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
