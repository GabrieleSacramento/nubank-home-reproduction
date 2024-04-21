import 'dart:convert';

import '../../../../../../example/lib/src/modules/balance/data/mappers/balance_mapper.dart';

import 'package:test/test.dart';

void main() {
  var body =
      '{"success": "true", "data": {"currency": "BLR", "availableAmount": 1526}}';

  group('Balance entity test', () {
    test('Should return the correct balance entity', () {
      final balanceEntity =
          BalanceMapper.balanceFromJson(jsonDecode(body)['data']);

      expect(balanceEntity.availableAmount, 1526);
      expect(balanceEntity.currency, 'BLR');
    });
  });
}
