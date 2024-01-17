import 'dart:convert';
import 'dart:developer';

import 'package:receipt_handler/data/data_providers/shared_data_provider.dart';
import 'package:receipt_handler/data/receipt/receipt_fns/receipt_fns.dart';

class Repository {
  final SharedDataProvider _dataProvider = SharedDataProvider();

  Future<ReceiptFns?> getReceipt() async {
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
}