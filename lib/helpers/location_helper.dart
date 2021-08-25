//const GOOGLE_API_KEY = 'AIzaSyCcMjFeTulcNQ7VTXaayuK3H_R-Ob1tkNw';
const ACCESS_TOKEN =
    'pk.eyJ1IjoibWFoZGl5YXJ6IiwiYSI6ImNrc3I2ejlpODBqcGEzMW8zYTFmcmhoNTUifQ.-9eKSdDbne82Cbjz9fimTw';

class LocationHelper {
  static String generateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    // return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=20&size=600x300&maptype=roadmap&markers=color:yellow%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
    return 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/geojson(%7B%22type%22%3A%22Point%22%2C%22coordinates%22%3A%5B$longitude%2C$latitude%5D%7D)/$longitude,$latitude,14/500x300?access_token=$ACCESS_TOKEN';
  }
}
