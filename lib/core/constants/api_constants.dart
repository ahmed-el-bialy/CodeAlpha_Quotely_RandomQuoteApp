import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
  static String  baseUrl = "https://api.api-ninjas.com/v2";
  static String  randomQuote = "randomquotes";
}
