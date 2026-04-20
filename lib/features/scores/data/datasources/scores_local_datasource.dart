import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import '../../../../core/error/failure.dart';
import '../models/scores_payload_dto.dart';

// Kept as an abstract interface (rather than a `typedef`) so test doubles can
// implement it via `Mock` and we have a stable name for DI registration.
// ignore: one_member_abstracts
abstract interface class ScoresLocalDataSource {
  Future<Either<Failure, ScoresPayloadDto>> loadScores();
}

final class ScoresLocalDataSourceImpl implements ScoresLocalDataSource {
  ScoresLocalDataSourceImpl({
    AssetBundle? bundle,
    AssetBundle? assetBundle,
    this.assetPath = 'assets/mock/scores.json',
  }) : _assetBundle = bundle ?? assetBundle ?? rootBundle;

  final AssetBundle _assetBundle;
  final String assetPath;

  @override
  Future<Either<Failure, ScoresPayloadDto>> loadScores() async {
    try {
      final raw = await _assetBundle.loadString(assetPath);
      final decoded = json.decode(raw);
      if (decoded is! Map<String, dynamic>) {
        return const Left(
          ParsingFailure(message: 'Root JSON must be an object'),
        );
      }
      final dto = ScoresPayloadDto.fromJson(decoded);
      return Right(dto);
    } on Object catch (e) {
      return Left(ParsingFailure(message: e.toString()));
    }
  }
}
