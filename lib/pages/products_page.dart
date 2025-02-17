import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:untitled2/models/product_model.dart';
import 'package:untitled2/models/user_full_model.dart';
import 'package:untitled2/models/user_model.dart';
import 'package:untitled2/services/api_service.dart';
import 'package:untitled2/services/api_service_2.dart';

class ProductsPage extends StatefulWidget {
  static const String id = "qqqqqqqq";

  ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Product>? products;

  getAllProducts() async {
    ApiService apiService = ApiService();
    Response? response = await apiService.getRequest("/products");
    Map<String, dynamic> responseJson = response!.data;
    List products = responseJson['products'];
    List<Product> productsObj =
        products.map((product) => Product.fromJson(product)).toList();
    setState(() {
      this.products = productsObj;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products Page"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: products == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: products!.length,
              itemBuilder: (context, index) {
                final product = products![index];
                return ListTile(
                  leading:
                      product.thumbnail != null && product.thumbnail!.isNotEmpty
                          ? Image.network(product.thumbnail!,
                              width: 50, height: 50, fit: BoxFit.cover)
                          : Icon(Icons.image, size: 50),
                  title: Text(product.title),
                  subtitle: Text(product.price != null
                      ? '\$${product.price!.toStringAsFixed(2)}'
                      : 'No price available'),
                );
              },
            ),
    );
  }
}
