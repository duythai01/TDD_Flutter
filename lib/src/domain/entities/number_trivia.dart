import 'package:equatable/equatable.dart';

class NumberTrivia extends Equatable {
  final String text;
  final int number;
  final bool found;
  final String type;

  const NumberTrivia(
      {required this.text,
      required this.number,
      required this.found,
      required this.type});

  NumberTrivia copyWith({
    String? text,
    int? number,
    bool? found,
    String? type,
  }) =>
      NumberTrivia(
          text: text ?? this.text,
          number: number ?? this.number,
          found: found ?? this.found,
          type: type ?? this.type);

  @override
  List<Object?> get props => [text, number];
}
