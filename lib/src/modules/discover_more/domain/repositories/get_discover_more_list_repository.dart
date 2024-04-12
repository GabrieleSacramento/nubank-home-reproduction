import 'package:nubank_home_reproduction/src/modules/discover_more/domain/entities/discover_more_entity.dart';

abstract class GetDiscoverMoreListRepository {
  Future<List<DiscoverMoreEntity>> getDiscoverMoreList();
}
