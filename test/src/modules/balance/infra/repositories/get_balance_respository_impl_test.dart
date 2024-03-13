import 'package:mocktail/mocktail.dart';
import 'package:nubank_home_reproduction/src/modules/balance/domain/entities/balance_entity.dart';
import 'package:nubank_home_reproduction/src/modules/balance/infra/datasources/get_balance_datasource.dart';
import 'package:test/test.dart';

class GetBalanceDatasourceMock extends Mock implements GetBalanceDatasource {}

void main() {
  final datasource = GetBalanceDatasourceMock();

  group('GetBalanceRepositoryImpl', () {
    test('should return a balance', () async {
      final balance = BalanceEntity(
        availableAmount: 100.0,
        currency: 'BLR',
      );

      when(() => datasource.getBalance()).thenAnswer(
        (_) async => balance,
      );

      expect(balance, isA<BalanceEntity>());
    });
  });
}
