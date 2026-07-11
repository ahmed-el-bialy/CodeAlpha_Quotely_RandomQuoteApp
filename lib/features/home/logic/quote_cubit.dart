import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotely/features/home/logic/quote_state.dart';

import '../data/repo/home_repo.dart';

class QuoteCubit extends Cubit<QuoteState> {
  QuoteCubit(this.homeRepo) : super(QuoteInitial()) {
    getRandomQuote();
  }

  final HomeRepo homeRepo;

  Future<void> getRandomQuote() async {
    emit(QuoteLoading());

    try {
      final quote = await homeRepo.getRandomQuote();
      emit(QuoteLoaded(quote));
    } on DioException {
      emit(QuoteError("there is a problem with the network or the server."));
    } catch (_) {
      emit(QuoteError('there is a problem.'));
    }
  }
}
