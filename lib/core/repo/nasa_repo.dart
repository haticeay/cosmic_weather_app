import 'package:cosmic_weather_app/core/model/nasa_model.dart';
import 'package:cosmic_weather_app/core/service/nasa_service.dart';

class NasaRepo {
  Future<List<NasaModel>> getNasaData() async {
  
    try {
      final response = await NasaService<Map<String, dynamic>>().getMethod(
        url: "",
        fromJson: (json) => json,
      );

      if (response == null) {
        return [];
      }

      List<NasaModel> nasaDataList = [];

      response.forEach((sol, data) {
        if (sol != 'sol_keys' && sol != 'validity_checks') {
          var atmosphericTemperature = data['AT'];
          var pressureData = data['PRE'];
          var windData = data['HWS'];

          nasaDataList.add(
            NasaModel(
              minTemp: atmosphericTemperature?['mn'] as double?,
              maxTemp: atmosphericTemperature?['mx'] as double?,
              avgTemp: atmosphericTemperature?['av'] as double?,
              pressure: pressureData?['av'] as double?,
              horizontalWindSpeed: windData?['av'] as double?,
              windDirectionCompassPoint: data['WD']['most_common']['compass_point'] as String?,
              atmoOpacity: data['ATMO_OPACITY'] as String?,
              sol: sol,
            ),
          );
        }
      });

      return nasaDataList;
    } catch (error) {
      print("NASA API Hatası: $error");
      return [];
    }
  }
}