# ⏱️ Dynamic Flutter Pomodoro Timer

A focused productivity application built with Flutter, featuring custom session management, dynamic HSV-based theme color shifts, and micro-animated UI elements.

## 🚀 Key Features
- **Session State Management:** Toggle between Pomodoro (25m), Short Break (5m), and Long Break (15m) modes with automatic session handling.
- **Dynamic HSV Palette:** Real-time background and theme color transitions driven by precise HSV adjustments (`HSVColor.fromAHSV`).
- **Interactive Morphing Button:** Action button that transforms shape, color, and label using `AnimatedContainer` and `AnimatedSwitcher`.
- **Progress Tracking:** Central hero clock with a circular progress indicator synchronized with timer countdown logic.

## 🎨 Design System & Architecture
- **Design Tokens:** Modular design tokens (`AppSpacing`, `AppColors`, `AppTheme`) enforcing consistent padding, radius tokens, and Material 3 theme configurations.
- **State Management:** Reactive architecture powered by `ChangeNotifier` / `ListenableBuilder` separating timer state logic from UI rendering.

## 🛠️ Tech Stack & Concepts Applied
- **Framework:** Flutter & Dart
- **Architecture:** State Controller (`ChangeNotifier`)
- **Key Flutter Widgets:** `AnimatedSwitcher`, `AnimatedContainer`, `Stack`, `CircularProgressIndicator`, `ListenableBuilder`
