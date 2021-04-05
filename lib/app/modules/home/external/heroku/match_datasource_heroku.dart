import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rodadas_futebol_crud/app/modules/home/domain/entities/match.dart';
import 'package:rodadas_futebol_crud/app/modules/home/domain/errors/failure.dart';
import 'package:rodadas_futebol_crud/app/modules/home/infra/datasources/match_datasource.dart';
import 'package:rodadas_futebol_crud/app/modules/home/infra/models/match_model.dart';

class MatchDataSourceHeroku implements MatchDataSource {
  final Dio dio;
  final String url = "https://bolaozaodevbackend.herokuapp.com/api/match";
  MatchDataSourceHeroku(this.dio);

  @override
  Future<Match> create(MatchModel match) async {
    final result = await dio.post(url, data: match.toJson());
    if (result.statusCode == 200) {
      return MatchModel.fromJson(json.decode(result.data));
    } else {
      final String message =
          result.data["message"] == null ? "" : result.data["message"];
      throw ServerError(message: message);
    }
  }

  @override
  Future<Match> delete(int id) async {
    final result = await dio.delete(
      "$url/$id",
    );
    if (result.statusCode == 200) {
      return MatchModel.fromJson(json.decode(result.data));
    } else {
      final String message =
          result.data["message"] == null ? "" : result.data["message"];
      throw ServerError(message: message);
    }
  }

  @override
  Future<List<Match>> getAll() async {
    final result = await dio.get(url);
    if (result.statusCode == 200) {
      return (result.data as List)
          .map((e) => MatchModel.fromJson(json.decode(e)))
          .toList();
    } else {
      final String message =
          result.data["message"] == null ? "" : result.data["message"];
      throw ServerError(message: message);
    }
  }

  @override
  Future<Match> getMatch(int id) async {
    final result = await dio.get(
      "$url/$id",
    );
    if (result.statusCode == 200) {
      return MatchModel.fromJson(json.decode(result.data));
    } else {
      final String message =
          result.data["message"] == null ? "" : result.data["message"];
      throw ServerError(message: message);
    }
  }

  @override
  Future<Match> update(MatchModel match) async {
    final result = await dio.put(
      "$url/${match.id}",
    );
    if (result.statusCode == 200) {
      return MatchModel.fromJson(json.decode(result.data));
    } else {
      final String message =
          result.data["message"] == null ? "" : result.data["message"];
      throw ServerError(message: message);
    }
  }
}
