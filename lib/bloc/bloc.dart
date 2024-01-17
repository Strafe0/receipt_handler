import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_handler/bloc/receipt_state.dart';
import 'package:receipt_handler/data/receipt/receipt_interface.dart';
import 'package:receipt_handler/data/repository/repository.dart';


class ReceiptCubit extends Cubit<ReceiptState> {
  ReceiptCubit(this._repository) : super(ReceiptState()) {
    getReceipt();
  }

  final Repository _repository;

  Future<void> getReceipt() async {
    emit(state.copyWith(status: ReceiptStatus.loading));

    try {
      final IReceipt? receipt = await _repository.getReceipt();
      if (receipt != null) {
        emit(state.copyWith(status: ReceiptStatus.success, receipt: receipt));
      } else {
        emit(state.copyWith(
          status: ReceiptStatus.failure, 
          receipt: EmptyReceipt(),
        ));
      }
    } catch (e) {
      emit(state.copyWith(status: ReceiptStatus.failure));
    }
  }
}