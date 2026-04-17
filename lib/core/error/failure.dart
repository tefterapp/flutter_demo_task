import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

final class NetworkFailure extends Failure {
  const NetworkFailure({super.message = 'Network error'});
}

final class ParsingFailure extends Failure {
  const ParsingFailure({super.message = 'Parsing error'});
}

final class UnknownFailure extends Failure {
  const UnknownFailure({super.message = 'Unknown error'});
}
