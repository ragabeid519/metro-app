# 🚇 Cairo Metro Planner Pro

A next-generation transit companion for Cairo commuters. Unlike standard metro apps, **Cairo Metro Planner Pro** leverages real-time geolocation services to bridge the gap between your physical location and the underground network.

---

## 🌟 What Makes This App Unique? (Exclusive Services)

Most metro apps require you to know your starting station. This app changes that by offering **Location-Aware Transit Intelligence**:

- **📍 Smart Proximity Finder:** Not sure where the nearest station is? The app uses GPS to identify the closest metro station to your current coordinates instantly.
- **🚕 Destination Guide:** Enter any destination, and the app won't just show you the route; it will tell you exactly which station you should get off at to be as close as possible to your final stop.
- **🗺️ Direct Map Integration:** One-tap navigation from your current position to the station entrance via Google Maps integration.

---

## ✨ Core Features

- **Optimal Route Planning:** Precise pathfinding across Line 1, 2, and all branches of Line 3 (including Imbaba and Cairo University directions).
- **Dynamic Fare Engine:** Automatic ticket pricing based on the latest 2024/2025 tariff (8, 10, 15, or 20 EGP).
- **Travel Time Analytics:** Estimated trip duration calculated per stop to help you manage your schedule.
- **Interactive Route Cards:** Clear, color-coded directions showing exactly where to change lines and which direction to take.

---

## 🛠️ Technical Excellence

- **Architecture:** Powered by **GetX** for high-performance state management and clean dependency injection.
- **Geo-Services:** Uses `Geolocator` for high-accuracy positioning and `Geocoding` for address-to-station mapping.
- **Robust Error Handling:** Features a custom error recovery system to ensure a seamless user experience even without GPS or internet.

---

## 📸 Screenshots & Demo

| Smart Proximity | Route Planning | Ticket Details |
| :---: | :---: | :---: |
| ![Proximity UI](https://via.placeholder.com/200x400?text=Nearest+Station) | ![Search](https://via.placeholder.com/200x400?text=Smart+Route) | ![Fare](https://via.placeholder.com/200x400?text=Ticket+Price) |

---

## 🚀 Installation & Setup

1. **Clone the project:**
   ```bash
   git clone [https://github.com/ragabeid519/metro-app.git](https://github.com/ragabeid519/metro-app.git)

   ## 🛠️ Environment & Installation

To ensure full compatibility with the latest Flutter build tools and **Java 21**, please follow these steps:

* **Environment Check:**
    * **Java Version:** 21+
    * **Gradle Version:** 8.5 (Recommended)
* **Run Commands:**
    ```bash
    flutter pub get
    flutter run
    ```

---

## 📂 Inside the Code (Architecture)

The project follows a clean, controller-based architecture using **GetX** for maximum performance and separation of concerns:

| File | Role | Description |
| :--- | :--- | :--- |
| `metro_service.dart` | 🧠 **The Brain** | Handles complex route logic, station indexing, and dynamic fare calculations. |
| `home_controller.dart` | 🕹️ **State Management** | Manages reactive UI updates, GPS location triggers, and data flow. |
| `metro_constants.dart` | 📊 **The Database** | A comprehensive registry of all Cairo Metro lines (1, 2, & 3) and coordinates. |

---

## 🌟 Unique Selling Point (Proximity Logic)

> **Why this app?** > Unlike standard transit apps, this project features **Proximity Logic**. It empowers users to find the nearest entry point to the metro network based on their real-time GPS coordinates—providing a seamless "bridge" between the street and the station.

---

## 👤 Developed By

**Ragab Eid** *Transforming the way we move in Cairo.*

[![GitHub](https://img.shields.io/badge/GitHub-Profile-181717?style=for-the-badge&logo=github)](https://github.com/ragabeid519)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Profile-0A66C2?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/ragabeid/)