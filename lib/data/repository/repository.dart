import 'dart:convert';
import 'dart:developer';

import 'package:receipt_handler/data/data_providers/shared_data_provider.dart';
import 'package:receipt_handler/data/receipt/receipt_fns/receipt_fns.dart';
import 'package:http/http.dart' as http;
import 'package:receipt_handler/data/receipt/receipt_ofd_ru/receipt_ofd_ru.dart';
import 'package:html/parser.dart';

const String receiptHtmlClassName = 'es-button msohide es-button-4';

class Repository {
  final SharedDataProvider _dataProvider = SharedDataProvider();

  Future<ReceiptFns?> getReceiptFromSharedData() async {
    String? sharedData = await _dataProvider.readContentOfSharedFile();
    
    if (sharedData != null) {
      try {
        List decodedList = jsonDecode(sharedData);
      
        Map<String, dynamic> json = decodedList.first as Map<String, dynamic>;
        Map<String, dynamic> receiptJson = json["ticket"]["document"]["receipt"];

        return ReceiptFns.fromJson(receiptJson);
      } catch (e) {
        log('Repository error: sharedData parsing failure');
        return null;
      }
    }

    return null;
  }

  Future<ReceiptOfdRu?> getReceiptFromLink(String url) async {
    try {
      String? receiptJsonLink = await getLinkToReceiptJson(url);
      if (receiptJsonLink != null) {
        var receiptJsonResponse = await http.get(Uri.parse(receiptJsonLink.replaceAll(' ', '')));
        Map<String, dynamic> receiptJson = jsonDecode(utf8.decode(receiptJsonResponse.bodyBytes));

        return ReceiptOfdRu.fromJson(receiptJson["Document"]);
      } else {
        log('Repository error: receipt json download link is null');
        return null;
      }
    } catch (e) {
      log('Repository error: receipt from url parsing failure');
      return null;
    }
  }

  Future<String?> getLinkToReceiptJson(String receiptLink) async {
    Uri? link = Uri.tryParse(receiptLink);
    if (link != null) {
      try {
        var response = await http.get(Uri.parse(receiptLink));

        if (response.statusCode == 200) {
          var document = parse(response.body);
          var elements = document.getElementsByClassName(receiptHtmlClassName);

          String? receiptJsonLink;
          if (elements.isNotEmpty) {
            receiptJsonLink = elements.first.attributes['href'];
          }

          return receiptJsonLink;
        } else {
          return null;
        }
      } catch(e) {
        log('Repository error: cannot get receipt download link from html page');
        return null;
      }
    } else {
      log('Repository error: link to ofd ru page is invalid');
      return null;
    }
  }
}