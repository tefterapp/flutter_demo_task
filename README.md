# Score Detail Preview — Flutter Demo Task

Small Flutter app that recreates **Home** (3 score cards) and **Score Detail** screens per the provided Figma, with a focus on:
- Reusable UI components (a single `ScoreCard` widget is reused on Home and Score Detail via named constructors)
- Feature-first Clean Architecture
- Smooth interactions (timeframe switching, date navigation, pull-to-refresh)
- Local JSON data source with a simulated refresh delay
- Full localization (UI chrome **and** metric titles like “Overnight HRV”)

**Figma reference:** `https://www.figma.com/design/L3X4gAEcmMFiopRdG8JBH2/Rolla-UI-Demo?node-id=0-1`

## Tech stack

- **State management**: `flutter_bloc` (Home uses Cubit, Detail uses Bloc)
- **DI**: `get_it`
- **Domain error model**: `dartz` (`Either<Failure, T>`)
- **Models**: `freezed` + `json_serializable`
- **Localization**: Flutter gen-l10n + `intl` (EN implemented; structure ready for more)
- **Charts**: `fl_chart` bar charts for 7D / 30D / 1Y + CustomPainter radial gauge for 1D
- **Typography**: Outfit via `google_fonts`

## Architecture overview

Feature-first Clean Architecture (scores feature):

```
lib/
  core/                   # shared DI, errors, UI helpers
  l10n/                   # ARB + generated localizations
  features/
    scores/
      data/               # DTOs (one per file), local datasource, repository impl (mock JSON)
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

## Mock data

- **Mock JSON**: `assets/mock/scores.json`
- **Repository behavior** (`ScoresRepositoryImpl`):
  - `get*` methods are cache-backed; the **first** call (cold cache) waits out `simulatedDelay` (default 500ms) to mimic network latency — subsequent calls are instant. This keeps the loading skeleton visible on first entry without pretending to be a refresh.
  - `refresh*` methods simply invalidate the cache and delegate to `get*`, so pull-to-refresh goes through the same delay + asset read. This is the single place where you can wire up real error simulation later (e.g. returning `Left(NetworkFailure())` based on a toggle).
  - Error and empty states are still reachable from the UI (via the `Failure` type and empty payloads) — they’re just data-driven rather than randomized.

## Setup & run

From the project root:

```bash
flutter pub get
flutter gen-l10n
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## Quality checks

```bash
flutter analyze
flutter test
```

## UI details worth knowing

- **Shared `ScoreCard`**: `ScoreCard.home(...)` (Home list) and `ScoreCard.detail(...)` (top of Score Detail) are the same widget class with different constructors. Internally both compose `ScoreCardHeader`, `ScoreCardChartArea`, `ScoreCardTimeRange`, and `ScoreCardInsights`.
- **Info trigger**: the definitions bottom sheet opens from the `?` icon next to the score title (not from a separate button).
- **Date switcher**: each timeframe shows its own range label with `<` / `>` chevrons (`d MMM` for 1D, `d MMM – d MMM` for 7D, `MMM` for 30D, `yyyy` for 1Y). The right chevron is disabled when already on the current day/week/month/year — no future navigation.
- **Empty handling**: when the selected day/window has no score reading, the value label (“Good”, “High”, …) under the title is hidden instead of being shown with no data behind it.
- **Localized metric titles**: metric titles (Sleep, Resting HR, Overnight HRV, Active points, Steps, Active calories, Move hours) come from ARB keys, so adding a language = adding the same keys in a new `app_XX.arb`.

## Notes / assumptions

- **Timeframes**: `1D / 7D / 30D / 1Y` are modeled as `d1 / d7 / d30 / y1` in the JSON payload.
- **Missing data → chart gaps**: any `null` values in score points render as empty bars (7D/30D/1Y) or a dash in the gauge (1D); all buckets in the visible window are rendered regardless of data presence.
- **Metrics “Avg”**: 7D/30D/1Y show averages of the visible window; 1D shows the value for the selected day.
- **Progress normalization**: metric progress bars are normalized per key (steps, sleep, HRV, etc.) using reasonable caps (documented in `metric_math.dart`).

## Screen recording checklist (60–90s)

- Home → tap card → Score Detail navigation
- Switch timeframe (1D ↔ 7D ↔ 30D ↔ 1Y) and show chart/metrics update
- Navigate dates (`<` / `>`) and show the right chevron disabled on “today”
- Tap the `?` icon to open the **Info** bottom sheet (metric definitions)
- Pull-to-refresh to show the loading skeleton over a simulated delay
