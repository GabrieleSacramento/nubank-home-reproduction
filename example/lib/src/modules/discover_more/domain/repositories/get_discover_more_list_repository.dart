import '../entities/discover_more_entity.dart';

abstract class GetDiscoverMoreListRepository {
  Future<List<DiscoverMoreEntity>> getDiscoverMoreList();
}
