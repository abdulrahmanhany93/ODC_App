import 'dart:convert';

import 'package:odc_app/data/models/category_model.dart';

class CoursesModel {
  final int id;
  final String name;
  final String image;
  final CategoryModel category;
  CoursesModel({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
  });

  CoursesModel copyWith({
    int? id,
    String? name,
    String? image,
    CategoryModel? category,
  }) {
    return CoursesModel(
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

  factory CoursesModel.fromMap(Map<String, dynamic> map) {
    return CoursesModel(
      id: map['id']?.toInt() ?? 0,
      name: map['course_name'] ?? '',
      image: map['image_url'] ?? '',
      category: CategoryModel.fromMap(map['Category']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CoursesModel.fromJson(String source) =>
      CoursesModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CourseModel(id: $id, name: $name, image: $image, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoursesModel &&
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
