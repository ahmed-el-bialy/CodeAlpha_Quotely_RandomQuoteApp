import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
  static const String baseUrl = "https://api.api-ninjas.com/v2/";
  static const String randomQuote = "randomquotes";
}
