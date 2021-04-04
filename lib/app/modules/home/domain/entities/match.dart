import 'status_match.dart';

class Match {
  final int id;
  final String description;
  final StatusMatch status;

  Match(this.id, this.description, {this.status = StatusMatch.none});
}
