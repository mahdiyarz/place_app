import 'dart:convert';

import 'package:http/http.dart' as http;

//const GOOGLE_API_KEY = 'AIzaSygfdCcMjFeTulcNQ7VTXaayuK3H_R-Ob1tkNw';
const ACCESS_TOKEN =
    'pk.eyJ1IjofgdfgibWFoZGl5YXJ6IiwiYSI6ImNrc3I2ejlpODBqcGEzMW8zYTFmcmhoNTUifQ.-9eKSdDbne82Cbjz9fimTw';

const ACCESS_TOKEN_GEOCODING =
    'pk.eyJ1Ijoic2VhcmNoLW1fdfghY2hpbmUtdXNlci0xIiwiYSI6ImNrN2Y1Nmp4YjB3aG4zZ253YnJoY21kbzkifQ.JM5ZeqwEEm-Tonrk5wOOMw';

class LocationHelper {
  static String generateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    // return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=20&size=600x300&maptype=roadmap&markers=color:yellow%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
    return 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/geojson(%7B%22type%22%3A%22Point%22%2C%22coordinates%22%3A%5B$longitude%2C$latitude%5D%7D)/$longitude,$latitude,14/500x300?access_token=$ACCESS_TOKEN';
  }

  static Future<String> getAddress(double lat, double lng) async {
    final url = Uri.parse(
        "https://api.mapbox.com/geocoding/v5/mapbox.places/$lng,$lat.json?access_token=$ACCESS_TOKEN");
    // print(url);
    final response = await http.get(url);
    // print(json.decode(response.body)["features"][0]["place_name"]);
    return json.decode(response.body)["features"][0]["place_name"];
  }
}
