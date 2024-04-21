part of 'get_discover_more_list_cubit.dart';

class GetDiscoverMoreListState extends Equatable {
  const GetDiscoverMoreListState();

  @override
  List<Object> get props => [];
}

class GetDiscoverMoreListInitial extends GetDiscoverMoreListState {}

class GetDiscoverMoreListLoading extends GetDiscoverMoreListState {}

class GetDiscoverMoreListSuccess extends GetDiscoverMoreListState {
  final List<DiscoverMoreEntity> discoverMoreList;

  GetDiscoverMoreListSuccess({required this.discoverMoreList});

  @override
  List<Object> get props => [discoverMoreList];
}

class GetDiscoverMoreListError extends GetDiscoverMoreListState {}

class GetDiscoverMoreDioError extends GetDiscoverMoreListState {
  final DiscoverMoreErrorEntity error;

  GetDiscoverMoreDioError({required this.error});

  @override
  List<Object> get props => [error];
}
