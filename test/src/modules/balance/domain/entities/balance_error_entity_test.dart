import 'package:nubank_home_reproduction/src/modules/balance/domain/entities/balance_error_entity.dart';
import 'package:nubank_home_reproduction/src/shared/entities/user_message_entity.dart';

import 'package:test/test.dart';

void main() {
  group('Balance error entity test', () {
    test('Should return the correct balance entity', () {
      final balanceErrorEntity = BalanceErrorEntity(
          success: false,
          code: 'string',
          errorId: 'ACCOUNTS-001',
          errorCode: 0,
          detail: 'string',
          userMessage: UserMessageEntity(
              title: 'Erro de carregamento',
              text:
                  'Houve um erro para carregar o valor do seu dinheiro disponível, tente novamente..'));

      expect(balanceErrorEntity.success, false);
      expect(balanceErrorEntity.code, 'string');
      expect(balanceErrorEntity.errorId, 'ACCOUNTS-001');
      expect(balanceErrorEntity.errorCode, 0);
      expect(balanceErrorEntity.detail, 'string');
      expect(balanceErrorEntity.userMessage.title, 'Erro de carregamento');
      expect(balanceErrorEntity.userMessage.text,
          'Houve um erro para carregar o valor do seu dinheiro disponível, tente novamente..');
    });
  });
}
