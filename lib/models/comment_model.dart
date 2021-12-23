import 'dart:convert';

class Comment {
  final int ? id;
  final int ? user_id;
  final int ? product_id;
  final String content;
  Comment({
    this.id,
    this.user_id,
    this.product_id,
    required this.content,
  });

  Comment copyWith({
    int? id,
    int? user_id,
    int? product_id,
    String? content,
  }) {
    return Comment(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      product_id: product_id ?? this.product_id,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': user_id,
      'product_id': product_id,
      'content': content,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id']?.toInt() ?? 0,
      user_id: map['user_id']?.toInt() ?? 0,
      product_id: map['product_id']?.toInt() ?? 0,
      content: map['content'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) => Comment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Comment(id: $id, user_id: $user_id, product_id: $product_id, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Comment &&
        other.id == id &&
        other.user_id == user_id &&
        other.product_id == product_id &&
        other.content == content;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    user_id.hashCode ^
    product_id.hashCode ^
    content.hashCode;
  }
}