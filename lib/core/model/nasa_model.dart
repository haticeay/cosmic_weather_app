class NasaModel {
  final double? minTemp;
  final double? maxTemp;
  final double? avgTemp; // Ortalama sıcaklık
  final double? pressure;
  final double? horizontalWindSpeed;
  final String? windDirectionCompassPoint;
  final String? atmoOpacity; // Atmosferik Opaklık
  final String? sol; // Hangi Mars gününe ait olduğu bilgisi

  NasaModel({
    this.minTemp,
    this.maxTemp,
    this.avgTemp,
    this.pressure,
    this.horizontalWindSpeed,
    this.windDirectionCompassPoint,
    this.atmoOpacity,
    this.sol,
  });

  factory NasaModel.fromJson(Map<String, dynamic> json) {
    var atmosphericTemperature = json['AT'];
    var pressureData = json['PRE'];
    var windData = json['HWS'];

    return NasaModel(
      minTemp: atmosphericTemperature?['mn'] as double?,
      maxTemp: atmosphericTemperature?['mx'] as double?,
      avgTemp: atmosphericTemperature?['av'] as double?,
      pressure: pressureData?['av'] as double?,
      horizontalWindSpeed: windData?['av'] as double?,
      windDirectionCompassPoint: json['WD']['most_common']['compass_point'] as String?,
      atmoOpacity: json['ATMO_OPACITY'] as String?,
      sol: json['sol'] as String?,
    );
  }
}