import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';
import '../entities/number_trivia.dart';
import '../repositories/number_trivia_repository.dart';

class GetRandomNumberTriviaUC implements UseCase<NumberTrivia, NoParam> {
  final NumberTriviaRepository repository;
  // Endpoint  api

  GetRandomNumberTriviaUC({required this.repository});

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParam params) async {
    return await repository.getRandomNumberTrivia();
  }
}

class NoParam extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
