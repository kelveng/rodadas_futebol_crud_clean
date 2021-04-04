import 'package:rodadas_futebol_crud/app/modules/home/domain/entities/team.dart';

import 'game.dart';
import 'status_match.dart';

class Match {
  final int id;
  final String description;
  final StatusMatch status;
  List<Game> games;

  Match(
    this.id,
    this.description,
    this.status,
    this.games,
  );

  bool isAddTeam(Team model) {
    for (var item in this.games) {
      if (item.masterTeam == model || item.visitorTeam == model) return false;
    }

    return true;
  }
}
