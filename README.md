# 🌦️ Mosam - Flutter Weather App
## 🌐 Live Demo

[Click here to view the live site](https://mosamapka.netlify.app)

![Mosam Banner](https://raw.githubusercontent.com/Maazleo/mosamApp/main/assets/banner.png)

Mosam is a beautiful, fast, and responsive weather app built with Flutter. Instantly get the latest weather updates for any city, with a clean UI and dynamic backgrounds that reflect real-time conditions.

---

## 🚀 Features

- 🔍 **Search Weather by City**: Instantly fetch weather for any city worldwide
- 🌡️ **Current Temperature**: See the temperature in Celsius
- 🌥️ **Weather Conditions**: Get a description (e.g., clear, cloudy, rain, etc.)
- 🕒 **Dynamic Backgrounds**: Background changes based on weather and time (day/night)
- 💧 **Humidity & Feels Like**: See how the weather really feels
- 🌬️ **Wind Speed**: Check wind conditions
- 🇺🇳 **Country & City Display**: Always know where you are
- 📱 **Modern, Responsive UI**: Looks great on all devices

---

## 📸 Screenshots

> _Add screenshots of your app here for better presentation!_

---

## 🛠️ Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- An API key from [OpenWeatherMap](https://openweathermap.org/api)

### Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/Maazleo/mosamApp.git
   cd mosamApp
   ```
2. **Install dependencies:**
   ```sh
   flutter pub get
   ```
3. **Add your OpenWeatherMap API key:**
   - Open `lib/weather_service.dart`
   - Replace the value of `apiKey` with your own key
4. **Run the app:**
   ```sh
   flutter run
   ```

---

## 📂 Project Structure

- `lib/main.dart` - App entry point
- `lib/weather_screen.dart` - Main UI for weather display
- `lib/weather_service.dart` - Handles API requests and background logic
- `lib/images/` - Weather condition images

---

## 📦 Dependencies
- [http](https://pub.dev/packages/http): ^1.2.1
- [cupertino_icons](https://pub.dev/packages/cupertino_icons): ^1.0.6

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📧 Contact

For questions or feedback, reach out via [GitHub Issues](https://github.com/Maazleo/mosamApp/issues) or email: **your.email@example.com**

---

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

---

_Made with ❤️ using Flutter._
