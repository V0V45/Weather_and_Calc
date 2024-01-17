import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:flutter_application_3/weather_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: _MainWeatherWidget(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const _MainWeatherWidget(),
        '/search': (BuildContext context) => const SearchWidget(),
      },
    );
  }
}

class _MainWeatherWidget extends StatefulWidget {
  const _MainWeatherWidget({super.key});

  @override
  State<_MainWeatherWidget> createState() => __MainWeatherWidgetState();
}

class __MainWeatherWidgetState extends State<_MainWeatherWidget> {
  String currentCity = 'Looking for your city...';
  String currentWeather = '';
  AssetImage currentWeatherBackground =
      const AssetImage('assets/images/noweather.png');
  String currentTemperature = '\u2103';
  //завтра
  String tomorrowDate =
      '${DateTime.now().add(Duration(days: 1)).day.toString()}.${DateTime.now().add(Duration(days: 1)).month.toString()}';
  String tomorrowTemperature = '\u2103';
  String tomorrowWeather = '';
  String tomorrowWeatherIcon = 'assets/images/loadingicon.png';
  //послезавтра
  String tdatomorrowDate =
      '${DateTime.now().add(Duration(days: 2)).day.toString()}.${DateTime.now().add(Duration(days: 2)).month.toString()}';
  String tdatomorrowTemperature = '\u2103';
  String tdatomorrowWeather = '';
  String tdatomorrowWeatherIcon = 'assets/images/loadingicon.png';
  //через 3 дня
  String threeDaysDate =
      '${DateTime.now().add(Duration(days: 3)).day.toString()}.${DateTime.now().add(Duration(days: 3)).month.toString()}';
  String threeDaysTemperature = '\u2103';
  String threeDaysWeather = '';
  String threeDaysWeatherIcon = 'assets/images/loadingicon.png';
  // через 4 дня
  String fourDaysDate =
      '${DateTime.now().add(Duration(days: 4)).day.toString()}.${DateTime.now().add(Duration(days: 4)).month.toString()}';
  String fourDaysTemperature = '\u2103';
  String fourDaysWeather = '';
  String fourDaysWeatherIcon = 'assets/images/loadingicon.png';
  // через 5 дней
  String fiveDaysDate =
      '${DateTime.now().add(Duration(days: 5)).day.toString()}.${DateTime.now().add(Duration(days: 5)).month.toString()}';
  String fiveDaysTemperature = '\u2103';
  String fiveDaysWeather = '';
  String fiveDaysWeatherIcon = 'assets/images/loadingicon.png';
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  void getBackground() async {
    if (currentWeather == 'Clouds') {
      currentWeatherBackground = const AssetImage('assets/images/cloudy.jpg');
    } else if (currentWeather == 'Clear') {
      currentWeatherBackground = const AssetImage('assets/images/clear.jpg');
    } else if (currentWeather == 'Snow') {
      currentWeatherBackground = const AssetImage('assets/images/snow.jpg');
    } else {
      currentWeatherBackground =
          const AssetImage('assets/images/noweather.png');
    }
  }

  void getIconForecast() async {
    if (tomorrowWeather == 'Clouds') {
      tomorrowWeatherIcon = 'assets/images/cloudyicon.png';
    } else if (tomorrowWeather == 'Clear') {
      tomorrowWeatherIcon = 'assets/images/clearicon.png';
    } else if (tomorrowWeather == 'Rain') {
      tomorrowWeatherIcon = 'assets/images/rainicon.png';
    } else if (tomorrowWeather == 'Snow') {
      tomorrowWeatherIcon = 'assets/images/snowicon.png';
    }

    if (tdatomorrowWeather == 'Clouds') {
      tdatomorrowWeatherIcon = 'assets/images/cloudyicon.png';
    } else if (tdatomorrowWeather == 'Clear') {
      tdatomorrowWeatherIcon = 'assets/images/clearicon.png';
    } else if (tdatomorrowWeather == 'Rain') {
      tdatomorrowWeatherIcon = 'assets/images/rainicon.png';
    } else if (tdatomorrowWeather == 'Snow') {
      tdatomorrowWeatherIcon = 'assets/images/snowicon.png';
    }

    if (threeDaysWeather == 'Clouds') {
      threeDaysWeatherIcon = 'assets/images/cloudyicon.png';
    } else if (threeDaysWeather == 'Clear') {
      threeDaysWeatherIcon = 'assets/images/clearicon.png';
    } else if (threeDaysWeather == 'Rain') {
      threeDaysWeatherIcon = 'assets/images/rainicon.png';
    } else if (threeDaysWeather == 'Snow') {
      threeDaysWeatherIcon = 'assets/images/snowicon.png';
    }

    if (fourDaysWeather == 'Clouds') {
      fourDaysWeatherIcon = 'assets/images/cloudyicon.png';
    } else if (fourDaysWeather == 'Clear') {
      fourDaysWeatherIcon = 'assets/images/clearicon.png';
    } else if (fourDaysWeather == 'Rain') {
      fourDaysWeatherIcon = 'assets/images/rainicon.png';
    } else if (fourDaysWeather == 'Snow') {
      fourDaysWeatherIcon = 'assets/images/snowicon.png';
    }

    if (fiveDaysWeather == 'Clouds') {
      fiveDaysWeatherIcon = 'assets/images/cloudyicon.png';
    } else if (fiveDaysWeather == 'Clear') {
      fiveDaysWeatherIcon = 'assets/images/clearicon.png';
    } else if (fiveDaysWeather == 'Rain') {
      fiveDaysWeatherIcon = 'assets/images/rainicon.png';
    } else if (fiveDaysWeather == 'Snow') {
      fiveDaysWeatherIcon = 'assets/images/snowicon.png';
    }
  }

