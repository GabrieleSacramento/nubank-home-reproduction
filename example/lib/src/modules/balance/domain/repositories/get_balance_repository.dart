import '../entities/balance_entity.dart';

abstract class GetBalanceRepository {
  Future<BalanceEntity> getBalance();
}
