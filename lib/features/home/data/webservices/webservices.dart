import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';
import '../models/quote_model.dart';

part 'webservices.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class Webservices {
  factory Webservices(Dio dio, {String? baseUrl}) = _Webservices;

  @GET(ApiConstants.randomQuote)
  Future<List<QuoteModel>> getRandomQuote(
      @Header("X-Api-Key") String apiKey,
      );
}