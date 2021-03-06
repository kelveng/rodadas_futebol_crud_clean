import 'dart:convert';

import 'package:equatable/equatable.dart';

class Team extends Equatable {
  final int id;
  final String initial;
  final String urlLogo;
  final String name;

  Team(
    this.id,
    this.initial,
    this.urlLogo,
    this.name,
  );

  @override
  List<Object> get props => [id, initial];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'initial': initial,
      'urlLogo': urlLogo,
      'name': name,
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      map['id'],
      map['initial'],
      map['urlLogo'],
      map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Team.fromJson(String source) => Team.fromMap(json.decode(source));
}
