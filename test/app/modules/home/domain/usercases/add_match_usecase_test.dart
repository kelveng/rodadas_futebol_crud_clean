import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rodadas_futebol_crud/app/modules/home/domain/errors/failure.dart';
import 'package:rodadas_futebol_crud/app/modules/home/domain/repositories/match_repository.dart';
import 'package:rodadas_futebol_crud/app/modules/home/domain/usecases/add_match_usecase.dart';
import 'package:rodadas_futebol_crud/app/modules/home/infra/models/game_model.dart';
import 'package:rodadas_futebol_crud/app/modules/home/infra/models/match_model.dart';

class MatchRepositoryMock extends Mock implements MatchRepository {}

main() {
  final repository = MatchRepositoryMock();
  final addMatchUseCaseImpl = AddMatchUseCaseImpl(repository);
  test("deve retornar um Match.", () async {
    final games = [GameModel()];
    final matchModelSucess = MatchModel(description: "teste", games: games);
    when(repository.createMatch(any))
        .thenAnswer((_) async => Right(matchModelSucess));
    final result = await addMatchUseCaseImpl(matchModelSucess);

    expect(result.fold(id, id), isA<MatchModel>());
  });

  test(
      "deve retornar um InvalidDescriptionError em caso de descrição invalida.",
      () async {
    when(repository.createMatch(any))
        .thenAnswer((_) async => Right(MatchModel()));
    final result = await addMatchUseCaseImpl(MatchModel());

    expect(result.fold(id, id), isA<InvalidDescriptionError>());
  });

  test("deve retornar um InvalidGamesError em caso de lista de games inválida.",
      () async {
    final games = null;
    final matchModelError = MatchModel(description: "teste", games: games);
    when(repository.createMatch(any))
        .thenAnswer((_) async => Right(matchModelError));
    final result = await addMatchUseCaseImpl(matchModelError);

    expect(result.fold(id, id), isA<InvalidGamesError>());
  });

  test("deve retornar um InvalidGamesError em caso de lista de games vazia.",
      () async {
    final List<GameModel> games = [];
    final matchModelError = MatchModel(description: "teste", games: games);
    when(repository.createMatch(any))
        .thenAnswer((_) async => Right(matchModelError));
    final result = await addMatchUseCaseImpl(matchModelError);

    expect(result.fold(id, id), isA<InvalidGamesError>());
  });
}
