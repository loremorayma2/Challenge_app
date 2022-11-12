import 'package:challenge_app/data/characters.dart';
import 'package:challenge_app/domain/models/characterModel.dart';

class CharacterRepository {
  CharacterRepository({CharacterService? characterService})
      : _characterService = characterService ?? CharacterService();

  final CharacterService _characterService;

  Future<List<CharacterModel>> getCharacters() async {
    final List<CharacterModel> characters = [];
    try {
      final listCharacters = await _characterService.GetCharacters();
      for (final character in listCharacters) {
        characters.add(CharacterModel(character));
      }
      return characters;
    } catch (_) {
      throw Exception();
    }
  }
}
