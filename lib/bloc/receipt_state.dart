import 'package:equatable/equatable.dart';
import 'package:receipt_handler/data/receipt/receipt_interface.dart';

enum ReceiptStatus {initial, loading, success, failure}
enum ReceiptSource {sharedData, url}

class ReceiptState extends Equatable {
  ReceiptState({
    this.status = ReceiptStatus.initial,
    this.source = ReceiptSource.sharedData,
    IReceipt? receipt 
  }): receipt = receipt ?? EmptyReceipt();

  final ReceiptStatus status;
  final IReceipt receipt;
  final ReceiptSource source;
  
  @override
  List<Object?> get props => [status, receipt];

  ReceiptState copyWith({ReceiptStatus? status, IReceipt? receipt, ReceiptSource? source}) {
    return ReceiptState(
      status: status ?? this.status, 
      receipt: receipt ?? this.receipt,
      source: source ?? this.source,
    );
  }
}