# Recipe Manager App

A simple Flutter app to add, edit, delete, and view recipes. Recipes are stored in memory (or optionally local storage).

---

## Features

- Add new recipes with title, description, ingredients, and method
- Edit existing recipes
- Delete recipes
- View list of recipes on the home screen
- In-memory storage of recipes (can be extended to local storage)

---

## Getting Started

### Prerequisites

- Flutter SDK installed (version 3.0 or higher recommended)
- An IDE like VS Code or Android Studio configured for Flutter development
- A connected device or emulator to run the app

---

### Setup Instructions

1. **Clone the repository**

Open up the terminal in your IDE and enter the following.
```bash
git clone https://github.com/yourusername/recipe_manager_app.git
cd recipe_manager_app
```

2. **Install dependencies**
```
flutter pub get
```
3. **Run the app**
```
flutter run
```
Or open the project in your IDE and use its run/debug feature.

## Project Structure

<ul>
<li>lib/main.dart — Entry point of the app, sets up routing and main UI

<li>lib/models/recipe.dart — Recipe data model

<li>lib/providers/recipe_provider.dart — Recipe state management (using ChangeNotifier)

<li>lib/screens/home_screen.dart — Home screen showing recipe list

<li>lib/screens/add_edit_recipe_screen.dart — Screen for adding/editing a recipe
</ul>

---
## Stretch Goals
<ol>
<li>Store Recipes with Local Storage instead of memory
- Perhaps use Hive
<li>Add Photos to Recipes - I'm a visual person and love it when menus in restaurants have a photo of the food, so this is a must
<li>Add search functionality - Eventually will need this with the amount of cooking I do
<li>A share feature - My family are all foodies so this would be cool to add for them
<li>Better UX/UI - My definitely not the prettiest app right now
</ol>

### Happy Cooking! 🍳





