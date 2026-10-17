# Daily Habit Tracker

Flutter app: create habits worth points, tick them off each day, and see a 7-day streak per habit. Data lives in Cloud Firestore (no mock data).

## Architecture

```
Page → Cubit → UseCase → HabitRepository (interface) → HabitRepositoryImpl → Firestore data source
```

- `domain/` – freezed entities, repository interface, use cases (`Either<Failure, T>` via fpdart). No Flutter/Firebase imports. Business rules (validation, points totals, 7-day window, streak) live in use cases.
- `data/` – `HabitModel` (Firestore ↔ `toEntity()`), `FirestoreHabitDataSource` (throws), `HabitRepositoryImpl` (catches everything → `Left(Failure)`).
- `presentation/` – cubits depend only on use cases; freezed sealed states; pages use `BlocBuilder`.
- `core/di` (get_it), `core/router` (go_router).

Firestore layout: `habits/{id}` and `completions/{habitId}_{yyyy-MM-dd}` (no composite indexes needed).

## Setup

1. Create/choose a Firebase project with Firestore enabled.
2. Add Android/iOS apps and drop in `google-services.json` / `GoogleService-Info.plist` (or run `flutterfire configure`).
3. Dev rules (open, for the demo only): `allow read, write: if true;`
4. `flutter pub get && dart run build_runner build && flutter run`

Tests: `flutter test`
