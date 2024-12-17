class WishlistItem {
  final String id;
  final String title;
  final double price;
  final String purchaseSite;
  final String description;
  final String status;

  WishlistItem({
    required this.id,
    required this.title,
    required this.price,
    required this.purchaseSite,
    required this.description,
    required this.status,
  });

  // Map으로 변환 (toMap)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'purchaseSite': purchaseSite,
      'description': description,
      'status': status,
    };
  }

  // Map에서 객체로 변환 (fromMap)
  factory WishlistItem.fromMap(Map<String, dynamic> map) {
    return WishlistItem(
      id: map['id'],
      title: map['title'],
      price: map['price'],
      purchaseSite: map['purchaseSite'],
      description: map['description'],
      status: map['status'],
    );
  }
}
