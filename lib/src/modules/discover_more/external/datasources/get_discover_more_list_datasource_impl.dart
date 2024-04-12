import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nubank_home_reproduction/src/exceptions/exceptions.dart';
import 'package:nubank_home_reproduction/src/modules/discover_more/data/mappers/discover_more_mapper.dart';
import 'package:nubank_home_reproduction/src/modules/discover_more/domain/entities/discover_more_entity.dart';
import 'package:nubank_home_reproduction/src/modules/discover_more/infra/datasources/get_discover_more_list_datasource.dart';
import 'package:nubank_home_reproduction/src/utils/route_api.dart';

class GetDiscoverMoreListDatasourceImpl
    implements GetDiscoverMoreListDatasource {
  final Dio dio;

  GetDiscoverMoreListDatasourceImpl({required this.dio});

  @override
  Future<List<DiscoverMoreEntity>> getDiscoverMoreList() async {
    try {
      var response = await dio.get(
        RouteApi.routeDiscoverMore,
      );

      List<DiscoverMoreEntity> discoverMoreList =
          (response.data['data']['discoverMore'] as List)
              .map((item) => DiscoverMoreMapper.discoverMoreFromJson(
                  item as Map<String, dynamic>))
              .toList();

      return discoverMoreList;
    } on DioException catch (exception, stackTrace) {
      if (exception.response?.statusCode == HttpStatus.badRequest) {
        Error.throwWithStackTrace(
          FailedToGetDiscoverMoreListException(
              discoverMoreErrorEntity: exception.response?.data),
          stackTrace,
        );
      }

      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
