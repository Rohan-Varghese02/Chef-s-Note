# Chef's Note

**Chef's Note** is a beautifully designed **recipe management app** built with **Flutter**. It allows users to explore static recipes, create and customize their own, plan weekly meals, generate smart shopping lists, and follow cooking steps with built-in timers.

---

## 📖 Table of Contents
- [Description](#description)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Dependencies](#dependencies)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)

---

## 📝 Description

RecipeMate transforms your cooking experience by organizing everything you need in one app—from discovering delicious dishes to planning your meals and managing ingredients efficiently.

Whether you're a casual cook or a meal prep enthusiast, RecipeMate helps you streamline your kitchen workflow with user-generated recipes, intuitive meal planners, and timers that keep your cooking perfectly timed.

---

## ✨ Features

- **Built-In Recipes** – Browse a curated collection of static recipes  
- **Create Your Own** – Add, edit, and delete personalized recipes  
- **Weekly Meal Planner** – Plan breakfast, lunch, and dinner for each day  
- **Shopping List Generator** – Auto-generate a grocery list based on planned meals  
- **Step Timers** – Set timers for each recipe step to never overcook again  
- **Local Storage** – Data persistence using Hive for offline access  

---

## 🛠️ Technologies Used

- **Flutter** – Cross-platform UI development  
- **Dart** – Primary programming language  
- **Hive DB** – Lightweight key-value local database  
- **setState** – Simple and effective state management  
- **Google Fonts** – Custom font styles  
- **Shared Preferences** – Quick access to persistent data  
- **Path Provider** – For platform-specific file system paths  
- **Image Picker** – Add photos to your recipes  

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  hive_generator: ^2.0.1
  build_runner: ^2.4.13
  shared_preferences: ^2.3.2
  image_picker: ^1.1.2
  chips_choice: ^3.0.1
  google_fonts: ^6.2.1
  path_provider: ^2.1.5
  dropdown_search: ^6.0.1
  google_nav_bar: ^5.0.7
  cupertino_icons: ^1.0.8
  flutter_native_splash: ^2.4.3
