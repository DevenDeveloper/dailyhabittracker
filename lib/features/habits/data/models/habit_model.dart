import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/habit.dart';

class HabitModel {
  const HabitModel({
    required this.id,
    required this.name,
    required this.description,
    required this.points,
    required this.createdAt,
  });

  factory HabitModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? const <String, dynamic>{};
    return HabitModel(
      id: doc.id,
      name: data['name'] as String? ?? '',
      description: data['description'] as String? ?? '',
      points: (data['points'] as num?)?.toInt() ?? 0,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  final String id;
  final String name;
  final String description;
  final int points;
  final DateTime createdAt;
}

extension HabitModelX on HabitModel {
  Habit toEntity() => Habit(
    id: id,
    name: name,
    description: description,
    points: points,
    createdAt: createdAt,
  );
}
