part of 'home_cubit.dart';

enum HomeStatus { loading, success, error }

class HomeState {
  HomeState({
    this.status = HomeStatus.loading,
    this.characters = const <CharacterModel>[],
  });

  final HomeStatus status;
  final List<CharacterModel> characters;

  HomeState copyWith({
    HomeStatus? status,
    List<CharacterModel>? characters,
  }) {
    return HomeState(
        status: status ?? this.status,
        characters: characters ?? this.characters);
  }
}

/*
fecth
1: dentro de la capa de data es como el servicio que interactura con la API
2: el repositorio usa el servicio
3: el cubir usa el repositorio

manejando los estados del caso 1 (cargando,exitoso,error)


*/ 