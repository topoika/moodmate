part of "../provider.dart";

class QuoteEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetQuoteEvent extends QuoteEvents {
  final String mood;

  GetQuoteEvent(this.mood);

  @override
  List<Object?> get props => [mood];
}
class GetUserQuotesEvent extends QuoteEvents {
  @override
  List<Object?> get props => [];
}

class SendFeedbackEvent extends QuoteEvents {
  final Quote quote;
  final String message;

  SendFeedbackEvent(this.quote, this.message);

  @override
  List<Object?> get props => [quote, message];
}
class GetUserFeedbacksEvent extends QuoteEvents {
  @override
  List<Object?> get props => [];
}