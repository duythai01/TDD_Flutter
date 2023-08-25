import 'package:dartz/dartz.dart';
import 'package:tdd/src/domain/entities/number_trivia.dart';

import '../../core/error/failures.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getCorrectNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
