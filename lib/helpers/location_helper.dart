const GOOGLE_API_KEY = 'AIzaSyCcMjFeTulcNQ7VTXaayuK3H_R-Ob1tkNw';

class LocationHelper {
  static String generateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=20&size=600x300&maptype=roadmap&markers=color:yellow%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}
