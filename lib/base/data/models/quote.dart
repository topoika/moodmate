part of 'models.dart';

class Quote {
  String? id;
  String? quote;
  String? moodId;
  String? userId;
  String? createdAt;

  Quote({this.id, this.quote, this.moodId, this.userId, this.createdAt});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'quote': quote,
      'moodId': moodId,
      'userId': userId,
      'createdAt': createdAt,
    };
  }

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      id: map['_id'] != null ? map['_id'] as String : '',
      quote: map['quote'] != null ? map['quote'] as String : '',
      moodId: map['mood'] != null ? map['mood'] as String : '',
      userId: map['userId'] != null ? map['userId'] as String : '',
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : '',
    );
  }
}
