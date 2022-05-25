import 'dart:convert';

import 'category_model.dart';

class CourseModel {
  final int id;
  final String name;
  final String image;
  final CategoryModel category;
  CourseModel({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
  });

  CourseModel copyWith({
    int? id,
    String? name,
    String? image,
    CategoryModel? category,
  }) {
    return CourseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'course_name': name,
      'image_url': image,
      'Category': category.toMap(),
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id']?.toInt() ?? 0,
      name: map['course_name'] ?? '',
      image: map['image_url'] ?? '',
      category: CategoryModel.fromMap(map['Category']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) =>
      CourseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CourseModel(id: $id, name: $name, image: $image, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CourseModel &&
        other.id == id &&
        other.name == name &&
        other.image == image &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ image.hashCode ^ category.hashCode;
  }
}
