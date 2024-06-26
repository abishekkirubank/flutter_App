import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Weather());
}

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Weather_app(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Weather_app extends StatefulWidget {
  @override
  State<Weather_app> createState() => _Weather_appState();
}

class _Weather_appState extends State<Weather_app> {
  String _cityName = 'Your City';
  double _temperature = 0;
  String _weatherDescription = '';
  String animationPath = '';
  bool _isLoading = false;
  final TextEditingController _cityController = TextEditingController();
  bool _isSearching = false;

  Future<void> _fetchWeather(String cityName) async {
    setState(() {
      _isLoading = true;
    });

    final apiKey = '0ba6031f54822104026f5003f2fd5c5b';
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');

    try {
      final response = await http.get(url);

      final responseData = json.decode(response.body);

      final weatherDescription = responseData['weather'][0]['description'];

      setState(() {
        _temperature = responseData['main']['temp'];
        _weatherDescription = weatherDescription;
        animationPath = getAnimationPath(weatherDescription);
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      print('Error fetching weather: $error');
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      _cityName = await _getCityName(position.latitude, position.longitude);
      await _fetchWeather(_cityName);
    } catch (error) {
      print('Error getting current location: $error');
    }
  }

  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<String> _getCityName(double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);

    return placemarks[0].locality ?? 'Unknown';
  }

  String getAnimationPath(String _weatherDescription) {
    switch (_weatherDescription.toLowerCase()) {
      case 'clear':
        return 'assets/sunny.json';
      case 'clouds':
      case "mist":
      case "smoke":
      case "haze":
      case "fog":
        return 'assets/Cloud.json';
      case 'rain':
      case "drizzle":
      case "shower rain":
      case "Light rain":
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      default:
        return 'assets/sunny.json';
    }
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _cityController.clear();
    });
  }
  void _handleSubmit(String cityName) {
    setState(() {
      _cityName = cityName;
    });
    _fetchWeather(cityName);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title:_isSearching
                ? TextField(
              controller: _cityController,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _cityController.clear();
                  },
                ),
              ),
              onSubmitted: _handleSubmit,
            )
                : FutureBuilder<String>(
              future: _getCityNameFromLocation(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Fetching location...');
                }
                if (snapshot.hasData) {
                  return Text(snapshot.data!);
                } else {
                  return Text('Unknown');
                }
              },
            ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                _isSearching ? _stopSearch() : _startSearch();
              },
            ),
          ],),
        body: SingleChildScrollView(
          child: Container(
            height: 710,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/bgimage.jpg"), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                _isLoading
                    ? Container(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Lottie.asset(
                              getAnimationPath(
                                  _weatherDescription), // Replace with your Lottie animation file path
                              width: 200,
                              height: 200,
                            ),
                            SizedBox(height: 20),
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: TextField(
                                  controller: _cityController,
                                  decoration: InputDecoration(
                                    labelText: 'Enter city name',
                                    hintText: 'e.g. London',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _cityName = _cityController.text;
                                });
                                _fetchWeather(_cityName);
                              },
                              child: Text(
                                'Get Weather',
                                style: GoogleFonts.abel(),
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(50, 100, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    'Temperature: $_temperature°C',
                                    style: GoogleFonts.abel(),

                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Weather: $_weatherDescription',
                                    style: GoogleFonts.abel(),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'CityName: $_cityName',
                                  style: GoogleFonts.abel(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  placemarkFromCoordinates(double latitude, double longitude) {}
  Future<String> _getCityNameFromLocation() async {
    try {
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      String cityName =
      await _getCityName(position.latitude, position.longitude);
      return _cityName;
      return cityName;
    } catch (error) {
      print('Error getting current location: $error');
      return 'Unknown';
    }
  }
}
class Placemark {
  get locality => null;
}
