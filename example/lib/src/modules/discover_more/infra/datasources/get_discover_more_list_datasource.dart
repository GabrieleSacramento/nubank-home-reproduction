import '../../domain/entities/discover_more_entity.dart';

abstract class GetDiscoverMoreListDatasource {
  Future<List<DiscoverMoreEntity>> getDiscoverMoreList();
}
