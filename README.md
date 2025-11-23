## UrStory
Plateforme collaborative de fiction interactive à embranchements multiples
### 🎯 Pitch
UrStory permet à n'importe qui de créer, lire et prolonger des histoires à choix multiples de manière collaborative. Chaque chapitre peut avoir plusieurs suites alternatives créées par l'auteur ou la communauté, générant un arbre narratif où chaque lecteur construit son propre parcours.
### 📍 Phase actuelle
MVP - Phase de développement initial
### 🔗 Navigation rapide
- Roadmap & Tasks - Kanban du projet
- Doc - Architecture et documentation technique
### 👥 Équipe
- 2 développeurs
- Gestion : Anytype
- Code : Git/GitHub
### 🛠 Stack
- Front/Mobile/Desktop : Flutter
- Backend/BDD : Supabase (PostgreSQL)
- API : (à définir)
### 🧭 Philosophie
- MVP d'abord, itération ensuite
- Liberté créative maximale
- Modération légère au lancement
- Évolution basée sur les retours utilisateurs

# Structure du Projet UrStory

## Vue d'ensemble
UrStory utilise une architecture pragmatique et simple, organisée en couches claires sans sur-engineering. L'approche privilégie la clarté et l'efficacité plutôt que le respect strict de patterns architecturaux complexes.

## Structure des dossiers
```
lib/
├── models/                        # Classes de données (entités métier)
├── services/                      # Logique métier et communication avec Supabase
├── providers/                     # State management avec Riverpod
├── screens/                       # Écrans de l'application
├── core/                          # Code partagé globalement
│   ├── theme/                     # Thème et styles
│   ├── router/                    # Navigation et routing
│   ├── utils/                     # Fonctions utilitaires
│   └── widgets/                   # Widgets réutilisables globalement
├── l10n/                          # Fichiers de traduction (i18n) (implémentation future)
│   ├── app_en.arb
│   └── app_fr.arb
└── main.dart                      # Point d'entrée de l'application
```

## Description des couches

### 1. models/
**Rôle :** Définir les structures de données de l'application.

**Contenu :**
- Classes de données pures (Story, Chapter, Choice, User, etc.)
- Méthodes de sérialisation (fromJson, toJson)
- Méthodes simples liées aux données (ex: `story.isPublished()`, `chapter.wordCount()`)

**Exemple :**
```dart
// models/story.dart
class Story {
  final String id;
  final String title;
  final String authorId;
  final DateTime createdAt;
  
  Story({...});
  
  factory Story.fromJson(Map<String, dynamic> json) => ...;
  Map<String, dynamic> toJson() => ...;
  
  bool get isPublished => publishedAt != null;
}
```

**Règles :**
- Pas de dépendances vers d'autres couches
- Classes immutables (final)
- Implémentation de `==` et `hashCode` si nécessaire

---

### 2. services/
**Rôle :** Gérer la communication avec Supabase et contenir la logique métier.

**Contenu :**
- Configuration du client Supabase
- Opérations CRUD (Create, Read, Update, Delete)
- Logique métier complexe
- Transformation des données entre Supabase et les models

**Exemple :**
```dart
// services/story_service.dart
class StoryService {
  final SupabaseClient _client;
  
  Future<List<Story>> getPublishedStories() async {
    final response = await _client
        .from('stories')
        .select()
        .eq('published', true);
    return response.map((json) => Story.fromJson(json)).toList();
  }
  
  Future<void> createStory(Story story) async {
    await _client.from('stories').insert(story.toJson());
  }
}
```

**Règles :**
- Un service par entité métier principale (StoryService, ChapterService, etc.)
- Services injectés via providers Riverpod
- Gestion des erreurs dans les services

---

### 3. providers/
**Rôle :** Gérer l'état de l'application avec Riverpod.

**Contenu :**
- Providers pour exposer les services
- State providers pour l'état global
- Notifiers pour l'état complexe avec logique

