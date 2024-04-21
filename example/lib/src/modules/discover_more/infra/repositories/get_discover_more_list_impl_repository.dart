import '../../domain/entities/discover_more_entity.dart';
import '../../domain/repositories/get_discover_more_list_repository.dart';
import '../datasources/get_discover_more_list_datasource.dart';

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
