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