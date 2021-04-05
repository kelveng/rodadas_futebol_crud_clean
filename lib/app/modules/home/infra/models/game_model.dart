import 'dart:convert';

import 'package:rodadas_futebol_crud/app/modules/home/domain/entities/game.dart';
import 'package:rodadas_futebol_crud/app/modules/home/domain/utils/status_game.dart';
import 'package:rodadas_futebol_crud/app/modules/home/domain/entities/team.dart';

class GameModel extends Game {
  final Team masterTeam;
  final Team visitorTeam;
  final StatusGame status;
  final int masterGol;
  final int visitorGol;

  GameModel(
      {this.masterTeam,
      this.visitorTeam,
      this.status,
      this.masterGol,
      this.visitorGol})
      : super(masterTeam, visitorTeam, status, masterGol, visitorGol);

  Map<String, dynamic> toMap() {
    return {
      'masterTeam': masterTeam.toMap(),
      'visitorTeam': visitorTeam.toMap(),
      'status': status.index,
      'masterGol': masterGol,
      'visitorGol': visitorGol,
    };
  }

  factory GameModel.fromMap(Map<String, dynamic> map) {
    return GameModel(
      masterTeam: Team.fromMap(map['masterTeam']),
      visitorTeam: Team.fromMap(map['visitorTeam']),
      status: StatusGame.values.elementAt(map['status']),
      masterGol: map['masterGol'],
      visitorGol: map['visitorGol'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GameModel.fromJson(String source) =>
      GameModel.fromMap(json.decode(source));
}
