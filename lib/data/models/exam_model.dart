import 'dart:convert';


class Question {
  final String question;
  final List<String> answers;
  final String correctAnswer;
  Question({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  Question copyWith({
    String? question,
    List<String>? answers,
    String? correctAnswer,
  }) {
    return Question(
      question: question ?? this.question,
      answers: answers ?? this.answers,
      correctAnswer: correctAnswer ?? this.correctAnswer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'answer_1': answers[0],
      'answer_2': answers[1],
      'answer_3': answers[2],
      'answer_4': answers[4],
      'correct_answer': correctAnswer,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      question: map['question'] ?? '',
      answers: [
        map['answer_1'] ?? '',
        map['answer_2'] ?? '',
        map['answer_3'] ?? '',
        map['answer_4'] ?? '',
      ],
      correctAnswer: map['correct_answer'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source));

  @override
  String toString() =>
      'Questions(question: $question, answers: $answers, correctAnswer: $correctAnswer)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Question &&
        other.question == question &&
        other.answers == answers &&
        other.correctAnswer == correctAnswer;
  }

  @override
  int get hashCode =>
      question.hashCode ^ answers.hashCode ^ correctAnswer.hashCode;
}
