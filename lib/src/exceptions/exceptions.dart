import 'package:nubank_home_reproduction/src/modules/balance/domain/entities/balance_error_entity.dart';

abstract class NubankException implements Exception {
  const NubankException();
}

class FailedToGetBalanceException extends NubankException {
  final BalanceErrorEntity balanceErrorEntity;
  const FailedToGetBalanceException({required this.balanceErrorEntity});
}
