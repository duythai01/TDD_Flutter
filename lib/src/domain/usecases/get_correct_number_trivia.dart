import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd/src/core/error/failures.dart';
import 'package:tdd/src/core/usecase/usecase.dart';
import 'package:tdd/src/domain/entities/number_trivia.dart';

import '../repositories/number_trivia_repository.dart';

class GetCorrectNumberTriviaUC implements UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository repository;
  // Endpoint  api

  GetCorrectNumberTriviaUC({required this.repository});

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await repository.getCorrectNumberTrivia(params.number);
  }
}

class Params extends Equatable {
  final int number;

  const Params({required this.number});

  @override
  List<Object?> get props => [number];
}
