import 'dart:convert';
import 'package:http/http.dart' as http;

class TranslationApi {
  static final _apiKey = "AIzaSyAhF-oWKShVY5PzUUsI6lYxct4e7z4DFG0";
  
  
  static Future<String> translate(String massage, String toLanguageCode) async{
    final response = await http.post(
      'https://translation.googleapis.com/language/translate/v2?target=$toLanguageCode&key=$_apiKey&q=$massage'
    );
    final body = jsonDecode(response.body);
    if (response.statusCode==200) {
      return body['data']['translations'][0]['translatedText'].toString();
    } else {
      print(body.toString());
      return null;
    }
  }
}