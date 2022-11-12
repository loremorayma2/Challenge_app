import 'package:bloc/bloc.dart';
import 'package:challenge_app/domain/models/characterModel.dart';
import 'package:challenge_app/domain/repository/characterRepository.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.characterRepository) : super(HomeState());

  final CharacterRepository characterRepository;

  Future<void> getData() async {
    try {
      final getCharacters = await characterRepository.getCharacters();
      emit(state.copyWith(
          status: HomeStatus.success, characters: getCharacters));
    } catch (_) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
}
