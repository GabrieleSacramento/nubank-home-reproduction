import '../entities/balance_entity.dart';

abstract class GetBalanceUseCase {
  Future<BalanceEntity> call();
}
