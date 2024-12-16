import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/wishlist_provider.dart';
import '../models/wishlist_item.dart';

class WishlistAddPage extends ConsumerWidget {
  const WishlistAddPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlistNotifier = ref.watch(wishlistProvider.notifier);

    String title = '';
    double price = 0;
    String purchaseSite = '';
    String description = '';
    String status = '관심있음';

    return Scaffold(
      appBar: AppBar(
        title: const Text('위시 추가'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: '제목'),
              onChanged: (value) => title = value,
            ),
            TextField(
              decoration: const InputDecoration(labelText: '가격'),
              keyboardType: TextInputType.number,
              onChanged: (value) => price = double.tryParse(value) ?? 0,
            ),
            TextField(
              decoration: const InputDecoration(labelText: '구매 사이트'),
              onChanged: (value) => purchaseSite = value,
            ),
            TextField(
              decoration: const InputDecoration(labelText: '자세한 설명'),
              maxLines: 3,
              onChanged: (value) => description = value,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    status = '구매예정';
                  },
                  child: const Text('구매예정'),
                ),
                ElevatedButton(
                  onPressed: () {
                    status = '구매완료';
                  },
                  child: const Text('구매완료'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final newItem = WishlistItem(
                  id: '', // Firestore에서 자동 생성
                  title: title,
                  price: price,
                  purchaseSite: purchaseSite,
                  description: description,
                  status: status,
                );
                wishlistNotifier.addItem(newItem);
                Navigator.pop(context);
              },
              child: const Text('추가'),
            ),
          ],
        ),
      ),
    );
  }
}
