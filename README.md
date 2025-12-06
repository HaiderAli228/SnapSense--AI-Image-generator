# SnapSense - AI Image Generator

SnapSense is a powerful Flutter application that leverages the capabilities of **Stability AI** to generate high-quality images from text prompts. Designed with a clean and responsive user interface, it provides a seamless experience for users to turn their creative ideas into visual reality.

## 🚀 Features

- **Text-to-Image Generation**: Instantly generate images by simply entering a descriptive text prompt.
- **High-Quality Output**: Utilizes Stability AI's `stable-image/generate/core` API for premium image quality.
- **Responsive Design**: Optimized for a smooth experience across different devices.
- **State Management**: Built using the **Bloc** pattern for efficient and predictable state management.
- **Modern UI**: Clean and intuitive interface with immediate visual feedback.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **Language**: [Dart](https://dart.dev/)
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Networking**: [Dio](https://pub.dev/packages/dio)
- **AI Service**: [Stability AI API](https://platform.stability.ai/)

## 📂 Project Structure

lib/
├── model/
│   └── bloc/                 # Bloc state-management logic (Events, States, Blocs)
├── view/
│   └── home_view.dart        # Main UI for prompt input and image display
├── view-model/
│   ├── api_services.dart     # Handles API calls to Stability AI
│   └── api_links.dart        # API configuration and endpoints
├── utils/                    # Utility classes (Colors, Constants)
└── main.dart                 # Application entry point


## ⚡ Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed on your machine.
- An API Key from [Stability AI](https://platform.stability.ai/).

### Installation

1.  **Clone the repository**:
    ```bash
    git clone [https://github.com/HaiderAli228/SnapSense--AI-Image-generator.git](https://github.com/HaiderAli228/SnapSense--AI-Image-generator.git)
    cd snapsense
    ```

2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Configure API Key**:
    - Open `lib/view-model/api_links.dart`.
    - Replace the placeholder with your actual Stability AI API key:
      ```dart
      static const String apiKey = "YOUR_STABILITY_AI_API_KEY";
      ```

4.  **Run the app**:
    ```bash
    flutter run
    ```

## 👨‍💻 Developer

**Haider Ali**
*Flutter Developer & Firease Developer*

- 📧 **Email**: [flutter2830@gmail.com](mailto:flutter2830@gmail.com)
- 🌐 **Portfolio**: [https://haiderali228.netlify.app/](https://haiderali228.netlify.app/)

---
*Developed with ❤️ using Flutter.*
