# Voice Banking

Voice Banking is a cutting-edge application designed to simplify everyday banking operations through voice commands in your local language. It leverages state-of-the-art technologies to deliver a seamless, user-friendly, and multilingual voice banking experience.

## Features

- Perform common banking operations like account balance inquiries, fund transfers, and transaction history checks.
- Support for multiple local languages for better accessibility.
- Advanced voice recognition powered by **Whisper** and **IndicWhisper** for high accuracy.
- Context-aware responses through **Prompt Engineering** and **LLama 3** for natural conversations.
- Cross-platform compatibility built using **Flutter**.

## Technology Stack

- **Python**: Core backend logic and integration with machine learning models.
- **Flutter**: Frontend framework for building a responsive, cross-platform user interface.
- **LLama 3**: Language model for generating context-aware and natural conversations.
- **Whisper & IndicWhisper**: High-performance voice recognition systems optimized for multilingual support.
- **Prompt Engineering**: Fine-tuned prompts to improve interaction quality and contextual accuracy.

## Setup

# Python App Setup Guide

## Prerequisites
1. **Python (Recomeded Version: 3.10.16)**
2. **Llama 3**

### 1. Go to service dir
```bash
cd service
```

### 2. Install Dependencies
```bash
pip install -r requirements.txt
```

### 3. Run the app
```bash
uvicorn main:app --host localhost --port 8000 --reload
```

# Flutter App Setup Guide

## Prerequisites

Before getting started, ensure you have the following installed:

1. **Flutter SDK (Recomeded Version: 3.27.0)**: [Install Flutter](https://flutter.dev/docs/get-started/install)
2. **Dart SDK**: Bundled with Flutter SDK
3. **IDE**: [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)
4. **Xcode** (for iOS development): [Install Xcode](https://developer.apple.com/xcode/)

## Setup Steps

### 1. Clone the Repository

```bash
git clone https://github.com/joshsoftware/voice-banking.git
```

### 2. Install Dependencies
Run the following command to install Flutter dependencies:

```bash
flutter pub get
```
### 3. Run the App
To run the app on a connected device or emulator:

```bash
flutter run
```
