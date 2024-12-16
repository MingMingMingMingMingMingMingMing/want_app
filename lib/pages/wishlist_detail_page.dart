import 'package:flutter/material.dart';
import '../models/wishlist_item.dart';

class WishlistDetailPage extends StatelessWidget {
  final WishlistItem item;

  const WishlistDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상세 정보'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.image, size: 100, color: Colors.grey), // 이미지 자리
            ),
            const SizedBox(height: 16),
            Text(
              item.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '${item.price}원',
              style: const TextStyle(fontSize: 20, color: Color(0xFFFF0099)),
            ),
            const SizedBox(height: 16),
            Text(
              '구매 사이트: ${item.purchaseSite}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              '상세 설명: ${item.description}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              '위시 상태: ${item.status}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // 구매 사이트로 이동하는 기능 추가
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF0099),
              ),
              child: const Text('구매 사이트 바로가기'),
            ),
          ],
        ),
      ),
    );
  }
} 