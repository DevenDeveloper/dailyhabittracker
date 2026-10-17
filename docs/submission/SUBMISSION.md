# Phase 2 submission pack (paste into Notion / Google Doc)

## 0. What to send
Share ONE Notion page or Google Doc via LinkedIn DM with these 4 sections.

| # | Item | File / link | Status |
|---|---|---|---|
| 1 | Screenshots (3 screens) | `1-today.png`, `2-add-habit.png`, `3-habit-detail.png` | Ready |
| 2 | App demo video (10-30 s) | `demo.mp4` (21 s: create habit, toggle, streak, undo) | Ready |
| 3 | Vibe coding walkthrough (2-3 min) | You record it. Script below. | You record |
| 4 | GitHub repo | https://github.com/DevenDeveloper/dailyhabittracker | Push first (see section 5) |

Upload the PNGs and the MP4 to Notion/Drive; Notion embeds both.

---

## 1. Screenshots
Add the three PNGs in this order with one-line captions:
1. **Today's Habits**: progress ring (3 of 4 done, 40/55 pts), habit list with toggles and points.
2. **Add Habit**: name, description, point value with quick-pick chips.
3. **Habit Detail**: points, 5-day streak, 5/7 this week, 7-day strip, mark today done/undone.

## 2. Demo video (`demo.mp4`, 21 s)
What it shows: Today screen, Add habit (Meditate 10 min), toggle it done, open Drink 2L water to see the 5-day streak, mark today undone.
The 7-day history is real Firestore data that I backfilled by moving the emulator clock back day by day and ticking habits; the streak is computed from those documents.

## 3. Vibe coding walkthrough (2-3 min): script
Record your screen while you scroll the repo and this Notion page. Say it in your own words; the points below are what to hit. About 330 spoken words is roughly 2 min 30 s.

**0:00 Tools (15 s)**
"I built this with Claude Code, in the Claude desktop app, using Claude Sonnet. I also used the Firebase CLI through it to create the Firebase project and Firestore database. I tested on an Android emulator."

**0:15 Prompt examples (60 s)** (real prompts from the session)
1. *The Phase 2 brief pasted in full*: "Build a Daily Habit Tracker in Flutter with clean architecture and Firebase, with flutter_bloc, freezed, fpdart, get_it, go_router, cloud_firestore." It produced domain, data and presentation layers, DI, routing, and tests.
2. *"how do i delete the habits?"*: it noticed there was no delete feature and added one across all layers: a `DeleteHabit` use case, a repository method with a Firestore batch delete, swipe-to-delete and a trash button, both with a confirmation dialog.
3. *"Top graph should be small and whole screen should be scrollable"*: it shrank the progress ring into a compact card and turned the whole Today screen into one scrolling list with pull-to-refresh.
4. Also: *"use these color codes"* (I attached a palette screenshot), *"background color should be white, add habit button icon and text color should be white"*, *"add app logo"*, *"Optimise the pubspec.yaml file"* (it removed three unused packages).

**1:15 Where I corrected or guided the AI (35 s)** (pick one or two)
- **Design direction (me correcting it):** it first themed the app from my palette screenshot; I said "I don't like this, use this light blue and the graph can be better". It rebuilt the primary colour and replaced the plain progress bar with a segmented ring (one segment per habit) plus an inner points ring.
- **Tooling failure (it corrected itself):** it added the `phosphor_flutter` icon package, the app failed to compile on the current Flutter (`IconData` is a final class), so it switched to `material_symbols_icons`.
- **Logic bug (caught in review):** the first streak logic reset to 0 whenever today was not yet done. It was changed so a streak that runs up to yesterday still counts, and a unit test covers it.

**1:50 How I verified clean architecture (40 s)**
"I verified it three ways. One: the dependency rule, with greps." (show the commands in section 4 returning nothing) "The domain layer has no Flutter, Firebase, or router imports; cubits import only use cases; presentation never imports the data layer. Two: the repository implementation wraps every call in try/catch and returns `Either<Failure, T>`, so nothing throws past the data layer; the use cases own the business rules (validation, points totals, 7-day window, streak). Three: the unit tests mock the repository interface with mocktail and test those rules without Firebase, and `flutter analyze` is clean."

**2:30 Close (10 s)**
"Repo and demo are linked above. Thanks."

## 4. Commands to show during the walkthrough
```bash
# domain must not import Flutter / Firebase / router / DI
grep -rnE "package:(flutter/|cloud_firestore|firebase_core|flutter_bloc|get_it|go_router)" lib/features/habits/domain lib/core/error lib/core/usecase

# cubits must not touch repositories or the data layer
grep -rn "repositor\|/data/\|firestore" lib/features/habits/presentation/cubits

# presentation must not import the data layer
grep -rn "habits/data" lib/features/habits/presentation

flutter analyze && flutter test
```
All three greps print nothing (verified). `flutter analyze` reports no issues and 4 tests pass.

Caveat to be upfront about: domain entities and states import `freezed_annotation` (an annotation-only package, required by the brief), not a framework dependency.

## 5. GitHub
The remote is already set to `https://github.com/DevenDeveloper/dailyhabittracker`. Push when you are ready:
```bash
git push -u origin main
```
`README.md` has the screenshots, architecture table, run steps, and Firestore layout.
The Firebase config files (`google-services.json`, `GoogleService-Info.plist`, `firebase_options.dart`) are committed for the demo project. These identify the project, they are not secrets, but the Firestore rules in `firestore.rules` are open (no auth), which is fine for a demo; mention it, and consider deleting the Firebase project after review.

## 6. Message to send with the link (LinkedIn DM)
"Hi, here is my Phase 2 submission: <Notion link>. It includes screenshots, a 21 s demo, the vibe-coding walkthrough, and the GitHub repo. The app uses clean architecture (Page > Cubit > UseCase > Repository > Firestore) with flutter_bloc, freezed, fpdart, get_it, go_router and cloud_firestore. Happy to walk through any part."
