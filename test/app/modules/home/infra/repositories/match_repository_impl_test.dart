import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rodadas_futebol_crud/app/modules/home/domain/errors/failure.dart';
import 'package:rodadas_futebol_crud/app/modules/home/infra/datasources/match_datasource.dart';
import 'package:rodadas_futebol_crud/app/modules/home/infra/models/game_model.dart';
import 'package:rodadas_futebol_crud/app/modules/home/infra/models/match_model.dart';
import 'package:rodadas_futebol_crud/app/modules/home/domain/entities/match.dart';
import 'package:rodadas_futebol_crud/app/modules/home/infra/repositories/match_repository_impl.dart';

class MatchDataSourceMock extends Mock implements MatchDataSource {}

main() {
  final dataSource = MatchDataSourceMock();
  final repository = MatchRepositoryImpl(dataSource);

  group("createMatch", () {
    test("deve retornar um Match caso de sucesso", () async {
      final games = [GameModel()];
      final int id = 1;
      final Match matchModelSucess =
          MatchModel(description: "teste", games: games);

      when(dataSource.create(matchModelSucess)).thenAnswer(
          (realInvocation) async =>
              MatchModel(id: id, description: "teste", games: games));

      final result = await repository.createMatch(matchModelSucess);

      expect(result.fold((l) => null, (r) => r).id, id);
    });

    test("deve retornar um ServerError em caso de falha", () async {
      final games = [GameModel()];
      final Match matchModelSucess =
          MatchModel(description: "teste", games: games);

      when(dataSource.create(matchModelSucess))
          .thenThrow((realInvocation) async => ServerError());

      final result = await repository.createMatch(matchModelSucess);

      expect(result.fold((l) => l, (r) => null), isA<ServerError>());
    });
  });

  group("updateMatch", () {
    test("deve retornar um Match caso de sucesso", () async {
      final games = [GameModel()];
      final int id = 1;
      final Match matchModelSucess =
          MatchModel(description: "teste1", games: games);

      when(dataSource.update(matchModelSucess)).thenAnswer(
          (realInvocation) async =>
              MatchModel(id: id, description: "teste1", games: games));

      final result = await repository.updateMatch(matchModelSucess);

      expect(result.fold((l) => null, (r) => r).id, id);
    });

    test("deve retornar um ServerError em caso de falha", () async {
      final games = [GameModel()];
      final Match matchModelSucess =
          MatchModel(description: "teste", games: games);

      when(dataSource.update(matchModelSucess))
          .thenThrow((_) async => ServerError());

      final result = await repository.updateMatch(matchModelSucess);

      expect(result.fold((l) => l, (r) => null), isA<ServerError>());
    });
  });

  group("deleteMatch", () {
    test("deve retornar um Match.", () async {
      final games = [GameModel()];
      final int id = 1;

      when(dataSource.delete(id)).thenAnswer((realInvocation) async =>
          MatchModel(id: id, description: "teste1", games: games));

      final result = await repository.deleteMatch(id);

      expect(result.fold((l) => null, (r) => r).id, id);
    });

    test("deve retornar um ServerError em caso de falha", () async {
      final int id = 1;

      when(dataSource.delete(id)).thenThrow((_) async => ServerError());

      final result = await repository.deleteMatch(id);

      expect(result.fold((l) => l, (r) => null), isA<ServerError>());
    });
  });

  group("getAllMatchs", () {
    test("deve retornar um lista de Matchs.", () async {
      when(dataSource.getAll()).thenAnswer((realInvocation) async => <Match>[]);

      final result = await repository.getAllMatchs();

      expect(result.fold((l) => null, (r) => r), isA<List<Match>>());
    });

    test("deve retornar um ServerError em caso de falha", () async {
      final int id = 1;

      when(dataSource.getAll()).thenThrow((_) async => ServerError());

      final result = await repository.getAllMatchs();

      expect(result.fold((l) => l, (r) => null), isA<ServerError>());
    });
  });

  group("getMatch", () {
    test("deve retornar um Matchs.", () async {
      int id = 1;
      when(dataSource.getMatch(id)).thenAnswer(
          (realInvocation) async => MatchModel(id: id, description: "teste"));

      final result = await repository.getMatch(id);

      expect(result.fold((l) => null, (r) => r).id, id);
    });

    test("deve retornar um ServerError em caso de falha", () async {
      final int id = 1;

      when(dataSource.getMatch(id)).thenThrow((_) async => ServerError());

      final result = await repository.getMatch(id);

      expect(result.fold((l) => l, (r) => null), isA<ServerError>());
    });
  });
}
