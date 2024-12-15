import 'package:flutter/material.dart';
import 'package:want_front/components/buttons/login_button.dart';
import 'package:want_front/components/inputs/custom_text_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '회원가입',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'want',
                style: TextStyle(
                  color: Color(0xFFFF0099),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                '회원가입하고 나만의 위시를\n저장해봐요.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              const CustomTextField(
                label: '닉네임',
                hintText: '닉네임을 입력하세요.',
                isRequired: true,
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                label: '아이디',
                hintText: '사용할 아이디를 입력해주세요.',
                isRequired: true,
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                label: '비밀번호',
                hintText: '비밀번호를 입력해주세요.',
                obscureText: true,
                isRequired: true,
              ),
              const SizedBox(height: 40),
              LoginButton(
                text: '회원가입',
                backgroundColor: const Color(0xFFFF0099),
                textColor: Colors.white,
                onPressed: () {
                  // 회원가입 처리
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
} 