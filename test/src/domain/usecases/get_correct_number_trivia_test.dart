import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd/src/domain/entities/number_trivia.dart';
import 'package:tdd/src/domain/repositories/number_trivia_repository.dart';
import 'package:tdd/src/domain/usecases/get_correct_number_trivia.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetCorrectNumberTriviaUC usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;
  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetCorrectNumberTriviaUC(repository: mockNumberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia =
      const NumberTrivia(text: "test", number: 1, found: true, type: "type");

  test('Get trivia from repository', () async {
    when(MockNumberTriviaRepository().getCorrectNumberTrivia(tNumber))
        .thenAnswer((_) async => Right(tNumberTrivia));

    final result = await GetCorrectNumberTriviaUC(
        repository: MockNumberTriviaRepository())(Params(number: tNumber));

    expect(result, Right(tNumberTrivia));
    verify(MockNumberTriviaRepository().getCorrectNumberTrivia(20));
  });
}
