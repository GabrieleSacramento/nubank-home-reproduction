part of 'get_balance_cubit.dart';

class GetBalanceState extends Equatable {
  const GetBalanceState();

  @override
  List<Object> get props => [];
}

class GetBalanceInitial extends GetBalanceState {}

class GetBalanceLoading extends GetBalanceState {}

class GetBalanceSuccess extends GetBalanceState {
  final BalanceEntity balance;

  GetBalanceSuccess({required this.balance});

  @override
  List<Object> get props => [balance];
}

class GetBalanceDioError extends GetBalanceState {
  final BalanceErrorEntity error;

  GetBalanceDioError({required this.error});

  @override
  List<Object> get props => [error];
}

class GetBalanceError extends GetBalanceState {}
