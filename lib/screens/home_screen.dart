import 'package:flutter/material.dart';
import 'package:air_checker/components/change_color.dart';
import 'package:air_checker/screens/details_screen.dart';
import 'package:air_checker/services/air_quality.dart';
import 'package:air_checker/services/weather.dart';

class HomeScreen extends StatefulWidget {
  final appTitle;
  final locationAirQuality;
  final double latitude;
  final double longitude;
  HomeScreen(
      {this.appTitle, this.locationAirQuality, this.latitude, this.longitude});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AirQuality airQuality = AirQuality();

  int airQualityIndex;

  var carbonMonoxide;
  var nitrogenMonoxide;
  var nitrogenDioxide;
  var ozone;
  var sulphurDioxide;
  var fineParticlesMatter;
  var coarseParticulateMatter;
  var ammonia;

  String getCityName = 'Your area';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationAirQuality);
  }

  void updateUI(dynamic airQualityData) {
    setState(() {
      if (airQualityData == null) {
        airQualityIndex = 0;

        carbonMonoxide = 0;
        nitrogenMonoxide = 0;
        nitrogenDioxide = 0;
        ozone = 0;
        sulphurDioxide = 0;
        fineParticlesMatter = 0;
        coarseParticulateMatter = 0;
        ammonia = 0;

        return;
      }
      airQualityIndex = airQualityData['list'][0]['main']['aqi'];

      carbonMonoxide = airQualityData['list'][0]['components']['co'];
      nitrogenMonoxide = airQualityData['list'][0]['components']['no'];
      nitrogenDioxide = airQualityData['list'][0]['components']['no2'];
      ozone = airQualityData['list'][0]['components']['o3'];
      sulphurDioxide = airQualityData['list'][0]['components']['so2'];
      fineParticlesMatter = airQualityData['list'][0]['components']['pm2_5'];
      coarseParticulateMatter = airQualityData['list'][0]['components']['pm10'];
      ammonia = airQualityData['list'][0]['components']['nh3'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appTitle),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            DrawerHeader(
              child: Text(
                'Air Checker',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  image: DecorationImage(
                    image: AssetImage('images/air_quality_forecast.png'),
                    fit: BoxFit.contain,
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.details,
              ),
              title: Text('Details'),
              trailing: Icon(
                Icons.arrow_forward,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => DetailsScreen(
                      widget.appTitle,
                      carbonMonoxide,
                      nitrogenMonoxide,
                      nitrogenDioxide,
                      ozone,
                      sulphurDioxide,
                      fineParticlesMatter,
                      coarseParticulateMatter,
                      ammonia,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
                      child: Text(
                          'Latitude: ${widget.latitude.toStringAsFixed(2)}'),
                    ),
                  ),
                ),
                Expanded(
                    child: Center(
                        child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
                  child:
                      Text('longitude: ${widget.longitude.toStringAsFixed(2)}'),
                ))),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      '$getCityName\'s air Quality is ${airQuality.getAirQualityMessage(airQualityIndex)}!',
                      style: TextStyle(
                        fontFamily: 'Spartan MB',
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: ChangeColor.getColor(airQualityIndex),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      bottom: 20.0,
                    ),
                    child: TextField(
                      onSubmitted: (cityName) async {
                        var weather =
                            await WeatherModel().getCityWeather(cityName);
                        var searchedAirQualityData =
                            await airQuality.getSearchedCityAirQuality(
                                latitude: weather['coord']['lat'],
                                longitude: weather['coord']['lon']);
                        getCityName = cityName;
                        updateUI(searchedAirQualityData);
                      },
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        hintText: 'Enter City Name',
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    bottom: 20.0,
                  ),
                  child: FlatButton(
                    onPressed: () async {
                      var refreshedAirQualityData =
                          await airQuality.getAirQuality();
                      getCityName = 'Your area';
                      updateUI(refreshedAirQualityData);
                    },
                    child: Icon(Icons.refresh),
                    padding: EdgeInsets.all(18.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
