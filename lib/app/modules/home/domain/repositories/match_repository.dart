import 'package:dartz/dartz.dart';
import 'package:rodadas_futebol_crud/app/modules/home/domain/entities/match.dart';
import 'package:rodadas_futebol_crud/app/modules/home/domain/errors/failure.dart';

abstract class MatchRepository {
  Future<Either<Failure, List<Match>>> getAllMatchs();
  Future<Either<Failure, Match>> getMatch(int id);
  Future<Either<Failure, Match>> updateMatch(Match match);
  Future<Either<Failure, Match>> deleteMatch(int id);
  Future<Either<Failure, Match>> createMatch(Match match);
}
