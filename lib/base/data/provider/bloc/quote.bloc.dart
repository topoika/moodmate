part of "../provider.dart";

class QuoteBloc extends Bloc<QuoteEvents, QuoteStates> {
  final QuoteRepo repo;
  QuoteBloc({required this.repo}) : super(QuoteInitialState()) {
    on<GetQuoteEvent>(getQuote);
  }

  Future<void> getQuote(GetQuoteEvent event, emit) async {
    emit(QuoteLoadingState());
    try {
      final quote = await repo.getQuote(event.mood);
      emit(QuoteLoadedState(quote));
    } catch (e) {
      emit(QuoteErrorState(e.toString()));
    }
  }
}

class QuotesBloc extends Bloc<QuoteEvents, QuoteStates> {
  final QuoteRepo repo;
  QuotesBloc({required this.repo}) : super(QuoteInitialState()) {
    on<GetUserQuotesEvent>(getUserQuotes);
  }

  Future<void> getUserQuotes(GetUserQuotesEvent event, emit) async {
    emit(QuoteLoadingState());
    try {
      final quotes = await repo.getUserQuotes();
      emit(QuotesLoadedState(quotes));
    } catch (e) {
      emit(QuoteErrorState(e.toString()));
    }
  }
}

class FeedbackBloc extends Bloc<QuoteEvents, QuoteStates> {
  final QuoteRepo repo;
  FeedbackBloc({required this.repo}) : super(QuoteInitialState()) {
    on<SendFeedbackEvent>(sendFeedback);
  }

  Future<void> sendFeedback(SendFeedbackEvent event, emit) async {
    emit(QuoteLoadingState());
    try {
      await repo.sendFeedback(event.quote, event.message);
      emit(FeedbackSentState("Feedback sent successfully"));
    } catch (e) {
      emit(QuoteErrorState(e.toString()));
    }
  }
}
