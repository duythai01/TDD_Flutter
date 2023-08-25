import 'package:tdd/src/domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {
  const NumberTriviaModel(
      {required String text,
      required int number,
      required bool found,
      required String type})
      : super(text: text, number: number, found: found, type: type);
}
