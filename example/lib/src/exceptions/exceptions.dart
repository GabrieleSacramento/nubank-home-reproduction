import '../modules/balance/domain/entities/balance_error_entity.dart';
import '../modules/discover_more/domain/entities/discover_more_error_entity.dart';

abstract class NubankException implements Exception {
  const NubankException();
}

class FailedToGetBalanceException extends NubankException {
  final BalanceErrorEntity balanceErrorEntity;
  const FailedToGetBalanceException({required this.balanceErrorEntity});
}

class FailedToGetDiscoverMoreListException extends NubankException {
  final DiscoverMoreErrorEntity discoverMoreErrorEntity;
  const FailedToGetDiscoverMoreListException(
      {required this.discoverMoreErrorEntity});
}
