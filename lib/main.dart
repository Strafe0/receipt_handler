import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_handler/bloc/bloc.dart';
import 'package:receipt_handler/data/product/product_interface.dart';
import 'package:receipt_handler/data/repository/repository.dart';
import 'package:receipt_handler/theme/theme.dart';
import 'package:flutter/services.dart';

import 'bloc/receipt_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Обработчик чеков',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: ReceiptHandlerApp(repository: Repository()),
    );
  }
}

class ReceiptHandlerApp extends StatelessWidget {
  const ReceiptHandlerApp({super.key, required Repository repository})
      : _repository = repository;

  final Repository _repository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _repository,
      child: const ReceiptHandlerAppView(),
    );
  }
}

class ReceiptHandlerAppView extends StatelessWidget {
  const ReceiptHandlerAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReceiptCubit(context.read<Repository>()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Обработчик чеков")),
        body: BlocBuilder<ReceiptCubit, ReceiptState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView(
                children: prepareProducts(state.receipt.products),
              ),
            );
          },
        ),
      ),
    );
  }

  List<ProductCard> prepareProducts(List<IProduct> products) {
    return products.map<ProductCard>((p) => ProductCard(product: p)).toList();
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final IProduct product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ProductTile(title: product.name, subtitle: 'Продукт'),
            const Divider(),
            ProductTile(title: product.quantity.toString(), subtitle: 'Количество'),
            const Divider(),
            ProductTile(title: product.sum.toString(), subtitle: 'Стоимость'),
          ],
        ),
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: Text(title)),
            IconButton(
              onPressed: () async {
                Clipboard.setData(ClipboardData(text: title));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    content: Text(
                      "Скопировано!",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.copy),
            ),
          ],
        ),
        Text(subtitle),
      ],
    );
  }
}