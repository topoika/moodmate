part of "../provider.dart";

class QuoteRepo extends NetworkRequest {
  // get quote
  Future<Quote> getQuote(String mood) async {
    try {
      final response = await post("get-quote", body: {"mood": mood});
      if (response['success'] == true) {
        return Quote.fromMap(response['quote']);
      } else {
        throw CustomError(response['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  // get user quotes
  Future<List<Quote>> getUserQuotes() async {
    try {
      final response = await get("get-user-quotes");
      if (response['success'] == true) {
        List<dynamic> data = response['quotes'];
        return data.map((quote) => Quote.fromMap(quote)).toList();
      } else {
        throw CustomError(response['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  // send feedback
  Future<void> sendFeedback(Quote quote, String message) async {
    try {
      final response = await post(
        "send-feedback",
        body: {"quoteId": quote.id, "moodId": quote.moodId, "message": message},
      );
      if (response['success'] == true) {
        return;
      } else {
        throw CustomError(response['error']);
      }
    } catch (e) {
      rethrow;
    }
  }

  // user feedbacks
  Future<List<Feedback>> getUserFeedbacks() async {
    try {
      final response = await get("get-user-feedback");
      if (response['success'] == true) {
        List<dynamic> data = response['feedback'];
        return data.map((feedback) => Feedback.fromMap(feedback)).toList();
      } else {
        throw CustomError(response['message']);
      }
    } catch (e) {
      rethrow;
    }
  }
}
