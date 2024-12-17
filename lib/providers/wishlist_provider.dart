import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/wishlist_item.dart';
import '../helpers/database_helper.dart';

class WishlistNotifier extends StateNotifier<List<WishlistItem>> {
  WishlistNotifier() : super([]);

  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> fetchWishlist() async {
    state = await _databaseHelper.getWishlistItems();
  }

  Future<void> addItem(WishlistItem item) async {
    await _databaseHelper.insertWishlistItem(item);
    await fetchWishlist(); // 업데이트된 리스트 가져오기
  }

  Future<void> removeItem(String id) async {
    await _databaseHelper.deleteWishlistItem(id);
    await fetchWishlist(); // 업데이트된 리스트 가져오기
  }
}

final wishlistProvider = StateNotifierProvider<WishlistNotifier, List<WishlistItem>>((ref) {
  return WishlistNotifier();
}); 