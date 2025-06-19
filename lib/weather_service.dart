import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '03947fbf4ceca572224ae5e6f99dc1a2'; // Use your actual OpenWeatherMap API Key

  Future<Map<String, dynamic>?> fetchWeather(String city) async {
    final url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Failed to load weather data');
      return null;
    }
  }

  String getImagePath(String condition, int timeOfDay) {
    String imagePath = 'lib/images/';
    switch (condition) {
      case 'Clear':
        imagePath += timeOfDay >= 6 && timeOfDay < 18 ? 'clear.png' : 'moon.png';
        break;
      case 'Clouds':
        imagePath += 'cloudy.png';
        break;
      case 'Rain':
        imagePath += 'rain.png';
        break;
      case 'Thunderstorm':
        imagePath += 'stormy.png';
        break;
      case 'haze':
        imagePath += 'stormy.png';
        break;
      default:
        imagePath += 'cll.png'; // Fallback image
        break;
    }
    return imagePath;
  }
}
