import 'package:equatable/equatable.dart';
import 'package:receipt_handler/data/receipt/receipt_interface.dart';

enum ReceiptStatus {initial, loading, success, failure}

class ReceiptState extends Equatable {
  ReceiptState({
    this.status = ReceiptStatus.initial,
    IReceipt? receipt 
  }): receipt = receipt ?? EmptyReceipt();

  final ReceiptStatus status;
  final IReceipt receipt;
  
  @override
  List<Object?> get props => [status, receipt];

  ReceiptState copyWith({ReceiptStatus? status, IReceipt? receipt}) {
    return ReceiptState(
      status: status ?? this.status, 
      receipt: receipt ?? this.receipt,
    );
  }
}