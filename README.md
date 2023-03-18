# ChatGPT Voice Assistant App

The ChatGPT Voice Assistant App is a basic voice assistant app built with Flutter and OpenAI's GPT-3.5 language model.

## Features

- Responds to voice commands using OpenAI's GPT-3.5 language model.
- Displays responses in a chat interface.
- Allows users to tap a button to speak their command, or type it in manually.
- Includes basic error handling for when the app cannot understand a command.

## Getting Started

To get started with the app, clone this repository and run `flutter run` in the project directory.

You will need to have a valid OpenAI API key to use the app. Once you have obtained an API key, you can add it to the `lib/utils/openai.dart` file.

## Usage

When the app is launched, you can tap the microphone button to speak your command. Alternatively, you can type your command in the chat interface.

The app will send your command to the OpenAI API, which will respond with a text message. The response will be displayed in the chat interface.

## Dependencies

The app has the following dependencies:

- `flutter_tts`: A Flutter plugin that provides text-to-speech functionality.
- `speech_to_text`: A Flutter plugin that provides speech-to-text functionality.
- `http`: A Flutter plugin that provides HTTP client functionality.

These dependencies are listed in the `pubspec.yaml` file and will be installed automatically when you run `flutter pub get`.

## Contributing

Contributions to this project are welcome! If you find a bug or have a suggestion for a new feature, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
