import 'package:rodadas_futebol_crud/app/modules/home/domain/errors/failure.dart';
import 'package:rodadas_futebol_crud/app/modules/home/domain/entities/match.dart';
import 'package:dartz/dartz.dart';
import 'package:rodadas_futebol_crud/app/modules/home/domain/repositories/match_repository.dart';
import 'package:rodadas_futebol_crud/app/modules/home/infra/datasources/match_datasource.dart';

class MatchRepositoryImpl implements MatchRepository {
  final MatchDataSource dataSource;

  MatchRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, Match>> createMatch(Match match) async {
    try {
      final Match result = await dataSource.create(match);
      return Right(result);
    } catch (e) {
      return Left(ServerError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Match>> deleteMatch(int id) async {
    try {
      final Match result = await dataSource.delete(id);
      return Right(result);
    } catch (e) {
      return Left(ServerError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Match>>> getAllMatchs() async {
    try {
      final List<Match> result = await dataSource.getAll();
      return Right(result);
    } catch (e) {
      return Left(ServerError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Match>> getMatch(int id) async {
    try {
      final Match result = await dataSource.getMatch(id);
      return Right(result);
    } catch (e) {
      return Left(ServerError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Match>> updateMatch(Match match) async {
    try {
      final Match result = await dataSource.update(match);
      return Right(result);
    } catch (e) {
      return Left(ServerError(message: e.toString()));
    }
  }
}
