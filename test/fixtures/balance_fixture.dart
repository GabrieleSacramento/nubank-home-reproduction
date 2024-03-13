import 'package:nubank_home_reproduction/src/modules/balance/data/mappers/balance_mapper.dart';
import 'package:nubank_home_reproduction/src/modules/balance/domain/entities/balance_entity.dart';

Map<String, dynamic> balanceMock = {
  "success": "true",
  "data": {"currency": "BLR", "availableAmount": 1526}
};
BalanceEntity balanceEntity =
    BalanceMapper.balanceFromJson(balanceMock['data']);
