import 'package:quotely/features/home/data/models/quote_model.dart';
import 'package:quotely/features/home/data/webservices/webservices.dart';

class HomeRepo {
  final Webservices webServices;

  HomeRepo({required this.webServices});

  Future<QuoteModel> getRandomQuote() async {
    var response = await webServices.getRandomQuote();

    return response;
  }
}
