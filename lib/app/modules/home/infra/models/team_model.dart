import 'dart:convert';

import 'package:rodadas_futebol_crud/app/modules/home/domain/entities/team.dart';

class TeamModel extends Team {
  final int id;
  final String initial;
  final String urlLogo;
  final String name;

  TeamModel(this.id, this.initial, this.urlLogo, this.name)
      : super(id, initial, urlLogo, name);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'initial': initial,
      'urlLogo': urlLogo,
      'name': name,
    };
  }

  factory TeamModel.fromMap(Map<String, dynamic> map) {
    return TeamModel(
      map['id'],
      map['initial'],
      map['urlLogo'],
      map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TeamModel.fromJson(String source) =>
      TeamModel.fromMap(json.decode(source));
}
