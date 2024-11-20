// ignore: unused_import
import 'package:app_note/view/screen/loginpage.dart'; // تأكد من استيراد صفحة LoginView
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    // تأخير لمدة 5 ثوانٍ قبل الانتقال إلى صفحة تسجيل الدخول
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const LoginPage(), // الانتقال إلى صفحة تسجيل الدخول
          ),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'images/icon.png', // مسار الصورة
              width: 130, // عرض الصورة
              height: 130, // ارتفاع الصورة
            ),
            const SizedBox(height: 280), // مساحة فارغة بين الصورة والنص
            const Text(
              'by: Awis ALmrony', // النص الخاص بالمطور
              style: TextStyle(
                fontSize: 16, // حجم الخط
                fontWeight: FontWeight.bold, // جعل النص غامقًا
                color: Colors.grey, // لون النص
              ),
            ),
          ],
        ),
      ),
    );
  }
}
