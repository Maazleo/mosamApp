import 'package:flutter/material.dart';
import 'weather_service.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  bool _isLoading = true;
  Map<String, dynamic>? _weatherData;
  String _backgroundImage = 'lib/images/rain.png'; // Default background

  @override
  void initState() {
    super.initState();
    _loadWeather('Lahore');
  }

  Future<void> _loadWeather(String city) async {
    setState(() => _isLoading = true);
    var data = await _weatherService.fetchWeather(city);
    if (data != null) {
      String condition = data['weather'][0]['main'];
      int timeOfDay = DateTime.now().hour;
      setState(() {
        _weatherData = data;
        _backgroundImage = _weatherService.getImagePath(condition, timeOfDay);
        _isLoading = false;
      });
    } else {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mosam'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: _showSearchDialog),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _weatherData == null
          ? Center(child: Text('No weather data available.'))
          : Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(36),
              child: outlineText('${_weatherData!['name']}, ${_weatherData!['sys']['country']}', 40),
            ),
            Spacer(flex: 2),
            Stack(
              children: [
                outlineText('${_weatherData!['main']['temp']}°C', 70),
                Positioned(
                  top: 99, // Adjust position according to your layout
                  child: outlineText('${_weatherData!['weather'][0]['description']}', 20),
                ),
              ],
            ),
            Spacer(flex: 2),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 1.3,
              mainAxisSpacing: 14,
              crossAxisSpacing: 15,
              padding: const EdgeInsets.all(27),
              children: <Widget>[
                detailCard('Feels Like', '${_weatherData!['main']['feels_like']} °C'),
                detailCard('Condition', '${_weatherData!['weather'][0]['description']}'),
                detailCard('Humidity', '${_weatherData!['main']['humidity']}%'),
                detailCard('Wind Speed', '${_weatherData!['wind']['speed']} m/s'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget outlineText(String text, double fontSize) {
    return Stack(
      children: <Widget>[
        // Shadow text positions
        textShadow(text, -2, -2, fontSize),
        textShadow(text, -2, 2, fontSize),
        textShadow(text, 2, -2, fontSize),
        textShadow(text, 2, 2, fontSize),
        // Main text
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget textShadow(String text, double offsetX, double offsetY, double fontSize) {
    return Positioned(
      left: offsetX,
      top: offsetY,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget detailCard(String title, String value) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(19),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white)),
          Text(value, style: TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    );
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) {
        String city = '';
        return AlertDialog(
          title: Text('Enter City Name'),
          content: TextField(
            onChanged: (value) => city = value,
            decoration: InputDecoration(hintText: "Search for a city"),
          ),
          actions: [
            TextButton(
              child: Text('Search'),
              onPressed: () {
                Navigator.of(context).pop();
                _loadWeather(city);
              },
            ),
          ],
        );
      },
    );
  }
}
