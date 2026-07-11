import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotely/features/home/logic/quote_state.dart';

import '../data/repo/home_repo.dart';

class QuoteCubit extends Cubit<QuoteState> {
  final HomeRepo homeRepo;

  QuoteCubit(this.homeRepo) : super(QuoteInitial());

  Future<void> getRandomQuote() async {
    emit(QuoteLoading());

    try {
      final quote = await homeRepo.getRandomQuote();
      emit(QuoteLoaded(quote));
    } on DioException catch (e) {
      print("Dio Error: ${e.message}");
      emit(QuoteError("There is a problem with the network or the server."));
    } catch (e) {
      print("General Error: $e");
      emit(QuoteError('There is a problem.'));
    }
  }
}