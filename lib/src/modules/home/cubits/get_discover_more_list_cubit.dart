import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nubank_home_reproduction/src/exceptions/exceptions.dart';
import 'package:nubank_home_reproduction/src/modules/discover_more/domain/entities/discover_more_entity.dart';
import 'package:nubank_home_reproduction/src/modules/discover_more/domain/entities/discover_more_error_entity.dart';
import 'package:nubank_home_reproduction/src/modules/discover_more/domain/use_cases/get_discover_more_list_use_case.dart';

part 'get_discover_more_list_state.dart';

class GetDiscoverMoreListCubit extends Cubit<GetDiscoverMoreListState> {
  final GetDiscoverMoreListUseCase getDiscoverMoreListUseCase;
  GetDiscoverMoreListCubit({required this.getDiscoverMoreListUseCase})
      : super(GetDiscoverMoreListInitial());

  Future<void> getDiscoverMoreList() async {
    emit(GetDiscoverMoreListLoading());
    try {
      final result = await getDiscoverMoreListUseCase();

      emit(GetDiscoverMoreListSuccess(discoverMoreList: result));
    } on FailedToGetDiscoverMoreListException catch (exception) {
      emit(GetDiscoverMoreDioError(error: exception.discoverMoreErrorEntity));
    } catch (e) {
      emit(GetDiscoverMoreListError());
      rethrow;
    }
  }
}
