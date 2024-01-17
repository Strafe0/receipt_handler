import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_handler/bloc/bloc.dart';
import 'package:receipt_handler/data/repository/repository.dart';
import 'package:receipt_handler/theme/theme.dart';

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
            return ListView(
              children: state.receipt.products.map((p) => Card(child: Text(p.name))).toList(),
            );
          },
        ),
      ),
    );
  }
}