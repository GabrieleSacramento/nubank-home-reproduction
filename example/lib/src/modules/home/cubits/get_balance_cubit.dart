import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../exceptions/exceptions.dart';
import '../../balance/domain/entities/balance_entity.dart';
import '../../balance/domain/entities/balance_error_entity.dart';
import '../../balance/domain/use_cases/get_balance_use_case.dart';

part 'get_balance_state.dart';

class GetBalanceCubit extends Cubit<GetBalanceState> {
  final GetBalanceUseCase getBalanceUseCase;
  GetBalanceCubit({required this.getBalanceUseCase})
      : super(GetBalanceInitial());

  Future<void> getBalance() async {
    emit(GetBalanceLoading());
    try {
      final result = await getBalanceUseCase();

      emit(GetBalanceSuccess(balance: result));
    } on FailedToGetBalanceException catch (exception) {
      emit(GetBalanceDioError(error: exception.balanceErrorEntity));
    } catch (e) {
      emit(GetBalanceError());
      rethrow;
    }
  }
}
