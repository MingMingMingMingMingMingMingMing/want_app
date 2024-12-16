import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:want_front/pages/wishlist_add_page.dart';
import 'package:want_front/pages/wish_list.dart';
import 'package:want_front/pages/wishlist_detail_page.dart';
import '../providers/wishlist_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlist = ref.watch(wishlistProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('홈'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WishList()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WishlistAddPage()),
                );
              },
              child: const Text('+ 위시 추가'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: wishlist.length,
                itemBuilder: (context, index) {
                  final item = wishlist[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WishlistDetailPage(item: item),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(item.title),
                      subtitle: Text('${item.price}원'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
} 