part of "models.dart";

class Mood {
  String id;
  String mood;
  String userId;
  String createdAt;

  Mood({
    required this.id,
    required this.mood,
    required this.userId,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'mood': mood,
      'userId': userId,
      'createdAt': createdAt,
    };
  }

  factory Mood.fromMap(Map<String, dynamic> map) {
    return Mood(
      id: map['_id'] != null ? map['_id'] as String : '',
      mood: map['mood'] != null ? map['mood'] as String : '',
      userId: map['userId'] != null ? map['userId'] as String : '',
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : '',
    );
  }
}
