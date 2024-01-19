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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LinkTextField(),
                    ...prepareProducts(state.receipt.products),
                    Row(
                      children: [
                        const Expanded(child: Text('Итого')),
                        Text(state.receipt.totalSum.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(child: Text('Торговая точка')),
                        Text(state.receipt.retailPlace),
                      ],
                    ),
                  ],
                ),
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
            ProductTile(title: product.quantity.toString(), subtitle: 'Количество (шт/кг)'),
            const Divider(),
            ProductTile(title: product.sum.toString(), subtitle: 'Стоимость (руб)'),
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

class LinkTextField extends StatelessWidget {
  LinkTextField({super.key});

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          autofocus: true,
          cursorHeight: 24.0,
          controller: _textController,
          decoration: InputDecoration(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.8,
            ),
            border: const OutlineInputBorder(),
            prefixIcon: IconButton(
              icon: const Icon(Icons.paste),
              onPressed: () async {
                await Clipboard.getData(Clipboard.kTextPlain).then((value) {
                  _textController.text = value?.text ?? '';
                });
              },
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _textController.clear();
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
          child: ElevatedButton(
            onPressed: () => context.read<ReceiptCubit>().getReceiptFromLink(_textController.text),
            child: const Text('Получить чек'),
          ),
        ),
      ],
    );
  }
}