**Exemple :**
```dart
// providers/story_provider.dart

// Provider du service
final storyServiceProvider = Provider<StoryService>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return StoryService(client);
});

// Provider pour les stories publiées
final publishedStoriesProvider = FutureProvider<List<Story>>((ref) async {
  final service = ref.read(storyServiceProvider);
  return service.getPublishedStories();
});

// Notifier pour gérer l'état d'une story
class StoryNotifier extends StateNotifier<AsyncValue<Story>> {
  final StoryService _service;
  
  StoryNotifier(this._service) : super(const AsyncValue.loading());
  
  Future<void> loadStory(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _service.getStoryById(id));
  }
}
```

**Règles :**
- Tous les providers globaux sont ici
- Les providers appellent les services, jamais directement Supabase
- Utiliser AsyncNotifier pour l'état asynchrone complexe

---

### 4. screens/
**Rôle :** Définir les écrans de l'application.

**Organisation par fonctionnalité utilisateur :**
```
screens/
├── authentication/
│   ├── login_screen.dart
│   ├── register_screen.dart
│   └── widgets/                   # Widgets spécifiques à l'auth
│       ├── login_form.dart
│       └── social_login_buttons.dart
├── story_list/
│   ├── story_list_screen.dart
│   └── widgets/
│       └── story_card.dart
├── story_detail/
│   ├── story_detail_screen.dart
│   └── widgets/
│       └── chapter_navigation.dart
└── profile/
    ├── profile_screen.dart
    └── widgets/
        └── user_stats.dart
```

**Règles :**
- Un dossier par écran principal
- Widgets spécifiques à un écran dans `widgets/` du dossier de cet écran
- Les screens consomment les providers, pas les services directement

**Exemple :**
```dart
// screens/story_list/story_list_screen.dart
class StoryListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storiesAsync = ref.watch(publishedStoriesProvider);
    
    return storiesAsync.when(
      data: (stories) => ListView.builder(...),
      loading: () => CircularProgressIndicator(),
      error: (err, stack) => ErrorWidget(err),
    );
  }
}
```

---

### 5. core/
**Rôle :** Code partagé utilisé dans toute l'application.

#### core/theme/
Configuration du thème de l'application (couleurs, typographie, etc.)
```dart
// core/theme/app_theme.dart
class AppTheme {
  static ThemeData lightTheme = ThemeData(...);
  static ThemeData darkTheme = ThemeData(...);
}
```

#### core/router/
Configuration du routing avec go_router ou autre
```dart
// core/router/app_router.dart
final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/story/:id', builder: (context, state) => ...),
  ],
);
```

#### core/utils/
Fonctions utilitaires réutilisables
```dart
// core/utils/date_formatter.dart
String formatRelativeDate(DateTime date) { ... }

// core/utils/validators.dart
bool isValidEmail(String email) { ... }
```

#### core/widgets/
Widgets réutilisables dans toute l'application
```dart
// core/widgets/custom_button.dart
class CustomButton extends StatelessWidget { ... }

// core/widgets/loading_indicator.dart
class LoadingIndicator extends StatelessWidget { ... }
```

**Règles :**
- Uniquement du code véritablement partagé (utilisé dans 3+ endroits)
- Pas de logique métier spécifique à une fonctionnalité

---

### 6. l10n/
**Ignoré** : Cette feature sera à implémenter plus tard.
**Rôle :** Internationalisation (support multilingue).

**Configuration dans `pubspec.yaml` :**
```yaml
flutter:
  generate: true
```

**Fichier `l10n.yaml` à la racine :**
```yaml
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
```

**Fichiers ARB :**
```json
// l10n/app_en.arb
{
  "@@locale": "en",
  "appTitle": "UrStory",
  "login": "Login",
  "welcomeMessage": "Welcome, {userName}!"
}

// l10n/app_fr.arb
{
  "@@locale": "fr",
  "appTitle": "UrStory",
  "login": "Connexion",
  "welcomeMessage": "Bienvenue, {userName} !"
}
```

**Utilisation :**
```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Text(AppLocalizations.of(context)!.login)
```

---

## Flux de données

### Lecture de données (de Supabase vers UI)
```
Supabase
   ↓
Service (transformation en Model)
   ↓
Provider (gestion d'état)
   ↓
Screen (affichage)
```

