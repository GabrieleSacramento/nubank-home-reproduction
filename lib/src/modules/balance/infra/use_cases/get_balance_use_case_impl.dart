import 'package:nubank_home_reproduction/src/modules/balance/domain/entities/balance_entity.dart';
import 'package:nubank_home_reproduction/src/modules/balance/domain/repositories/get_balance_repository.dart';
import 'package:nubank_home_reproduction/src/modules/balance/domain/use_cases/get_balance_use_case.dart';

class GetBalanceUseCaseImpl implements GetBalanceUseCase {
  final GetBalanceRepository getBalanceRepository;

  GetBalanceUseCaseImpl({required this.getBalanceRepository});

  @override
  Future<BalanceEntity> call() async {
    final result = await getBalanceRepository.getBalance();
    return result;
  }
}
