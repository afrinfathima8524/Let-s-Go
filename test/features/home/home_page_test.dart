import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:lets_go/features/home/repo/places_repo.dart';
import 'package:lets_go/model/Places.dart';
import 'package:mocktail/mocktail.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  late PlacesRepo placesRepo;
  late MockHTTPClient mockHTTPClient;
  setUp(() {
    mockHTTPClient = MockHTTPClient();
    placesRepo = PlacesRepo(mockHTTPClient);
  });
  Future<String> _loadMockData(String path) async {
    final file = File(path);
    return await file.readAsString();
  }

  group('Home Page', () {
    test('given the api data when status code is 200 then return the data',
        () async {
      final mockData = await _loadMockData('test/test_data/places.json');
      when(
        () => mockHTTPClient.get(
          Uri.parse('https://mocki.io/v1/eecf478e-90fe-4beb-b869-22562682fd89'),
        ),
      ).thenAnswer((_) async {
        return Response(mockData, 200);
      });
      final places = await placesRepo.fetchPlace();
      expect(places, isA<List<PlacesDataModel>>());
      expect(places.length, 10);
      expect(places[0], isA<PlacesDataModel>());
    });
    test('given the api data when status code is not 200 then return the data',
        () async {
      when(
        () => mockHTTPClient.get(
          Uri.parse('https://mocki.io/v1/eecf478e-90fe-4beb-b869-22562682fd89'),
        ),
      ).thenAnswer((_) async {
        return Response('{}', 500);
      }); 
      final places= await placesRepo.fetchPlace();
      expect(places, []);
    });
  });
}