### Écriture de données (de UI vers Supabase)
```
Screen (action utilisateur)
   ↓
Provider (méthode)
   ↓
Service (validation + transformation)
   ↓
Supabase
```

---

## Principes de développement

### 1. Keep It Simple
- Ne pas sur-architecturer
- Ajouter de la complexité uniquement quand nécessaire
- Privilégier la lisibilité au "pattern parfait"

### 2. Dépendances unidirectionnelles
- Screens → Providers → Services → Models
- Jamais dans l'autre sens
- Models n'ont aucune dépendance

### 3. Testabilité
- Services testables indépendamment (mock Supabase)
- Providers testables (mock services)
- Widgets testables (mock providers)

### 4. Évolution future
Si le projet grandit et nécessite plus de structure :
1. Séparer `models/` en `domain/models/` (entités) et `domain/repositories/` (interfaces)
2. Créer `data/repositories/` pour les implémentations concrètes
3. Cette migration sera simple car la séparation logique existe déjà

---

## Conventions de nommage

### Fichiers
- `snake_case` pour tous les fichiers Dart
- Suffixes clairs : `_screen.dart`, `_service.dart`, `_provider.dart`

### Classes
- `PascalCase` pour les classes
- Suffixes explicites : `StoryService`, `StoryProvider`, `StoryListScreen`

### Providers
- Nom descriptif + `Provider` : `storyServiceProvider`, `currentUserProvider`
- Pour les notifiers : `storyNotifierProvider`

### Variables et fonctions
- `camelCase`
- Noms explicites et descriptifs

---

## Stack technique

- **Frontend/Mobile/Desktop :** Flutter
- **Backend/BDD :** Supabase (PostgreSQL)
- **State Management :** Riverpod
- **Routing :** go_router (ou autre selon choix final)
- **Internationalisation :** flutter_localizations + intl

---

## Notes importantes

### Quand ajouter dans core/ ?
Uniquement si le code est utilisé dans **3 endroits différents ou plus**. Sinon, le laisser dans le dossier de la fonctionnalité.

### Quand créer un nouveau service ?
Un service par **entité métier principale** :
- StoryService (gère Story)
- ChapterService (gère Chapter)
- AuthService (gère User/Auth)
- ChoiceService (gère Choice)

### Gestion des widgets
- Widget utilisé dans 1 seul écran → `screens/[nom_ecran]/widgets/`
- Widget utilisé dans 2-3 écrans de la même fonctionnalité → `screens/[fonctionnalité]/widgets/`
- Widget utilisé partout → `core/widgets/`

---

## Exemple complet : Feature "Story"
```
lib/
├── models/
│   └── story.dart                 # Classe Story
│
├── services/
│   └── story_service.dart         # CRUD + logique Story
│
├── providers/
│   └── story_provider.dart        # State management Story
│
├── screens/
│   ├── story_list/
│   │   ├── story_list_screen.dart
│   │   └── widgets/
│   │       └── story_card.dart
│   └── story_detail/
│       ├── story_detail_screen.dart
│       └── widgets/
│           └── chapter_list.dart
```

**Flow :**
1. User ouvre `StoryListScreen`
2. Screen lit `publishedStoriesProvider`
3. Provider appelle `StoryService.getPublishedStories()`
4. Service fetch Supabase et retourne `List<Story>`
5. Provider expose les données
6. Screen affiche avec `StoryCard` widgets


---
# UrStory - Charte Graphique

## 1. Palettes de couleurs

### Thème clair
- **Fond principal** : `#F8F6F4` (crème très doux)
- **Fond secondaire** : `#F5F3F0` (crème prononcé)
- **Cartes/éléments** : `#E8E4E0` (beige pastel)
- **Texte principal** : `#1A1A1A` (quasi-noir)
- **Texte secondaire** : `#4A4A4A` (gris foncé)
- **Accent primaire** : `#7B9E87` (vert sauge)
- **Accent secondaire** : `#C9A87C` (caramel doux)
- **Liens/interactivité** : `#5B7C8D` (bleu-gris)

