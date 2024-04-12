class BalanceEntity {
  final num availableAmount;
  final String currency;

  BalanceEntity({
    required this.availableAmount,
    required this.currency,
  });

  @override
  bool operator ==(covariant BalanceEntity other) {
    if (identical(this, other)) return true;

    return other.availableAmount == availableAmount &&
        other.currency == currency;
  }

  @override
  int get hashCode => availableAmount.hashCode ^ currency.hashCode;
}
