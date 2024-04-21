import '../../domain/entities/balance_entity.dart';
import '../../domain/repositories/get_balance_repository.dart';
import '../datasources/get_balance_datasource.dart';

class GetBalanceRepositoryImpl implements GetBalanceRepository {
  final GetBalanceDatasource datasource;

  GetBalanceRepositoryImpl({required this.datasource});

  @override
  Future<BalanceEntity> getBalance() async {
    try {
      final result = await datasource.getBalance();

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
