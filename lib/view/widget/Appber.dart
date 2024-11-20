import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal, // لون خلفية التطبيق
      centerTitle: true,
      title: const Text(
        'ملاحظة',
        style: TextStyle(
          color: Colors.white, // لون النص
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white, // لون أيقونة القائمة الجانبية
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer(); // فتح القائمة الجانبية
          },
        ),
      ),
      elevation: 4.0, // إضافة ارتفاع خفيف للتطبيق
      shadowColor: Colors.grey.withOpacity(0.5), // لون الظل
    );
  }
}
