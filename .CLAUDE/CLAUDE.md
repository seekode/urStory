# CLAUDE.md

Guidelines for UrStory codebase.

## Project

**Stack:** Flutter + Supabase + Riverpod 3.x + go_router 17.x

**⚠️ Critical Versions (Breaking Changes):**
- `flutter_riverpod: 3.0.3` (StateNotifier removed)
- `riverpod_annotation: 3.0.3` (code generation required)
- `go_router: 17.0.0` (API changes)
- `supabase_flutter: 2.8.0`

Verify compatibility. Old tutorials use deprecated patterns.

## Commands
```bash
# Run
flutter run -d windows
flutter run --uninstall-first  # After package updates

# Code Gen (required after provider changes)
dart run build_runner build --delete-conflicting-outputs
dart run build_runner watch --delete-conflicting-outputs  # Dev

# Quality
flutter analyze && flutter format lib/ test/

# Clean (build issues)
flutter clean && dart run build_runner clean && flutter pub get
```

## Architecture
```
lib/
├── models/          # Pure data (fromJson/toJson/copyWith)
├── services/        # Business logic + Supabase
├── providers/       # @riverpod only (auto-generated)
├── screens/[feature]/widgets/  # Feature UI
└── core/
    ├── theme/       # AppColors, AppConstants
    ├── router/      # GoRouter config
    └── widgets/     # Reusable (3+ uses)
```

**Data Flow:** `Supabase → Service → Provider → Screen` (read), `Screen → Service → Supabase` (write)

**Key Rule:** Screens call services directly via `ref.read()`. No Notifier boilerplate.

## Layer Rules

**models/**: Immutable data, no dependencies, no layer imports

**services/**: 
- All Supabase operations
- `import 'package:supabase_flutter/supabase_flutter.dart' as supabase;` (always)
- Transform JSON ↔ models
- Expose streams for real-time

**providers/**: 
- `@riverpod` annotation only
- NO manual Provider definitions
- NO Notifier classes
- Name convention: `myService` → `myServiceProvider`
- See: `lib/providers/auth_provider.dart`

**screens/**: 
- `ConsumerWidget` / `ConsumerStatefulWidget`
- Write: `ref.read(serviceProvider).method()`
- Read: `ref.watch(stateProvider)`
- Listen: `ref.listen(provider, callback)`

**core/**: Shared code (3+ uses) only

## Riverpod 3.x

- `@riverpod` generates providers (run build_runner after changes)
- Screens call services directly (no StateNotifier/Notifier pattern)
- Avoid: `StateNotifier`, `StateNotifierProvider`, `.state` (removed in 3.x)
- Pattern: Service provider → Stream provider → Screen widget
- Reference: `lib/providers/auth_provider.dart`, `lib/services/auth_service.dart`

## Routing

- Config: `lib/core/router/app_router.dart`
- Global `router` (NOT a provider)
- `ShellRoute` for bottom nav, auth outside
- Navigate: `context.go()`, `context.push()`, `context.pop()`
- Protect routes in `NavigationShell`, listen to `authProvider` for redirects

## Supabase

- All calls in services (never screens/widgets)
- Use alias: `as supabase` (avoid conflicts)
- Transform JSON ↔ app models
- Filter events: `.where((e) => e.event != tokenRefreshed)`
- Reference: `lib/services/auth_service.dart`

## Design System

**Files:** `core/theme/app_constants.dart`, `core/theme/app_colors.dart`

**Rules:**
- NEVER hardcode: spacing, colors, durations, border radius
- NO default Material components (build custom)
- Use: `AppConstants.*`, `AppColors.*`
- Theme-aware: `isDark ? AppColors.dark* : AppColors.light*`

**Animation Pattern:** See `auth_screen.dart` for AnimatedSwitcher with slide+fade

## Widgets

**Location:** 
- 1 screen → `screens/[screen]/widgets/`
- 3+ uses → `core/widgets/`

**Rules:**
- NO `_buildXxx()` functions
- One widget per file
- Use `const` where possible

**Available:** `CustomTextField`, `CustomButton`, `CustomNotification` (see `core/widgets/`)

## Standards

- `const` constructors
- Dispose controllers
- Immutable data (`final` fields)
- Explicit types
- Extract complex widgets to files

## Workflows

**Add Feature:**
1. Model → 2. Service → 3. Provider (`@riverpod`) → 4. `build_runner build` → 5. Screen → 6. Route

**Update Provider:**
1. Edit → 2. `build_runner build` → 3. `flutter analyze`

**Debug:**
`flutter clean && dart run build_runner clean && flutter pub get && build_runner build`

## Naming

- Files: `snake_case` + suffix (`_screen`, `_service`, `_provider`)
- Classes: `PascalCase` + suffix
- Providers: function name + `Provider` (auto-generated)

## Troubleshooting

**Deprecated warnings:**
- Check versions: `flutter pub outdated`
- Riverpod 2→3: Replace StateNotifier with service calls
- After upgrades: regenerate + `--uninstall-first`

**AI outdated code:**
- Verify against this file
- Check existing: `lib/providers/auth_provider.dart`

## Key Rules

- Supabase alias: `as supabase`
- No Notifier - call services directly
- Code gen required after provider changes
- No hardcoded design values
- One widget per file
- `--uninstall-first` after major updates
