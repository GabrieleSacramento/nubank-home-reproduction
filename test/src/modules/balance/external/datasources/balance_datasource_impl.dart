import 'dart:io';

import 'package:nubank_home_reproduction/src/exceptions/exceptions.dart';
import 'package:nubank_home_reproduction/src/modules/balance/data/mappers/balance_mapper.dart';
import 'package:nubank_home_reproduction/src/modules/balance/domain/entities/balance_entity.dart';
import 'package:nubank_home_reproduction/src/modules/balance/infra/datasources/get_balance_datasource.dart';
import 'package:dio/dio.dart';
import 'package:nubank_home_reproduction/src/utils/route_api.dart';

class GetBalanceDatasourceImpl implements GetBalanceDatasource {
  final Dio dio;

  GetBalanceDatasourceImpl({required this.dio});
  @override
  Future<BalanceEntity> getBalance() async {
    try {
      var result = await dio.get(RouteApi.routeGetBalance);

      return BalanceMapper.balanceFromJson(result.data['data']);
    } on DioException catch (exception, stackTrace) {
      if (exception.response?.statusCode == HttpStatus.badRequest) {
        Error.throwWithStackTrace(
          FailedToGetBalanceException(
              balanceErrorEntity: exception.response?.data),
          stackTrace,
        );
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
