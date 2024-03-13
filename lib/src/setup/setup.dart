import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nubank_home_reproduction/src/modules/balance/domain/repositories/get_balance_repository.dart';
import 'package:nubank_home_reproduction/src/modules/balance/domain/use_cases/get_balance_use_case.dart';
import 'package:nubank_home_reproduction/src/modules/balance/external/datasources/balance_datasource_impl.dart';
import 'package:nubank_home_reproduction/src/modules/balance/infra/datasources/get_balance_datasource.dart';
import 'package:nubank_home_reproduction/src/modules/balance/infra/repositories/get_balance_respository_impl.dart';
import 'package:nubank_home_reproduction/src/modules/balance/infra/use_cases/get_balance_use_case_impl.dart';
import 'package:nubank_home_reproduction/src/modules/home/cubits/get_balance_cubit.dart';

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
  setup.registerFactory<GetBalanceDatasource>(
    () => GetBalanceDatasourceImpl(
      dio: dio,
    ),
  );
}

_setupRepositories() async {
  setup.registerFactory<GetBalanceRepository>(
    () => GetBalanceRepositoryImpl(
      datasource: setup<GetBalanceDatasource>(),
    ),
  );
}

_setupUseCases() async {
  setup.registerFactory<GetBalanceUseCase>(
    () => GetBalanceUseCaseImpl(
      getBalanceRepository: setup<GetBalanceRepository>(),
    ),
  );
}

_setupCubits() async {
  setup.registerFactory<GetBalanceCubit>(
    () => GetBalanceCubit(
      getBalanceUseCase: setup<GetBalanceUseCase>(),
    ),
  );
}