### Thème sombre
- **Fond principal** : `#1C1C1E` (gris très foncé)
- **Fond secondaire** : `#2C2C2E` (gris foncé)
- **Cartes/éléments** : `#3A3A3C` (gris moyen-foncé)
- **Texte principal** : `#F5F5F7` (blanc cassé)
- **Texte secondaire** : `#AEAEB2` (gris clair)
- **Accent primaire** : `#8FB094` (vert sauge plus clair)
- **Accent secondaire** : `#D4B896` (caramel plus clair)
- **Liens/interactivité** : `#7A9AAB` (bleu-gris plus clair)

## 2. Style graphique général

### Philosophie
Design moderne-chaleureux, épuré et accueillant. L'interface doit favoriser la lecture longue et l'immersion narrative tout en restant intuitive pour la création collaborative.

### Caractéristiques visuelles
- **Formes** : Coins arrondis généreux (8-12px pour les cartes, 6-8px pour les boutons)
- **Espacement** : Généreux, aéré (padding important autour du contenu textuel)
- **Typographie** :
    - Titres : Police sans-serif moderne (type Inter, Outfit, ou Manrope)
    - Corps de texte : Police serif pour le confort de lecture (type Merriweather, Lora, ou Source Serif)
    - Hiérarchie claire entre titres, sous-titres et paragraphes
- **Illustrations** : Style line-art minimaliste, traits fins et épurés
- **Ombres** : Douces et subtiles, jamais dures (box-shadow légères)
- **Animations** : Fluides et naturelles, transitions de 200-300ms

### Inspiration
- Lisibilité : Medium, Substack
- Communauté : Wattpad (mais en plus épuré)
- Interface : Notion (clarté et organisation)

## 3. Logo - Description détaillée

### Concept
Le logo représente un livre ouvert dont les pages se transforment en chemins narratifs qui se séparent, symbolisant les embranchements d'histoires et les choix multiples offerts aux lecteurs.

### Composition visuelle

**Élément central : Le livre**
- Livre ouvert vu de face, stylisé et minimaliste
- Deux pages visibles formant un V inversé
- Trait de contour fin et uniforme (2-3px de stroke)
- Proportions : livre compact, pas trop étiré en largeur

**Les embranchements narratifs**
- À partir du haut des pages du livre, 3 à 5 lignes s'élèvent et divergent
- Ces lignes représentent des chemins/histoires qui se séparent
- Elles partent groupées puis se divisent en Y ou en fourche
- Style organique mais géométrique : courbes douces, pas de lignes rigides
- Épaisseur identique au contour du livre pour l'unité visuelle

**Structure technique**
- Dessin en line-art uniquement (pas de remplissage, seulement des contours)
- Symétrie centrale pour équilibre et harmonie
- Les embranchements peuvent former subtilement un arbre inversé
- Option : intégrer discrètement les lettres U et S dans la structure

### Style et contraintes
- **Couleur** : Monochrome initialement (noir `#1A1A1A` pour thème clair, blanc cassé `#F5F5F7` pour thème sombre)
- **Variante accent** : Possibilité d'utiliser le vert sauge `#7B9E87` pour certains embranchements
- **Format** : SVG vectoriel, scalable
- **Dimensions** : Carré (viewBox 100x100 ou 200x200)
- **Traits** : stroke-linecap="round" et stroke-linejoin="round" pour adoucir
- **Simplicité** : Maximum 15-20 paths pour rester lisible même en petit

### Variations nécessaires
1. **Logo complet** : Avec nom "UrStory" à côté (typographie sans-serif moderne)
2. **Logo seul** : Icône standalone pour favicon, app mobile
3. **Version inversée** : Pour fond sombre

### Atmosphère recherchée
Équilibre entre :
- Littéraire et technologique
- Créatif et structuré
- Accessible et raffiné
- Communautaire (embranchements = contributions multiples)

Le logo doit évoquer instantanément l'idée de récits qui se ramifient et de parcours narratifs multiples, tout en restant élégant et mémorable.
