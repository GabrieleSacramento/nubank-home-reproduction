import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../../../example/lib/src/exceptions/exceptions.dart';
import '../../../../../../example/lib/src/modules/balance/domain/entities/balance_entity.dart';
import '../../../../../../example/lib/src/modules/balance/domain/entities/balance_error_entity.dart';
import '../../../../../../example/lib/src/modules/balance/external/datasources/balance_datasource_impl.dart';
import '../../../../../../example/lib/src/modules/balance/infra/datasources/get_balance_datasource.dart';
import '../../../../../../example/lib/src/shared/entities/user_message_entity.dart';
import 'package:test/test.dart';

import '../../../../../fixtures/balance_fixture.dart';

class DioMock extends Mock implements Dio {}

void main() {
  Dio client = DioMock();

  GetBalanceDatasource datasource = GetBalanceDatasourceImpl(dio: client);

  setUpAll(() {
    registerFallbackValue(Options());
    registerFallbackValue(StackTrace.empty);
  });

  group('description', () {
    test(
      'Shoul return a Balance entity when the call to datasource is successful',
      () async {
        final data = Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 200,
          data: balanceMock,
        );
        when(() => client.get(
                'https://private-ae1f4c-nubankapimock.apiary-mock.com/nubank/accounts/balance'))
            .thenAnswer((_) async => data);
        final result = await datasource.getBalance();
        expect(result, isA<BalanceEntity>());
      },
    );
    test(
      'Should return a exception when api return a status code 400',
      () async {
        final exception = DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 400,
            data: BalanceErrorEntity(
              success: false,
              code: 'string',
              errorId: 'ACCOUNTS-001',
              errorCode: 0,
              detail: 'string',
              userMessage: UserMessageEntity(
                  title: 'Erro de carregamento',
                  text:
                      'Houve um erro para carregar o valor do seu dinheiro disponível, tente novamente..'),
            ),
          ),
        );

        when(
          () => client.get(
            'https://private-ae1f4c-nubankapimock.apiary-mock.com/nubank/accounts/balance',
            options: any(named: 'options'),
          ),
        ).thenThrow(exception);

        await expectLater(
          () => datasource.getBalance(),
          throwsA(isA<FailedToGetBalanceException>()),
        );
      },
    );

    test(
      'Should return a generic error when api return a status code different from 400',
      () async {
        var exception = Exception('internal error');

        when(
          () => client.get(
            'https://private-ae1f4c-nubankapimock.apiary-mock.com/nubank/accounts/balance',
            options: any(named: 'options'),
          ),
        ).thenThrow(exception);

        await expectLater(
          () => datasource.getBalance(),
          throwsA(isA<Exception>()),
        );
      },
    );
  });
}
