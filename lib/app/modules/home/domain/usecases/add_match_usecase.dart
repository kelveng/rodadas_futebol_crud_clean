import 'package:dartz/dartz.dart';
import 'package:rodadas_futebol_crud/app/modules/home/domain/entities/match.dart';
import 'package:rodadas_futebol_crud/app/modules/home/domain/errors/failure.dart';
import 'package:rodadas_futebol_crud/app/modules/home/domain/repositories/match_repository.dart';

mixin AddMatchUseCase {
  Future<Either<Failure, Match>> call(Match match);
}

class AddMatchUseCaseImpl implements AddMatchUseCase {
  final MatchRepository repository;

  AddMatchUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, Match>> call(Match match) async {
    if (match.description == null || match.description.isEmpty)
      return Left(InvalidDescriptionError());

    if (match.games == null || match.games.isEmpty)
      return Left(InvalidGamesError());

    return repository.createMatch(match);
  }
}
