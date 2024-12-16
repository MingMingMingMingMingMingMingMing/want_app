import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/wishlist_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WishlistNotifier extends StateNotifier<List<WishlistItem>> {
  WishlistNotifier() : super([]);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> fetchWishlist() async {
    final snapshot = await _firestore.collection('wishlists').get();
    state = snapshot.docs
        .map((doc) => WishlistItem.fromMap(doc.data()..['id'] = doc.id))
        .toList();
  }

  Future<void> addItem(WishlistItem item) async {
    await _firestore.collection('wishlists').add(item.toMap());
    await fetchWishlist(); // 업데이트된 리스트 가져오기
  }

  Future<void> removeItem(String id) async {
    await _firestore.collection('wishlists').doc(id).delete();
    await fetchWishlist(); // 업데이트된 리스트 가져오기
  }
}

final wishlistProvider = StateNotifierProvider<WishlistNotifier, List<WishlistItem>>((ref) {
  return WishlistNotifier();
}); 