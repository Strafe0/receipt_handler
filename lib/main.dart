import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:receipt_handler/theme/theme.dart';

const String className = 'es-button msohide es-button-4';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receipt handler',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const MyHomePage(title: 'Обработчик чеков'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textEditingController = TextEditingController();
  String receiptLink = "";
  List<Widget> products = [];
  bool productsLoaded = false;
  bool errorOccurred = false;
  bool productsIsLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 16.0),
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text("Вставьте ссылку на чек", style: TextStyle(fontSize: 16.0),),
              const SizedBox(height: 8.0),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      cursorHeight: 24.0,
                      // textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.8,
                        ),
                        border: const OutlineInputBorder(),
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.paste),
                          onPressed: () async {
                            await Clipboard.getData(Clipboard.kTextPlain).then((value) {
                              _textEditingController.text = value?.text ?? '';
                            });
                          },
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _textEditingController.clear();
                          },
                        )
                      ),
                      controller: _textEditingController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите ссылку';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
                        fixedSize: const MaterialStatePropertyAll(Size(130, 40)),
                      ),
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            productsIsLoading = true;
                            errorOccurred = false;
                          });
                          receiptLink = _textEditingController.text;
                          String? receiptJsonLink = await getLinkToReceiptJson(receiptLink).timeout(
                            const Duration(seconds: 5),
                            onTimeout: () => null,
                          );

                          if (receiptJsonLink != null) {
                            var receipt = await getReceipt(receiptJsonLink);
                            products = prepareGroceryList(receipt);
                            setState(() {
                              productsLoaded = true;
                            });
                          } else {
                            setState(() {
                              productsLoaded = false;
                              errorOccurred = true;
                            });
                          }
                          setState(() {
                            productsIsLoading = false;
                          });
                        }
                      },
                      child: productsIsLoading ? const SizedBox(
                        height: 20.0,
                        width: 20.0,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.0,
                        ),
                      ) : const Text("Получить чек", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              if (errorOccurred) const ErrorMessage(),
              // const Divider(),
              if (productsLoaded) ProductList(products),
            ],
          ),
        ),// This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Future<String?> getLinkToReceiptJson(String receiptLink) async {
    Uri? link = Uri.tryParse(receiptLink);
    if (link != null) {
      try {
        var response = await http.get(Uri.parse(receiptLink));

        if (response.statusCode == 200) {
          var document = parse(response.body);
          var elements = document.getElementsByClassName(className);

          String? receiptJsonLink;
          if (elements.isNotEmpty) {
            receiptJsonLink = elements.first.attributes['href'];
          }

          return receiptJsonLink;
        } else {
          return null;
        }
      } catch(e) {
        // SnackBar errorSnackBar = const SnackBar(content: Text('Что-то пошло не так...'));
        // ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
        return null;
      }
    } else {
      return null;
    }
  }
  
  Future getReceipt(String receiptJsonLink) async {
    var receiptJsonResponse = await http.get(Uri.parse(receiptJsonLink.replaceAll(' ', '')));
    var receipt = jsonDecode(utf8.decode(receiptJsonResponse.bodyBytes));
    return receipt;
  }
  
  List<Widget> prepareGroceryList(var receipt) {
    List products = receipt['Document']['Items'];
    List<Card> result = products.map((product) {
      String quantity = product['Quantity'].toString();
      String name = '${product['Name']} ($quantity)';
      String totalPrice = (product['Total'] / 100).toString().replaceAll('.', ',');
      return Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          // side: BorderSide(color: Theme.of(context).colorScheme.outline),
          side: const BorderSide(),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ProductListTile(attribute: 'Продукт', value: name, key: UniqueKey()),
              Divider(color: Theme.of(context).colorScheme.outline),
              ProductListTile(attribute: 'Количество', value: quantity, key: UniqueKey()),
              Divider(color: Theme.of(context).colorScheme.outline),
              ProductListTile(attribute: 'Цена (руб)', value: totalPrice, key: UniqueKey()),
            ],
          ),
        ),
      );
    }).toList();
    return result;
  }
}

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Не могу найти чек по данной ссылке...',
        style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.red),
      ),
    );
  }
}


class ProductList extends StatelessWidget {
  const ProductList(this.products, {Key? key}) : super(key: key);

  final List<Widget> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: products,
      ),
    );
  }
}

class ProductListTile extends StatefulWidget {
  const ProductListTile({
    required this.attribute,
    required this.value,
    Key? key}) : super(key: key);

  final String attribute;
  final dynamic value;

  @override
  State<ProductListTile> createState() => _ProductListTileState();
}

class _ProductListTileState extends State<ProductListTile> {
  bool copied = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.value.toString()),
      subtitle: Text(widget.attribute),
      trailing: IconButton(
        icon: copied ? const Icon(Icons.check): const Icon(Icons.copy),
        onPressed: copied ? null : () async {
          await Clipboard.setData(ClipboardData(text: widget.value.toString()));
          // await copyToClipboardWithSnackBar(context, widget.value.toString());
          setState(() => copied = true);
        },
      ),
      visualDensity: VisualDensity.comfortable,
    );
  }

  Future<void> copyToClipboardWithSnackBar(BuildContext ctx, String text) async {
    return await Clipboard.setData(ClipboardData(text: text)).then((_) {
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Row(
          children: const [
            Text('Скопировано'),
            SizedBox(width: 20),
          ],
        ),
      ));
    });
  }
}
