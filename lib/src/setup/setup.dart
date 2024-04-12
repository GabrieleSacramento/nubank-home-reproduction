import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nubank_home_reproduction/src/modules/balance/domain/repositories/get_balance_repository.dart';
import 'package:nubank_home_reproduction/src/modules/balance/domain/use_cases/get_balance_use_case.dart';
import 'package:nubank_home_reproduction/src/modules/balance/external/datasources/balance_datasource_impl.dart';
import 'package:nubank_home_reproduction/src/modules/balance/infra/datasources/get_balance_datasource.dart';
import 'package:nubank_home_reproduction/src/modules/balance/infra/repositories/get_balance_respository_impl.dart';
import 'package:nubank_home_reproduction/src/modules/balance/infra/use_cases/get_balance_use_case_impl.dart';
import 'package:nubank_home_reproduction/src/modules/discover_more/domain/repositories/get_discover_more_list_repository.dart';
import 'package:nubank_home_reproduction/src/modules/discover_more/domain/use_cases/get_discover_more_list_use_case.dart';
import 'package:nubank_home_reproduction/src/modules/discover_more/external/datasources/get_discover_more_list_datasource_impl.dart';
import 'package:nubank_home_reproduction/src/modules/discover_more/infra/datasources/get_discover_more_list_datasource.dart';
import 'package:nubank_home_reproduction/src/modules/discover_more/infra/repositories/get_discover_more_list_impl_repository.dart';
import 'package:nubank_home_reproduction/src/modules/discover_more/infra/use_cases/get_discover_more_list_use_case_impl.dart';
import 'package:nubank_home_reproduction/src/modules/home/cubits/get_balance_cubit.dart';
import 'package:nubank_home_reproduction/src/modules/home/cubits/get_discover_more_list_cubit.dart';

Dio dio = Dio();

final setup = GetIt.instance;

Future<void> registerDependencies() async {
  _setupStrings();
  _setupDatasources();
  _setupRepositories();
  _setupUseCases();
  _setupCubits();
}

_setupStrings() async {}

_setupDatasources() async {
  setup.registerLazySingleton<GetBalanceDatasource>(
    () => GetBalanceDatasourceImpl(
      dio: dio,
    ),
  );

  setup.registerLazySingleton<GetDiscoverMoreListDatasource>(
    () => GetDiscoverMoreListDatasourceImpl(
      dio: dio,
    ),
  );
}

_setupRepositories() async {
  setup.registerLazySingleton<GetBalanceRepository>(
    () => GetBalanceRepositoryImpl(
      datasource: setup<GetBalanceDatasource>(),
    ),
  );

  setup.registerLazySingleton<GetDiscoverMoreListRepository>(
    () => GetDiscoverMoreListRepositoryImpl(
      datasource: setup<GetDiscoverMoreListDatasource>(),
    ),
  );
}

_setupUseCases() async {
  setup.registerFactory<GetBalanceUseCase>(
    () => GetBalanceUseCaseImpl(
      getBalanceRepository: setup<GetBalanceRepository>(),
    ),
  );

  setup.registerFactory<GetDiscoverMoreListUseCase>(
    () => GetDiscoverMoreListUseCaseImpl(
      getDiscoverMoreListRepository: setup<GetDiscoverMoreListRepository>(),
    ),
  );
}

_setupCubits() async {
  setup.registerFactory<GetBalanceCubit>(
    () => GetBalanceCubit(
      getBalanceUseCase: setup<GetBalanceUseCase>(),
    ),
  );

  setup.registerFactory<GetDiscoverMoreListCubit>(
    () => GetDiscoverMoreListCubit(
      getDiscoverMoreListUseCase: setup<GetDiscoverMoreListUseCase>(),
    ),
  );
}
