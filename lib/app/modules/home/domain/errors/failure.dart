class Failure implements Exception {}

class InvalidDescriptionError extends Failure {}

class InvalidGamesError extends Failure {}

class ServerError extends Failure {
  final String message;
  ServerError({this.message});
}
