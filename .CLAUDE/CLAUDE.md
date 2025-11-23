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

**CRITICAL: One widget per file. Never use `_buildXxx()` functions for widgets.**

Widget location:
- Used in 1 screen → `screens/[screen_name]/widgets/`
- Used in 2-3 screens of same feature → `screens/[feature]/widgets/`
- Used everywhere (3+ places) → `core/widgets/`

Widget best practices:
- ❌ **NEVER** create `_buildXxx()` functions that return widgets
- ✅ **ALWAYS** create proper widget classes in separate files
- Each widget should be in its own file with a clear, descriptive name
- Use `StatelessWidget` or `StatefulWidget` as appropriate
- Keep widgets focused and single-purpose

Example:
```dart
// ❌ BAD - function returning widget
Widget _buildHeader() {
  return Container(...);
}

// ✅ GOOD - proper widget class in separate file
// File: widgets/auth_header.dart
class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(...);
  }
}
```

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

### Design Constants

**IMPORTANT:** All design constants (border radius, spacing, shadows, animations) are centralized in `lib/core/theme/app_constants.dart`. **NEVER use hardcoded values** for these properties.

Common constants:
- Border radius: `AppConstants.borderRadiusFloating` (28px), `borderRadiusCard` (16px), `borderRadiusButton` (12px), `borderRadiusInput` (20px), `borderRadiusTab` (14px)
- Spacing: `AppConstants.spacingXs` (4px), `spacingSm` (8px), `spacingMd` (12px), `spacing` (16px), `spacingLg` (24px), `spacingXl` (32px)
- Shadows: `AppConstants.shadowLight`, `shadowMedium`, `shadowStrong` (use `shadowDark*` variants for dark theme)
- Animation durations: `AppConstants.durationFast` (150ms), `durationStandard` (200ms), `durationSlow` (350ms)
- Animation curves: `AppConstants.curveStandard`, `curveEaseOut`, `curveEaseIn`

Example:
```dart
// ❌ BAD - hardcoded values
BorderRadius.circular(20)
const EdgeInsets.all(16)
Duration(milliseconds: 200)

// ✅ GOOD - using constants
BorderRadius.circular(AppConstants.borderRadiusInput)
const EdgeInsets.all(AppConstants.spacing)
AppConstants.durationStandard
```

### Color Palette

**Light Theme:**
- Background primary: `#FAF9F7` (ultra-soft cream)
- Surface elevated: `#FFFFFF` (pure white for navbar, modals, main cards)
- Surface secondary: `#F0EDE8` (very light beige)
- Primary text: `#1F1F1F` (near-black)
- Secondary text: `#5A5A5A` (medium gray)
- Tertiary text: `#8E8E8E` (light gray)
- Primary accent: `#6B9080` (balanced sage green)
- Primary accent hover: `#5A7A6B` (dark sage green)
- Secondary accent: `#D4A574` (warm caramel)
- Tertiary accent: `#A4B8C4` (soft blue-gray)

**Dark Theme:**
- Background primary: `#1A1A1C` (very dark gray-black)
- Surface elevated: `#252527` (dark gray for navbar, modals, main cards)
- Surface secondary: `#2E2E30` (medium-dark gray)
- Primary text: `#F0F0F2` (off-white)
- Secondary text: `#B8B8BD` (light gray)
- Tertiary text: `#75757A` (medium gray)
- Primary accent: `#83AB96` (bright sage green)
- Primary accent hover: `#9DBFAC` (lighter sage green)
- Secondary accent: `#D9B388` (bright caramel)
- Tertiary accent: `#99B4C9` (bright blue-gray)

### Visual Guidelines

- **Border Radius:**
  - Floating containers (navbar, modals): 28px
  - Cards: 16px
  - Buttons: 12px
  - Tags/badges: 8px
  - Inputs: 12px
- **Spacing:**
  - Card padding: 16px
  - Element spacing: 12px (small), 24px (medium), 40px (large)
  - Side margins: 20px (mobile), 24px (tablet+)
- **Typography:**
  - Headings: Modern sans-serif (Inter, Outfit, Manrope)
  - Body reading: Serif for comfort (Merriweather, Lora, Source Serif)
  - Clear hierarchy
