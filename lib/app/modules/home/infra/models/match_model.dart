import 'dart:convert';
import 'package:dartz/dartz_unsafe.dart';
import 'package:rodadas_futebol_crud/app/modules/home/domain/entities/match.dart';
import 'package:rodadas_futebol_crud/app/modules/home/domain/entities/status_match.dart';
import 'package:rodadas_futebol_crud/app/modules/home/infra/models/game_model.dart';
import 'package:rodadas_futebol_crud/app/modules/home/infra/models/team_model.dart';

class MatchModel extends Match {
  final int id;
  final String description;
  final StatusMatch status;
  final List<GameModel> games;

  MatchModel({
    this.id,
    this.description,
    this.status,
    this.games,
  }) : super(id, description, status, games);

  MatchModel copyWith({
    int id,
    String description,
    StatusMatch status,
    List<GameModel> games,
  }) {
    return MatchModel(
      id: id ?? this.id,
      description: description ?? this.description,
      status: status ?? this.status,
      games: games ?? this.games,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'status': status.index,
      'games': games?.map((x) => x.toMap())?.toList(),
    };
  }

  factory MatchModel.fromMap(Map<String, dynamic> map) {
    return MatchModel(
      id: map['id'],
      description: map['description'],
      status: StatusMatch.values.elementAt(map['status']),
      games:
          List<GameModel>.from(map['games']?.map((x) => GameModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MatchModel.fromJson(String source) =>
      MatchModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MatchModel(id: $id, description: $description, status: $status, games: $games)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MatchModel && other.id == id;
  }

  addGame(GameModel game) {
    if (this.games == null) this.games = <GameModel>[];
    this.games.add(game);
  }
}
