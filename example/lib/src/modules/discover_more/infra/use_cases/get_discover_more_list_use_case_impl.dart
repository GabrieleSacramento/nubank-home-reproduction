import '../../domain/entities/discover_more_entity.dart';
import '../../domain/repositories/get_discover_more_list_repository.dart';
import '../../domain/use_cases/get_discover_more_list_use_case.dart';

class GetDiscoverMoreListUseCaseImpl implements GetDiscoverMoreListUseCase {
  final GetDiscoverMoreListRepository getDiscoverMoreListRepository;

  GetDiscoverMoreListUseCaseImpl({required this.getDiscoverMoreListRepository});
  @override
  Future<List<DiscoverMoreEntity>> call() async {
    final result = await getDiscoverMoreListRepository.getDiscoverMoreList();
    return result;
  }
}
