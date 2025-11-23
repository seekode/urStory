# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

UrStory is a collaborative interactive storytelling Flutter application where users can create branching narratives with multiple story paths and choices. The app uses Supabase as its backend.

**Tech Stack:**
- Flutter (multi-platform: mobile, desktop, web)
- Supabase (PostgreSQL backend with real-time capabilities)
- Riverpod (state management)
- go_router (routing - planned)

## Development Commands

### Running the app
```bash
flutter run                    # Run on connected device/emulator
flutter run -d chrome          # Run in Chrome
flutter run -d windows         # Run on Windows desktop
flutter run -d linux           # Run on Linux desktop
flutter run -d macos           # Run on macOS desktop
```

### Testing
```bash
flutter test                   # Run all tests
flutter test test/widget_test.dart  # Run specific test file
flutter test --coverage        # Generate coverage report
```

### Code quality
```bash
flutter analyze                # Run static analysis
flutter format lib/ test/      # Format code
```

### Dependencies
```bash
flutter pub get                # Install dependencies
flutter pub upgrade            # Upgrade dependencies
flutter pub outdated           # Check for outdated packages
```

### Building
```bash
flutter build apk              # Build Android APK
flutter build appbundle        # Build Android App Bundle
flutter build ios              # Build iOS app
flutter build windows          # Build Windows desktop
flutter build linux            # Build Linux desktop
flutter build macos            # Build macOS desktop
flutter build web              # Build web version
```

### Cleaning
```bash
flutter clean                  # Clean build artifacts
flutter pub cache repair       # Repair pub cache if needed
```

## Architecture

UrStory follows a pragmatic layered architecture with clear separation of concerns. The architecture prioritizes simplicity and maintainability over strict pattern adherence.

### Directory Structure

```
lib/
├── models/          # Data classes (entities)
├── services/        # Business logic & Supabase communication
├── providers/       # State management (Riverpod)
├── screens/         # UI screens organized by feature
├── core/            # Globally shared code
│   ├── theme/       # App theme & styles
│   ├── router/      # Navigation configuration
│   ├── utils/       # Utility functions
│   └── widgets/     # Reusable widgets
├── l10n/            # Internationalization (future)
└── main.dart        # App entry point
```

### Data Flow

**Read (Supabase → UI):**
```
Supabase → Service (transforms to Model) → Provider (state) → Screen (UI)
```

**Write (UI → Supabase):**
```
Screen (user action) → Provider → Service (validation/transform) → Supabase
```

### Layer Rules

1. **models/**: Pure data classes, no dependencies
   - Immutable classes (final fields)
   - `fromJson`/`toJson` serialization
   - Simple data-related methods only
   - No imports from other layers

2. **services/**: One service per main business entity
   - Handles Supabase CRUD operations
   - Contains business logic
   - Transforms data between Supabase and models
   - Injectable via Riverpod providers
   - Examples: `StoryService`, `ChapterService`, `AuthService`

3. **providers/**: State management with Riverpod
   - Service providers
   - State providers for global state
   - AsyncNotifier for complex async state
   - Providers call services, never Supabase directly

4. **screens/**: UI organized by feature
   - One folder per main screen
   - Feature-specific widgets in `widgets/` subfolder
   - Screens consume providers, not services directly
   - Use ConsumerWidget for Riverpod integration

5. **core/**: Only truly shared code (used in 3+ places)
   - No feature-specific logic
   - Global utilities and widgets

### Widget Organization Rules

- Used in 1 screen → `screens/[screen_name]/widgets/`
- Used in 2-3 screens of same feature → `screens/[feature]/widgets/`
- Used everywhere → `core/widgets/`

### Naming Conventions

**Files:** `snake_case` with clear suffixes
- `_screen.dart`, `_service.dart`, `_provider.dart`

**Classes:** `PascalCase` with descriptive suffixes
- `StoryService`, `StoryProvider`, `StoryListScreen`

**Providers:** Descriptive name + `Provider`
- `storyServiceProvider`, `currentUserProvider`, `storyNotifierProvider`

**Variables/Functions:** `camelCase`, explicit and descriptive

## Supabase Integration

- All Supabase calls must go through service classes
- Use Row Level Security (RLS) policies on Supabase side
- Leverage optimistic updates for better UX
- Handle real-time subscriptions in services, expose via providers

## Design System

### Color Palette

**Light Theme:**
- Background: `#F8F6F4` (soft cream)
- Secondary bg: `#F5F3F0` (pronounced cream)
- Cards: `#E8E4E0` (pastel beige)
- Primary text: `#1A1A1A` (near-black)
- Secondary text: `#4A4A4A` (dark gray)
- Primary accent: `#7B9E87` (sage green)
- Secondary accent: `#C9A87C` (soft caramel)
- Interactive: `#5B7C8D` (blue-gray)

**Dark Theme:**
- Background: `#1C1C1E`
- Secondary bg: `#2C2C2E`
- Cards: `#3A3A3C`
- Primary text: `#F5F5F7`
- Secondary text: `#AEAEB2`
- Primary accent: `#8FB094`
- Secondary accent: `#D4B896`
- Interactive: `#7A9AAB`

### Visual Guidelines

- **Corners:** Generous rounded corners (8-12px cards, 6-8px buttons)
- **Spacing:** Generous padding around text content
- **Typography:**
  - Headings: Modern sans-serif (Inter, Outfit, Manrope)
  - Body: Serif for reading comfort (Merriweather, Lora, Source Serif)
  - Clear hierarchy
- **Shadows:** Soft and subtle, never harsh
- **Animations:** Smooth transitions (200-300ms)

## Code Standards

### Dart Best Practices

- Use `const` constructors wherever possible
- Properly dispose controllers in StatefulWidgets
- Prefer immutable data structures
- Use `final` for all fields that don't change
- No `late` variables without good reason

### Flutter Patterns

- Prefer `ConsumerWidget` over `StatelessWidget` when using Riverpod
- Extract complex widgets into separate files
- Keep build methods simple and readable
- Use `const` for static widgets to optimize rebuilds

### Testing Strategy

- Unit tests for services (mock Supabase client)
- Widget tests for UI components (mock providers)
- Integration tests for critical user flows

## Important Notes

- This is currently a fresh Flutter project - most architecture will be implemented as features are added
- l10n folder exists but internationalization is not yet implemented
- Supabase client setup needs to be added in a future PR
- The README contains detailed architecture documentation that should be referenced when implementing new features
