import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lets_go/model/Places.dart';

class ApiService {

  List<PlacesDataModel> places = [];

  Future<List<PlacesDataModel>> fetchData() async{

    String url = "https://mocki.io/v1/acf41dcd-797d-4833-9414-0ef65e04f129";

    final response = await http.get(Uri.parse(url));

    if(response.statusCode ==200){

      var data = await jsonDecode(response.body) as List;

      final places = data.map((value) => PlacesDataModel.fromJson(value)).toList();
      //  print( "places:$places");

      return places;
    }else{
      throw "Error Occured";
    }

    

  }

  
}