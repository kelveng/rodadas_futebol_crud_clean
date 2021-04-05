import 'package:rodadas_futebol_crud/app/modules/home/domain/entities/match.dart';
import 'package:rodadas_futebol_crud/app/modules/home/infra/models/match_model.dart';

abstract class MatchDataSource {
  Future<Match> create(MatchModel match);
  Future<Match> delete(int id);
  Future<List<Match>> getAll();
  Future<Match> getMatch(int id);
  Future<Match> update(MatchModel match);
}
