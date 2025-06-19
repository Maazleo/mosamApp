import 'package:flutter/material.dart';
import 'weather_screen.dart';  // Ensure this points to your WeatherScreen widget

void main() {
  runApp(MyWeatherApp());
}

class MyWeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mosam',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey, // This automatically adjusts primaryColor
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent, // Ensuring AppBar is transparent
          elevation: 0, // No shadow for a flat design
          titleTextStyle: TextStyle(
            color: Colors.white60,
            fontSize: 29,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
        ),
      ),
      home: WeatherScreen(),
    );
  }
}
