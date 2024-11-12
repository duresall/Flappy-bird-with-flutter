# Flappy Bird with Flutter

A Flutter-based version of the popular game Flappy Bird. This project aims to recreate the classic experience of navigating a bird through obstacles with simple, intuitive gameplay. It's a fun project for practicing Flutter animations, game mechanics, and state management.

## 🎮 Features

- Smooth Bird Animation: Tap to make the bird flap and fly upward, then watch gravity pull it back down.
- Obstacle Generation: Randomly generated pipes appear at intervals, creating new challenges.
- Score Tracker: Keeps track of your high score and encourages replayability.
- Simple Controls: Just tap to play. It is easy to pick up but challenging to master.

## 🚀 Getting Started

  #Prerequisites
  
- Flutter SDK: Install the Flutter SDK to run and build the app.
- Dart: Flutter will handle Dart installation, but ensure your IDE is set up with Dart support.

# Installation 

1. Clone the repository:
     -  git clone https://github.com/duresall/Flappy-bird-with-flutter.git
2. Navigate to the project folder:
     -  cd Flappy-bird-with-flutter
3. Install dependencies:
        flutter pub get
4. Run the app:
     -  flutter run

## 🛠️ Built With
   
- Flutter:- For cross-platform UI development.
- Dart:- Programming language used by Flutter.

## 📂 Project Structure

lib/
├── main.dart                 # App entry point
├── flappy.dart               # Defines the Bird widget and animation
├── obstacles.dart            # Manages obstacle creation and collision logic
├── homepage.dart             # Main game screen layout and mechanics with the scoring logic included 
└── images/                   # images used within the game 

## 📈 Game Logic


- Gravity and Velocity: Controls the bird's movement and adds a natural feel to gameplay.
- Collision Detection: Checks for contact between the bird, obstacles, or the bird and ground.
- Scoring System: Adds a point every time the bird successfully passes through a gap.
