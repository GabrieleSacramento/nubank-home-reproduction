import 'package:nubank_home_reproduction/src/modules/balance/domain/entities/balance_entity.dart';

abstract class GetBalanceRepository {
  Future<BalanceEntity> getBalance();
}
