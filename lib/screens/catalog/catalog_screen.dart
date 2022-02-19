import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Catalog Screen",
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
    );
  }
}
