import 'package:cosmic_weather_app/core/model/nasa_model.dart';
import 'package:cosmic_weather_app/core/repo/nasa_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetNasaCubit extends Cubit<List<NasaModel>> {
  GetNasaCubit() : super([]);

  var repo = NasaRepo();

  Future<void> getNasa() async {
    var item = await repo.getNasaData();
    emit(item); // Artık bir liste döndürüyor!
print(item) ;
 }
}
