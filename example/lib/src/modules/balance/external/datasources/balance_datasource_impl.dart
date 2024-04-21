import 'dart:io';

import '../../../../exceptions/exceptions.dart';
import '../../data/mappers/balance_mapper.dart';
import '../../domain/entities/balance_entity.dart';
import '../../infra/datasources/get_balance_datasource.dart';
import 'package:dio/dio.dart';
import '../../../../utils/route_api.dart';

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
