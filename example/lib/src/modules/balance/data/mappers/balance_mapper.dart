import '../../domain/entities/balance_entity.dart';

abstract class BalanceMapper {
  static BalanceEntity balanceFromJson(Map<String, dynamic> json) {
    return BalanceEntity(
      availableAmount: json['availableAmount'] ?? 0,
      currency: json['currency'] ?? '',
    );
  }
}
