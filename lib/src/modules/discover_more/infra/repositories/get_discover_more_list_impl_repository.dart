import 'package:nubank_home_reproduction/src/modules/discover_more/domain/entities/discover_more_entity.dart';
import 'package:nubank_home_reproduction/src/modules/discover_more/domain/repositories/get_discover_more_list_repository.dart';
import 'package:nubank_home_reproduction/src/modules/discover_more/infra/datasources/get_discover_more_list_datasource.dart';

class GetDiscoverMoreListRepositoryImpl
    implements GetDiscoverMoreListRepository {
  final GetDiscoverMoreListDatasource datasource;
  GetDiscoverMoreListRepositoryImpl({required this.datasource});
  @override
  Future<List<DiscoverMoreEntity>> getDiscoverMoreList() async {
    try {
      final result = await datasource.getDiscoverMoreList();

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
