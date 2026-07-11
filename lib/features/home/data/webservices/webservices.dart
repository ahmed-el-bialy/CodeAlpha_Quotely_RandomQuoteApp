import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';
import '../models/quote_model.dart';

part 'webservices.g.dart';

@RestApi()
abstract class Webservices {
  factory Webservices(Dio dio, {String? baseUrl}) = _Webservices;

  @GET(ApiConstants.randomQuote)
  Future<QuoteModel> getRandomQuote();
}
