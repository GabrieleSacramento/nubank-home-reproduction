import 'package:nubank_home_reproduction/src/modules/discover_more/domain/entities/discover_more_entity.dart';
import 'package:nubank_home_reproduction/src/modules/discover_more/domain/repositories/get_discover_more_list_repository.dart';
import 'package:nubank_home_reproduction/src/modules/discover_more/domain/use_cases/get_discover_more_list_use_case.dart';

class GetDiscoverMoreListUseCaseImpl implements GetDiscoverMoreListUseCase {
  final GetDiscoverMoreListRepository getDiscoverMoreListRepository;

  GetDiscoverMoreListUseCaseImpl({required this.getDiscoverMoreListRepository});
  @override
  Future<List<DiscoverMoreEntity>> call() async {
    final result = await getDiscoverMoreListRepository.getDiscoverMoreList();
    return result;
  }
}
