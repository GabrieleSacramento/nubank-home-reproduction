import 'package:mocktail/mocktail.dart';
import '../../../../../../example/lib/src/modules/balance/domain/entities/balance_entity.dart';
import '../../../../../../example/lib/src/modules/balance/domain/repositories/get_balance_repository.dart';
import '../../../../../../example/lib/src/modules/balance/infra/use_cases/get_balance_use_case_impl.dart';
import 'package:test/test.dart';

class BalanceRepositoryMock extends Mock implements GetBalanceRepository {}

void main() {
  group('GetBalanceUseCaseImpl', () {
    test('should return a balance', () async {
      final repository = BalanceRepositoryMock();
      final useCase = GetBalanceUseCaseImpl(
        getBalanceRepository: repository,
      );
      final balance = BalanceEntity(
        availableAmount: 100.0,
        currency: 'BLR',
      );

      when(() => repository.getBalance()).thenAnswer(
        (_) async => balance,
      );

      final result = await useCase();

      expect(result, balance);
    });
  });
}
