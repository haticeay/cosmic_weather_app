import 'package:cosmic_weather_app/core/model/nasa_model.dart';
import 'package:cosmic_weather_app/core/service/nasa_service.dart';

class NasaRepo {
  Future<List<NasaModel>> getNasaData() async {
    try {
      final response = await NasaService<Map<String, dynamic>>().getMethod(
        url: "",
        fromJson: (json) => json, // JSON nesnesi döndürülüyor
      );

      if (response == null) {
        return [];
      }

      List<NasaModel> nasaDataList = [];

      // API'nin `sol_keys` adlı anahtarında günlük hava durumu verileri var.
      List<String> solKeys = List<String>.from(response["sol_keys"] ?? []);

      for (var sol in solKeys) {
        var dayData = response[sol]; // Günlük hava durumu verisi
        if (dayData != null) {
          nasaDataList.add(NasaModel.fromJson(dayData));
        }
      }

      return nasaDataList;
    } catch (error) {
      print("NASA API Hatası: $error");
      return [];
    }
  }
}
