import 'package:rodadas_futebol_crud/app/modules/home/domain/entities/match.dart';

abstract class MatchDataSource {
  Future<Match> create(Match match);
  Future<Match> delete(int id);
  Future<List<Match>> getAll();
  Future<Match> getMatch(int id);
  Future<Match> update(Match match);
}
