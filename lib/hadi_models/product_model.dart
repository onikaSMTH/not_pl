import 'dart:convert';


class Product {

  final int ? id;
  final String name;
  final dynamic image;
  final String expirationDate;
  final String contactInfo;
  final int quantity;
  final double price;
  final int ? userId;
  final int ? views;

  Product({
    this.id,
    required this.name,
    required this.image,
    required this.expirationDate,
    required this.contactInfo,
    required this.quantity,
    required this.price,
    this.userId,
    this.views,
  });

  Product copyWith({
    int? id,
    String? name,
    String? image,
    String? expirationDate,
    String? contactInfo,
    int? quantity,
    double? price,
    int? userId,
    int? views,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      expirationDate: expirationDate ?? this.expirationDate,
      contactInfo: contactInfo ?? this.contactInfo,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      userId: userId ?? this.userId,
      views: views ?? this.views,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'expirationDate': expirationDate,
      'contactInfo': contactInfo,
      'quantity': quantity,
      'price': price,
      'userId': userId,
      'views': views,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      expirationDate: map['expiration_date'] ?? '',
      contactInfo: map['contact_info'] ?? '',
      quantity: map['quantity']?.toInt() ?? 0,
      price: map['price']?.toDouble() ?? 0.0,
      userId: map['user_id']?.toInt() ?? 0,
      views: map['views']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, name: $name, image: $image, expirationDate: $expirationDate, contactInfo: $contactInfo, quantity: $quantity, price: $price, userId: $userId, views: $views)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.name == name &&
        other.image == image &&
        other.expirationDate == expirationDate &&
        other.contactInfo == contactInfo &&
        other.quantity == quantity &&
        other.price == price &&
        other.userId == userId &&
        other.views == views;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    name.hashCode ^
    image.hashCode ^
    expirationDate.hashCode ^
    contactInfo.hashCode ^
    quantity.hashCode ^
    price.hashCode ^
    userId.hashCode ^
    views.hashCode;
  }
}