import 'package:nubank_home_reproduction/src/modules/discover_more/domain/entities/discover_more_entity.dart';

abstract class GetDiscoverMoreListUseCase {
  Future<List<DiscoverMoreEntity>> call();
}
