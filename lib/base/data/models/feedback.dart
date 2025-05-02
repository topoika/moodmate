part of "models.dart";

class Feedback {
  String? id;
  String? userId;
  Mood? mood;
  Quote? quote;
  String? message;
  String? createdAt;
  Feedback({
    required this.id,
    required this.userId,
    this.mood,
    this.quote,
    required this.message,
    required this.createdAt,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'moodId': mood?.id,
      'quoteId': quote?.id,
      'message': message,
    };
  }

  factory Feedback.fromMap(Map<String, dynamic> map) {
    return Feedback(
      id: map['_id'] != null ? map['_id'] as String : null,
      userId: map['user'] != null ? map['user'] as String : null,
      mood: map['mood'] != null ? Mood.fromMap(map['mood']) : null,
      quote: map['quote'] != null ? Quote.fromMap(map['quote']) : null,
      message: map['message'] != null ? map['message'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
    );
  }
}
