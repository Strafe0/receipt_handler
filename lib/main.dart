import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_handler/bloc/bloc.dart';
import 'package:receipt_handler/data/product/product_interface.dart';
import 'package:receipt_handler/data/receipt/receipt_interface.dart';
import 'package:receipt_handler/data/repository/repository.dart';
import 'package:receipt_handler/theme/theme.dart';
import 'package:flutter/services.dart';
import 'package:receipt_handler/utils/date_time_utils.dart';

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
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text("Обработчик чеков")),
          body: Container(
            alignment: Alignment.topCenter,
            child: BlocBuilder<ReceiptCubit, ReceiptState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        LinkTextField(),
                        ...prepareProducts(state.receipt.products),
                        const SizedBox(height: 12,),
                        if (state.receipt is! EmptyReceipt)
                          ReceiptInfo(state: state),
                        if (state.status == ReceiptStatus.loading)
                          const CircularProgressIndicator(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(18),
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
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
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
        Text(subtitle, style: Theme.of(context).textTheme.labelMedium,),
      ],
    );
  }
}

class ReceiptInfo extends StatelessWidget {
  const ReceiptInfo({super.key, required this.state});

  final ReceiptState state;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ReceiptInfoTile(
        infoKey: 'Итого',
        infoValue: '${state.receipt.totalSum.toString()} руб.',
        textStyle: Theme.of(context).textTheme.titleLarge,
      ),
      ReceiptInfoTile(
        infoKey: 'Торговая точка',
        infoValue: state.receipt.retailPlace,
        textStyle: Theme.of(context).textTheme.titleMedium,
      ),
      ReceiptInfoTile(
        infoKey: 'Дата и время',
        infoValue: dateFormat.format(state.receipt.dateTime),
        textStyle: Theme.of(context).textTheme.titleMedium,
      ),
    ]);
  }
}

class ReceiptInfoTile extends StatelessWidget {
  const ReceiptInfoTile(
      {super.key,
      required this.infoKey,
      required this.infoValue,
      this.textStyle});

  final String infoKey;
  final String infoValue;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            infoKey,
            style: textStyle,
          ),
        ),
        Text(
          infoValue,
          style: textStyle,
        ),
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
          autofocus: false,
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