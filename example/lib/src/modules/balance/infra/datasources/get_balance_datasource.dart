import '../../domain/entities/balance_entity.dart';

abstract class GetBalanceDatasource {
  Future<BalanceEntity> getBalance();
}
