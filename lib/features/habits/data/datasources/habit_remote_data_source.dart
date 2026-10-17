import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/habit_model.dart';

abstract class HabitRemoteDataSource {
  Future<List<HabitModel>> getHabits();
  Future<HabitModel?> getHabit(String habitId);
  Future<void> addHabit({
    required String name,
    required String description,
    required int points,
  });
  Future<Set<String>> getCompletedHabitIds(String dateKey);
  Future<List<bool>> getCompletions(String habitId, List<String> dateKeys);
  Future<void> setCompletion({
    required String habitId,
    required String dateKey,
    required bool isDone,
  });
}

/// Collections:
/// - `habits/{id}`: name, description, points, createdAt
/// - `completions/{habitId}_{yyyy-MM-dd}`: habitId, dateKey
class FirestoreHabitDataSource implements HabitRemoteDataSource {
  FirestoreHabitDataSource(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _habits =>
      _firestore.collection('habits');
  CollectionReference<Map<String, dynamic>> get _completions =>
      _firestore.collection('completions');

  String _completionId(String habitId, String dateKey) => '${habitId}_$dateKey';

  @override
  Future<List<HabitModel>> getHabits() async {
    final snap = await _habits.orderBy('createdAt').get();
    return snap.docs.map(HabitModel.fromFirestore).toList();
  }

  @override
  Future<HabitModel?> getHabit(String habitId) async {
    final doc = await _habits.doc(habitId).get();
    return doc.exists ? HabitModel.fromFirestore(doc) : null;
  }

  @override
  Future<void> addHabit({
    required String name,
    required String description,
    required int points,
  }) async {
    await _habits.add({
      'name': name,
      'description': description,
      'points': points,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  @override
  Future<Set<String>> getCompletedHabitIds(String dateKey) async {
    final snap = await _completions.where('dateKey', isEqualTo: dateKey).get();
    return snap.docs.map((d) => d.data()['habitId'] as String).toSet();
  }

  @override
  Future<List<bool>> getCompletions(
    String habitId,
    List<String> dateKeys,
  ) async {
    final docs = await Future.wait(
      dateKeys.map((k) => _completions.doc(_completionId(habitId, k)).get()),
    );
    return docs.map((d) => d.exists).toList();
  }

  @override
  Future<void> setCompletion({
    required String habitId,
    required String dateKey,
    required bool isDone,
  }) async {
    final ref = _completions.doc(_completionId(habitId, dateKey));
    if (isDone) {
      await ref.set({'habitId': habitId, 'dateKey': dateKey});
    } else {
      await ref.delete();
    }
  }
}
