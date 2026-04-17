# Score Detail Preview — Flutter Demo Task

Small Flutter app that recreates **Home** (3 score cards) and **Score Detail** screens per the provided Figma, with a focus on:
- Reusable UI components
- Feature-first Clean Architecture
- Smooth interactions (timeframe switching, pull-to-refresh)
- Local JSON simulation (including loading/error/empty examples)

**Figma reference:** `https://www.figma.com/design/L3X4gAEcmMFiopRdG8JBH2/Rolla-UI-Demo?node-id=0-1`

## Tech stack

- **State management**: `flutter_bloc` (Home uses Cubit, Detail uses Bloc)
- **DI**: `get_it`
- **Domain error model**: `dartz` (`Either<Failure, T>`)
- **Models**: `freezed` + `json_serializable`
- **Localization**: Flutter gen-l10n + `intl` (EN implemented; structure ready for more)
- **Charts**: `fl_chart` + CustomPainter radial gauge
- **Typography**: Outfit via `google_fonts`

## Architecture overview

Feature-first Clean Architecture (scores feature):

```
lib/
  core/                   # shared DI, errors, UI helpers
  l10n/                   # ARB + generated localizations
  features/
    scores/
      data/               # DTOs, local datasource, repository impl (mock JSON + simulation)
      domain/             # entities, repository contract, use cases
      presentation/       # pages, bloc/cubit, reusable widgets, charts
```

Data flow (happy path):

```
UI (Page/Widget)
  -> Bloc/Cubit
    -> UseCase
      -> ScoresRepository (Either<Failure, T>)
        -> ScoresLocalDataSource (asset JSON)
```

Dependency registration lives in `lib/features/scores/scores_injection.dart` and is called from `lib/core/di/di.dart`.

## Mock data & simulation

- **Mock JSON**: `assets/mock/scores.json`
- **Repository behavior** (`ScoresRepositoryImpl`):
  - `get*` methods are cache-backed and do **not** simulate delays once cached (used for timeframe switching).
  - `refresh*` methods simulate:
    - network delay
    - random **error** and **empty** outcomes

This makes it easy to demonstrate loading/error/empty states via pull-to-refresh.

## Setup & run

From the project root:

```bash
flutter pub get
flutter gen-l10n
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

## Quality checks

```bash
flutter analyze
flutter test
```

## Notes / assumptions

- **Timeframes**: `1D / 7D / 30D / 1Y` are modeled as `d1/d7/d30/y1` in the JSON payload.
- **Missing data → chart gaps**: any `null` values in score points result in visual gaps in the line chart.
- **Metrics “Avg”**: 7D/30D/1Y show averages; 1D shows the latest non-null value for the day series.
- **Progress normalization**: metric progress bars are normalized per key (steps, sleep, HRV, etc.) using reasonable caps (documented in `metric_math.dart`).

## Screen recording checklist (60–90s)

- Home → tap card → Score Detail navigation
- Switch timeframe (1D ↔ 7D ↔ 30D ↔ 1Y) and show chart/metrics update
- Open **Info** bottom sheet (definitions)
- Pull-to-refresh to show:
  - loading skeleton
  - at least one **empty** and one **error** example (randomized)
