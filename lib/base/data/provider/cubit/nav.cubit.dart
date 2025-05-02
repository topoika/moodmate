part of "../provider.dart";

class NavCubit extends Cubit<NavStates> {
  NavCubit() : super(NavStates.initial());

  void setMood(String mood) {
    emit(state.copyWith(mood: mood));
  }

  void setQuote(Quote quote) {
    emit(state.copyWith(quote: quote));
  }
}

class NavStates {
  String? mood;
  Quote? quote;

  NavStates({this.mood, this.quote});

  NavStates copyWith({String? mood, Quote? quote}) {
    return NavStates(mood: mood ?? this.mood, quote: quote ?? this.quote);
  }

  // initial state
  NavStates.initial() {
    mood = null;
    quote = null;
  }
}
