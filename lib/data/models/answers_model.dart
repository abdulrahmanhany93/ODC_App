import 'dart:convert';

class Answers {
  final String answer1;
  final String answer2;
  final String answer3;
  final String answer4;
  Answers({
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.answer4,
  });

  Answers copyWith({
    String? answer1,
    String? answer2,
    String? answer3,
    String? answer4,
  }) {
    return Answers(
      answer1: answer1 ?? this.answer1,
      answer2: answer2 ?? this.answer2,
      answer3: answer3 ?? this.answer3,
      answer4: answer4 ?? this.answer4,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'answer_1': answer1,
      'answer_2': answer2,
      'answer_3': answer3,
      'answer_4': answer4,
    };
  }

  factory Answers.fromMap(Map<String, dynamic> map) {
    return Answers(
      answer1: map['answer_1'] ?? '',
      answer2: map['answer_2'] ?? '',
      answer3: map['answer_3'] ?? '',
      answer4: map['answer_4'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Answers.fromJson(String source) =>
      Answers.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Answers(answer1: $answer1, answer2: $answer2, answer3: $answer3, answer4: $answer4)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Answers &&
        other.answer1 == answer1 &&
        other.answer2 == answer2 &&
        other.answer3 == answer3 &&
        other.answer4 == answer4;
  }

  @override
  int get hashCode {
    return answer1.hashCode ^
        answer2.hashCode ^
        answer3.hashCode ^
        answer4.hashCode;
  }
}
