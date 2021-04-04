import 'game.dart';
import 'status_match.dart';

class Match {
  final int id;
  final String description;
  final StatusMatch status;
  final List<Game> games;

  Match(
    this.id,
    this.description,
    this.status,
    this.games,
  );
}
