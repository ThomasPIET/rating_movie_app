# RatingMovieApp

RatingMovieApp est une application mobile permettant aux utilisateurs de rechercher des films, de les noter et de gérer leur propre liste de films. L’application propose une interface intuitive et connecte les utilisateurs à une base de données dynamique pour personnaliser leur expérience cinématographique.

---

## Fonctionnalités principales

- **Recherche de films via TMDB :** Les utilisateurs peuvent rechercher des films par titre, parcourir les informations (affiche, titre, synopsis) et naviguer dans les résultats avec la pagination.
- **Notation des films :**
    - Note globale avec un système d’étoiles.
    - Notation détaillée (histoire, jeu d’acteurs, musique).
    - Ajout d’un avis facultatif.
- **Sauvegarde des données utilisateur :** Les films notés sont sauvegardés pour chaque utilisateur via Firebase Firestore.
- **Affichage des films notés :** Les utilisateurs peuvent consulter, trier et explorer les détails des films qu’ils ont notés.
- **Voir les films les plus populaires :** Une section met en avant les films les plus populaires actuels.
- **Gestion de liste :** Les utilisateurs peuvent ajouter des films à leur liste personnelle pour les retrouver facilement plus tard.
- **Authentification Firebase :** Connexion anonyme ou via Google pour un accès personnalisé.

---

## Technologies utilisées

- **Flutter** : Framework principal pour le développement de l'application mobile.
- **Firebase** :
    - Firebase Auth pour la gestion des utilisateurs.
    - Firebase Firestore pour la sauvegarde des données utilisateur.
- **TMDB API** : Pour la recherche et l’affichage des informations des films.
- **Backend personnel :** Une API backend développée sur mesure pour des besoins spécifiques du projet. [Lien vers le repo](https://github.com/ThomasPIET/rating_movie_app_back)

---

## Installation

Suivez ces étapes pour installer et lancer le projet en local :

1. **Clonez le projet :**
   ```bash
   git clone https://github.com/VOTRE_REPO/ratingmovieapp.git
   cd ratingmovieapp
   ```

2. **Installez les dépendances Flutter :**
   ```bash
   flutter pub get
   ```

3. **Configurez Firebase :**
    - Créez un projet Firebase et ajoutez une application mobile.
    - Téléchargez le fichier `google-services.json` (Android) ou `GoogleService-Info.plist` (iOS) et placez-le dans le répertoire approprié.
    - Ajoutez le package `firebase_core` et initialisez Firebase dans le fichier principal (`main.dart`).

4. **Ajoutez la clé API TMDB :**
    - Créez un compte sur [The Movie Database](https://www.themoviedb.org/) et générez une clé API.
    - Ajoutez la clé API dans le fichier de configuration de l’application.

5. **Démarrez l’application :**
   ```bash
   flutter run
   ```

---

## Structure du projet

Voici une vue d’ensemble de la structure des dossiers :

```
lib/
├── all_popular/            # Section pour les films les plus populaires
├── auth_guard/             # Gestion des protections d’accès utilisateur
├── home/                   # Composants de l’écran d’accueil
├── login/                  # Écran et logique de connexion
├── model/                  # Modèles de données
├── movie_details/          # Détails des films
├── profile/                # Gestion du profil utilisateur
├── search/                 # Barre de recherche et résultats
├── services/               # Services (APIs, Firebase, etc.)
├── shared/                 # Composants partagés et thèmes
│   ├── firebase_options.dart  # Configuration Firebase
│   ├── routes.dart           # Routes de l’application
│   └── theme.dart            # Thèmes globaux
└── main.dart               # Point d'entrée de l'application
```

---

## Statut du projet

**Version actuelle :** V1

La version 1 de l’application est complète, fonctionnelle et prête à l’emploi. De futures améliorations sont prévues pour enrichir l’expérience utilisateur et ajouter de nouvelles fonctionnalités.

