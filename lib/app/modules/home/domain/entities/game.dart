import 'status_game.dart';
import 'team.dart';

class Game {
  Team masterTeam;
  Team visitorTeam;
  StatusGame status;
  int masterGol;
  int visitorGol;

  Game(this.masterTeam, this.visitorTeam, this.status, this.masterGol,
      this.visitorGol);

  Team winnerTeam() {
    if (masterGol > visitorGol) return masterTeam;
    if (masterGol < visitorGol) return visitorTeam;

    return null;
  }
}
