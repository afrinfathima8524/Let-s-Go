import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lets_go/model/Places.dart';

class PlacesRepo {
  final http.Client client;
  PlacesRepo(this.client);
  Future<List<PlacesDataModel>> fetchPlace({String? query}) async {
    List<PlacesDataModel> places = [];
    try {
      var response = await client.get(Uri.parse(
          'https://mocki.io/v1/eecf478e-90fe-4beb-b869-22562682fd89'));
      List result = jsonDecode(response.body);
      for (var i = 0; i < result.length; i++) {
        PlacesDataModel place =
            PlacesDataModel.fromJson(result[i] as Map<String, dynamic>);
        places.add(place);
        if (query != null) {
          places = places
              .where((element) =>
                  element.name!.toLowerCase().contains(query.toLowerCase()))
              .toList();
        }
      }
      return places;
    } catch (e) {
      return [];
    }
  }
}
