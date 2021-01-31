import 'package:air_checker/services/location.dart';
import 'package:air_checker/services/networking.dart';

const apiKey = ''; // Enter your openweathermap API Key
const airPollutionAPIURL =
    'http://api.openweathermap.org/data/2.5/air_pollution';

class AirQuality {
  //Air Pollution Data
  Future<dynamic> getAirQuality() async {
    Location location = Location();
    await location.getCurrentLocation();

    return getSearchedCityAirQuality(
        latitude: location.latitude, longitude: location.longitude);
  }

  Future<dynamic> getSearchedCityAirQuality({latitude, longitude}) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$airPollutionAPIURL?lat=$latitude&lon=$longitude&appid=$apiKey');

    var airPollutionData = await networkHelper.getData();
    return airPollutionData;
  }

  String getAirQualityMessage(int index) {
    if (index == 1) {
      return 'Good';
    } else if (index == 2) {
      return 'Fair';
    } else if (index == 3) {
      return 'Moderate';
    } else if (index == 4) {
      return 'Poor';
    } else if (index == 5) {
      return 'Very Poor';
    } else {
      return 'Not found!';
    }
  }
}
