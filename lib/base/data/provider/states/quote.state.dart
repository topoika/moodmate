part of "../provider.dart";

class QuoteStates extends Equatable {
  const QuoteStates();
  @override
  List<Object?> get props => [];
}

class QuoteInitialState extends QuoteStates {}

class QuoteLoadingState extends QuoteStates {}

class QuoteLoadedState extends QuoteStates {
  final Quote quote;
  const QuoteLoadedState(this.quote);
  @override
  List<Object?> get props => [quote];
}

class QuotesLoadedState extends QuoteStates {
  final List<Quote> quotes;
  const QuotesLoadedState(this.quotes);
  @override
  List<Object?> get props => [quotes];
}

class QuoteErrorState extends QuoteStates {
  final String message;
  const QuoteErrorState(this.message);
  @override
  List<Object?> get props => [message];
}

class FeedbackSentState extends QuoteStates {
  final String message;
  const FeedbackSentState(this.message);
  @override
  List<Object?> get props => [message];
}