  void getWeather() async {
    double lat = 59.93873;
    double lon = 30.31623; // для СПб
    String key = '4b26909b7af326e267e5fdd38e6ae022';
    WeatherFactory wf = WeatherFactory(key);
    Weather w = await wf.currentWeatherByLocation(lat, lon);
    String temp = (w.temperature.toString())
        .substring(0, w.temperature.toString().indexOf('C') - 1);
    List<Weather> forecast = await wf.fiveDayForecastByLocation(lat, lon);
    // завтра
    String tmrwtemp = (forecast[7].temperature.toString())
        .substring(0, forecast[7].temperature.toString().indexOf('C') - 1);
    String tmrwweather = (forecast[7].weatherMain!);
    // послезавтра
    String tdatmrwtemp = (forecast[15].temperature.toString())
        .substring(0, forecast[15].temperature.toString().indexOf('C') - 1);
    String tdatmrwweather = (forecast[15].weatherMain!);
    // через 3 дня
    String in3daystemp = (forecast[23].temperature.toString())
        .substring(0, forecast[23].temperature.toString().indexOf('C') - 1);
    String in3daysweather = (forecast[23].weatherMain!);
    // через 4 дня
    String in4daystemp = (forecast[31].temperature.toString())
        .substring(0, forecast[31].temperature.toString().indexOf('C') - 1);
    String in4daysweather = (forecast[31].weatherMain!);
    // через 5 дня
    String in5daystemp = (forecast[39].temperature.toString())
        .substring(0, forecast[39].temperature.toString().indexOf('C') - 1);
    String in5daysweather = (forecast[39].weatherMain!);
    setState(() {
      currentCity = w.areaName!;
      currentWeather = w.weatherMain!;
      getBackground();
      currentTemperature = '$temp \u2103';
      tomorrowTemperature = '$tmrwtemp \u2103';
      tdatomorrowTemperature = '$tdatmrwtemp \u2103';
      threeDaysTemperature = '$in3daystemp \u2103';
      fourDaysTemperature = '$in4daystemp \u2103';
      fiveDaysTemperature = '$in5daystemp \u2103';
      tomorrowWeather = tmrwweather;
      tdatomorrowWeather = tdatmrwweather;
      threeDaysWeather = in3daysweather;
      fourDaysWeather = in4daysweather;
      fiveDaysWeather = in5daysweather;
      getIconForecast();
    });
  }

  void changeBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.of(context).pushReplacementNamed('/search');
      } else if (index == 0) {
        Navigator.of(context).pushReplacementNamed('/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentCity),
        backgroundColor: Colors.orange,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Weather'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search')
        ],
        currentIndex: _selectedIndex,
        onTap: changeBottomBar,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: currentWeatherBackground,
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                currentTemperature,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
            ),
            Container(
              child: Text(
                currentWeather,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              width: double.infinity,
              color: Colors.black26,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text(tomorrowDate,
                            style: const TextStyle(color: Colors.white)),
                        Text(tomorrowTemperature,
                            style: const TextStyle(color: Colors.white)),
                        Expanded(child: Image.asset(tomorrowWeatherIcon)),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          tdatomorrowDate,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          tdatomorrowTemperature,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Expanded(child: Image.asset(tdatomorrowWeatherIcon)),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          threeDaysDate,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          threeDaysTemperature,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Expanded(child: Image.asset(threeDaysWeatherIcon)),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          fourDaysDate,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          fourDaysTemperature,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Expanded(child: Image.asset(fourDaysWeatherIcon)),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          fiveDaysDate,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          fiveDaysTemperature,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Expanded(child: Image.asset(fiveDaysWeatherIcon)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
