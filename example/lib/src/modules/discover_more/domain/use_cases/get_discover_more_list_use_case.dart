import '../entities/discover_more_entity.dart';

abstract class GetDiscoverMoreListUseCase {
  Future<List<DiscoverMoreEntity>> call();
}
