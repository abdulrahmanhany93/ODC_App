import 'dart:convert';

class ArgsModel {
  final dynamic data1;
  final dynamic data2;
  ArgsModel({
    required this.data1,
    required this.data2,
  });

  ArgsModel copyWith({
    dynamic data1,
    dynamic data2,
  }) {
    return ArgsModel(
      data1: data1 ?? this.data1,
      data2: data2 ?? this.data2,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data1': data1,
      'data2': data2,
    };
  }

  factory ArgsModel.fromMap(Map<String, dynamic> map) {
    return ArgsModel(
      data1: map['data1'],
      data2: map['data2'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ArgsModel.fromJson(String source) => ArgsModel.fromMap(json.decode(source));

  @override
  String toString() => 'Args(data1: $data1, data2: $data2)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArgsModel && other.data1 == data1 && other.data2 == data2;
  }

  @override
  int get hashCode => data1.hashCode ^ data2.hashCode;
}