- **Shadows:** Soft and subtle, never harsh
  - Light: `0px 1px 3px rgba(0,0,0,0.06)`
  - Medium: `0px 2px 8px rgba(0,0,0,0.08)`
  - Strong: `0px 4px 16px rgba(0,0,0,0.12)`
- **Animations:**
  - Duration: 350ms
  - Easing: cubic-bezier(0.4, 0.0, 0.2, 1)
  - Page transitions: Slide (0.15 offset) + Fade with bidirectional animation

### Important Design Rules

**DO NOT use default Material components** (AppBar, BottomNavigationBar, etc.) as-is. The app requires **full custom styling** to match the design system. When you need similar functionality:
- Create custom widgets with proper colors, border radius, and spacing from the design system
- Use Container, Row, Column, and basic widgets to build custom UI
- Only use Material components for their underlying functionality (like TextField), but **always override their styling completely**

See `lib/core/widgets/navigation/main_navigation.dart` for an example of proper custom implementation.

### Standard Page Transition Animation

**ALL page transitions** in the app must use this exact animation for consistency:

```dart
AnimatedSwitcher(
  duration: const Duration(milliseconds: 350),
  switchInCurve: const Cubic(0.4, 0.0, 0.2, 1),
  switchOutCurve: const Cubic(0.4, 0.0, 0.2, 1),
  transitionBuilder: (child, animation) {
    final offsetAnimation = Tween<Offset>(
      begin: const Offset(0.15, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animation,
      curve: const Cubic(0.4, 0.0, 0.2, 1),
    ));

    final reverseOffsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-0.15, 0),
    ).animate(CurvedAnimation(
      parent: animation,
      curve: const Cubic(0.4, 0.0, 0.2, 1),
    ));

    return SlideTransition(
      position: animation.status == AnimationStatus.reverse
          ? reverseOffsetAnimation
          : offsetAnimation,
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  },
  child: Container(
    key: ValueKey<String>('unique_key'),
    child: YourContentWidget(),
  ),
)
```

**Key points:**
- 350ms duration (smooth and noticeable)
- 0.15 horizontal offset (ample movement)
- Bidirectional slide (outgoing screen slides left, incoming slides from right)
- Fade transition combined with slide
- Each child MUST have a unique `ValueKey` for AnimatedSwitcher to detect changes
- Each child should have an opaque background color to prevent visual overlap during transition

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
- **ALWAYS create reusable widgets in `core/widgets/` for common UI elements**
  - Text fields, buttons, cards, modals, etc. must be reusable components
  - Never create inline widget functions like `_buildButton()` or `_buildInput()` when the widget will be used in multiple places
  - Use proper widget classes with clear parameters and documentation

### Reusable Widgets

The app provides common reusable widgets in `lib/core/widgets/`:

**CustomTextField** (`custom_text_field.dart`):
- Fully styled text input with consistent design
- Parameters: `controller`, `label`, `hint`, `obscureText`, `validator`, `suffixIcon`, `keyboardType`, etc.
- Automatically handles light/dark themes
- Border radius: 20px (configurable via `borderRadius` parameter)
- Usage:
  ```dart
  CustomTextField(
    controller: emailController,
    label: 'Email',
    hint: 'votre@email.com',
    keyboardType: TextInputType.emailAddress,
    validator: (value) => value?.isEmpty == true ? 'Required' : null,
  )
  ```

**CustomButton** (`custom_button.dart`):
- Styled button with multiple variants
- Variants: `primary`, `secondary`, `outlined`, `text`
- Parameters: `text`, `onPressed`, `variant`, `isLoading`, `icon`, `borderRadius`, `width`, `height`
- Automatically shows loading spinner when `isLoading: true`
- Border radius: 20px (configurable)
- Usage:
  ```dart
  CustomButton(
    text: 'Submit',
    onPressed: () => handleSubmit(),
    variant: ButtonVariant.primary,
    isLoading: isLoading,
  )
  ```

### Testing Strategy

- Unit tests for services (mock Supabase client)
- Widget tests for UI components (mock providers)
- Integration tests for critical user flows

## Important Notes

- This is currently a fresh Flutter project - most architecture will be implemented as features are added
- l10n folder exists but internationalization is not yet implemented
- Supabase client setup needs to be added in a future PR
- The README contains detailed architecture documentation that should be referenced when implementing new features
