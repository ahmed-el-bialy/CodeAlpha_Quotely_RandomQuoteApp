import 'package:quotely/features/home/data/models/quote_model.dart';
import 'package:quotely/features/home/data/webservices/webservices.dart';

import '../../../../core/constants/api_constants.dart';

class HomeRepo {
  final Webservices webServices;

  HomeRepo({required this.webServices});

  Future<QuoteModel> getRandomQuote() async {
    final List<QuoteModel> response = await webServices.getRandomQuote(
      ApiConstants.apiKey,
      DateTime.now().millisecondsSinceEpoch.toString(),
    );

    return response.first;
  }
}
