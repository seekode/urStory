# UrStory - Charte Graphique

## 1. Palettes de couleurs

### Thème clair

#### Fonds et surfaces
- **Background principal** : `#FAF9F7` (crème ultra-doux, pour toute l'app)
- **Surface élevée** : `#FFFFFF` (blanc pur, pour navbar, modales, cartes principales)
- **Surface secondaire** : `#F0EDE8` (beige très clair, pour zones de distinction subtile)

#### Textes
- **Texte principal** : `#1F1F1F` (quasi-noir, corps de texte, titres)
- **Texte secondaire** : `#5A5A5A` (gris moyen, métadonnées, sous-titres)
- **Texte tertiaire** : `#8E8E8E` (gris clair, placeholder, infos non-critiques)

#### Accents et interactions
- **Accent primaire** : `#6B9080` (vert sauge équilibré, actions principales, liens)
- **Accent primaire hover** : `#5A7A6B` (vert sauge foncé, états hover/pressed)
- **Accent secondaire** : `#D4A574` (caramel chaleureux, badges, tags spéciaux)
- **Accent tertiaire** : `#A4B8C4` (bleu-gris doux, éléments secondaires)

#### États et feedback
- **Succès** : `#7BA882` (vert doux)
- **Erreur** : `#D87676` (rouge doux)
- **Attention** : `#E8B863` (jaune-orangé doux)
- **Info** : `#7BA5BC` (bleu doux)

#### Bordures et séparateurs
- **Bordure subtile** : `#E8E5E0` (beige très clair, séparateurs discrets)
- **Bordure visible** : `#D4CFC7` (beige moyen, cadres, délimitations)

---

### Thème sombre

#### Fonds et surfaces
- **Background principal** : `#1A1A1C` (noir-gris très foncé, pour toute l'app)
- **Surface élevée** : `#252527` (gris foncé, navbar, modales, cartes principales)
- **Surface secondaire** : `#2E2E30` (gris moyen-foncé, zones de distinction)

#### Textes
- **Texte principal** : `#F0F0F2` (blanc cassé, corps de texte, titres)
- **Texte secondaire** : `#B8B8BD` (gris clair, métadonnées, sous-titres)
- **Texte tertiaire** : `#75757A` (gris moyen, placeholder, infos non-critiques)

#### Accents et interactions
- **Accent primaire** : `#83AB96` (vert sauge lumineux, actions principales, liens)
- **Accent primaire hover** : `#9DBFAC` (vert sauge plus clair, états hover/pressed)
- **Accent secondaire** : `#D9B388` (caramel lumineux, badges, tags spéciaux)
- **Accent tertiaire** : `#99B4C9` (bleu-gris lumineux, éléments secondaires)

#### États et feedback
- **Succès** : `#8CBB92` (vert doux lumineux)
- **Erreur** : `#E68989` (rouge doux lumineux)
- **Attention** : `#F0C670` (jaune-orangé doux lumineux)
- **Info** : `#8AB7CE` (bleu doux lumineux)

#### Bordures et séparateurs
- **Bordure subtile** : `#38383A` (gris foncé, séparateurs discrets)
- **Bordure visible** : `#4A4A4D` (gris moyen-foncé, cadres, délimitations)

---

## 2. Règles d'utilisation des couleurs

### Navigation (Navbar, TabBar)
- **Fond** : `Surface élevée` (#FFFFFF en clair, #252527 en sombre)
- **Item actif** : `Accent primaire` pour l'icône + texte
- **Item inactif** : `Texte tertiaire`
- **Ombre** : Ombre douce (0px 2px 8px rgba(0,0,0,0.08) en clair, 0px 2px 12px rgba(0,0,0,0.3) en sombre)

### Cartes de contenu (Stories, Chapters)
- **Fond** : `Surface élevée` (#FFFFFF en clair, #252527 en sombre)
- **Bordure** : `Bordure subtile` (optionnelle)
- **Ombre** : Douce (0px 1px 3px rgba(0,0,0,0.06))
- **Titre** : `Texte principal`
- **Description** : `Texte secondaire`
- **Métadonnées** : `Texte tertiaire`

### Badges et tags (Genre, catégories)
- **Fond** : `Accent primaire` avec opacity 0.12
- **Texte** : `Accent primaire`
- **Coins arrondis** : 6px
- **Padding** : 6px horizontal, 4px vertical

### Boutons principaux (CTA)
- **Fond** : `Accent primaire`
- **Texte** : `#FFFFFF`
- **Hover/Pressed** : `Accent primaire hover`
- **Coins arrondis** : 8px
- **Ombre** : Légère (0px 2px 4px rgba(107,144,128,0.2))

### Boutons secondaires
- **Fond** : `Surface secondaire` en clair, `Surface élevée` en sombre
- **Texte** : `Accent primaire`
- **Bordure** : `Bordure visible` (1px)
- **Hover** : Fond avec `Accent primaire` opacity 0.08

### Zones de lecture (Chapitres)
- **Fond** : `Background principal` (#FAF9F7 en clair, #1A1A1C en sombre)
- **Texte** : `Texte principal`
- **Paragraphes** : Police serif, line-height 1.7, max-width 680px
- **Liens internes** : `Accent primaire` souligné au hover

### Inputs et formulaires
- **Fond** : `Surface élevée`
- **Bordure inactive** : `Bordure visible`
- **Bordure focus** : `Accent primaire` (2px)
- **Texte** : `Texte principal`
- **Placeholder** : `Texte tertiaire`

### Dividers et séparateurs
- **Lignes fines** : `Bordure subtile` (1px)
- **Lignes marquées** : `Bordure visible` (1px)

---

## 3. Style graphique général

### Philosophie
Design moderne-chaleureux, épuré et accueillant. L'interface doit favoriser la lecture longue et l'immersion narrative tout en restant intuitive pour la création collaborative.

### Caractéristiques visuelles
- **Formes** :
  - Conteneurs flottants (navbar, modales) : 28px border-radius
  - Cartes : 16px border-radius
  - Boutons : 12px border-radius
  - Tags/badges : 8px border-radius
  - Inputs : 12px border-radius
- **Espacement** : 
  - Padding cartes : 16px
  - Spacing entre éléments : 12px (petit), 24px (moyen), 40px (grand)
  - Marges latérales : 20px (mobile), 24px (tablet+)
- **Typographie** : 
  - **Sans-serif** (UI, titres, navigation) : Inter, Outfit, ou Manrope
    - Titre principal : 24px, weight 700
    - Titre secondaire : 20px, weight 600
    - Titre tertiaire : 16px, weight 600
    - Corps UI : 14px, weight 400
    - Caption : 12px, weight 400
  - **Serif** (lecture de chapitres) : Merriweather, Lora, ou Source Serif Pro
    - Corps de lecture : 17px, weight 400, line-height 1.7
    - Titre de chapitre : 28px, weight 700
- **Ombres** : 
  - Légère : `0px 1px 3px rgba(0,0,0,0.06)`
  - Moyenne : `0px 2px 8px rgba(0,0,0,0.08)`
  - Forte : `0px 4px 16px rgba(0,0,0,0.12)`
- **Animations** : 
  - Durée standard : 200ms
  - Easing : cubic-bezier(0.4, 0.0, 0.2, 1)
  - Hover states : transition sur background, color, transform

### Inspiration
- Lisibilité : Medium, Substack
- Communauté : Wattpad (mais en plus épuré)
- Interface : Notion (clarté et organisation)

---

## 4. Logo - Description détaillée

### Concept
Le logo représente un livre ouvert dont les pages se transforment en chemins narratifs qui se séparent, symbolisant les embranchements d'histoires et les choix multiples offerts aux lecteurs.

### Composition visuelle

**Élément central : Le livre**
- Livre ouvert vu de face, stylisé et minimaliste
- Deux pages visibles formant un V inversé
- Trait de contour fin et uniforme (2px de stroke)
- Proportions : livre compact, largeur ~60% de la hauteur totale du logo

**Les embranchements narratifs**
- À partir du haut des pages du livre, 3 à 5 lignes s'élèvent et divergent
- Ces lignes représentent des chemins/histoires qui se séparent
- Elles partent groupées (comme une tige) puis se divisent en Y ou en fourche à mi-hauteur
- Style : courbes douces et organiques (Bézier curves), pas de lignes rigides
- Épaisseur identique au contour du livre (2px) pour l'unité visuelle
- Les embranchements forment subtilement la silhouette d'un arbre inversé

**Proportions et structure**
- Livre : 1/3 inférieur du logo
- Embranchements : 2/3 supérieurs du logo
- Symétrie centrale parfaite pour équilibre
- Espacement harmonieux entre les branches

### Style et contraintes techniques

**Couleurs**
- **Version principale** : Monochrome `Accent primaire` (#6B9080 clair, #83AB96 sombre)
- **Version icon seul** : Monochrome `Texte principal` (#1F1F1F clair, #F0F0F2 sombre)
- **Variation subtile** (optionnelle) : Livre en `Texte principal`, embranchements en `Accent primaire`

**Format SVG**
- ViewBox : `0 0 100 100` (carré)
- Paths uniquement (pas de shapes complexes)
- stroke-width : 2
- stroke-linecap : "round"
- stroke-linejoin : "round"
- fill : "none" (line-art uniquement)
- Optimisé pour scaling (lisible à 24x24px minimum)

**Contraintes de simplicité**
- Maximum 12-15 paths pour performance
- Pas de dégradés, pas de filtres
- Compatible avec export 1-color pour favicon

### Variations nécessaires

1. **Logo complet horizontal**
   - Icône + "UrStory" en sans-serif (Inter/Outfit)
   - Espacement : 12px entre icône et texte
   - Texte : weight 600, même hauteur que le logo
   - Usage : Header desktop, splash screen

2. **Logo icône seul**
   - 100x100px carré
   - Usage : App icon, favicon, navbar mobile

3. **Logo inversé**
   - Version pour fonds sombres
   - Utilise les couleurs du thème sombre

### Atmosphère recherchée
Le logo doit évoquer instantanément :
- L'idée de récits qui se ramifient
- La notion de parcours narratifs multiples et de choix
- L'aspect communautaire (chaque branche = une contribution possible)
- Un équilibre entre littérature classique (le livre) et modernité (les embranchements stylisés)

Le résultat doit être élégant, mémorable, et fonctionner aussi bien en petit (favicon 16x16) qu'en grand (splash screen).

---

## 5. Code Flutter - Palette complète
```dart
import 'package:flutter/material.dart';

/// App color palette for UrStory
class AppColors {
  AppColors._();
  
  // ===== LIGHT THEME =====
  
  // Backgrounds & Surfaces
  static const Color lightBackgroundPrimary = Color(0xFFFAF9F7); // Main app background
  static const Color lightSurfaceElevated = Color(0xFFFFFFFF); // Cards, navbar, modals
  static const Color lightSurfaceSecondary = Color(0xFFF0EDE8); // Secondary distinction zones
  
  // Text Colors
  static const Color lightTextPrimary = Color(0xFF1F1F1F); // Body text, titles
  static const Color lightTextSecondary = Color(0xFF5A5A5A); // Metadata, subtitles
  static const Color lightTextTertiary = Color(0xFF8E8E8E); // Placeholders, non-critical info
  
  // Accent Colors
  static const Color lightAccentPrimary = Color(0xFF6B9080); // Main actions, links
  static const Color lightAccentPrimaryHover = Color(0xFF5A7A6B); // Hover/pressed states
  static const Color lightAccentSecondary = Color(0xFFD4A574); // Badges, special tags
  static const Color lightAccentTertiary = Color(0xFFA4B8C4); // Secondary elements
  
  // Status Colors
  static const Color lightSuccess = Color(0xFF7BA882);
  static const Color lightError = Color(0xFFD87676);
  static const Color lightWarning = Color(0xFFE8B863);
  static const Color lightInfo = Color(0xFF7BA5BC);
  
  // Borders & Dividers
  static const Color lightBorderSubtle = Color(0xFFE8E5E0); // Subtle separators
  static const Color lightBorderVisible = Color(0xFFD4CFC7); // Frames, delimitations
  
  // ===== DARK THEME =====
  
  // Backgrounds & Surfaces
  static const Color darkBackgroundPrimary = Color(0xFF1A1A1C); // Main app background
  static const Color darkSurfaceElevated = Color(0xFF252527); // Cards, navbar, modals
  static const Color darkSurfaceSecondary = Color(0xFF2E2E30); // Secondary distinction zones
  
  // Text Colors
  static const Color darkTextPrimary = Color(0xFFF0F0F2); // Body text, titles
  static const Color darkTextSecondary = Color(0xFFB8B8BD); // Metadata, subtitles
  static const Color darkTextTertiary = Color(0xFF75757A); // Placeholders, non-critical info
  
  // Accent Colors
  static const Color darkAccentPrimary = Color(0xFF83AB96); // Main actions, links
  static const Color darkAccentPrimaryHover = Color(0xFF9DBFAC); // Hover/pressed states
  static const Color darkAccentSecondary = Color(0xFFD9B388); // Badges, special tags
  static const Color darkAccentTertiary = Color(0xFF99B4C9); // Secondary elements
  
  // Status Colors
  static const Color darkSuccess = Color(0xFF8CBB92);
  static const Color darkError = Color(0xFFE68989);
  static const Color darkWarning = Color(0xFFF0C670);
  static const Color darkInfo = Color(0xFF8AB7CE);
  
  // Borders & Dividers
  static const Color darkBorderSubtle = Color(0xFF38383A); // Subtle separators
  static const Color darkBorderVisible = Color(0xFF4A4A4D); // Frames, delimitations
}
```
