import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(),
            child: Image.asset(
              'images/icon.png', // تأكد من صحة المسار
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.blueAccent),
            title: const Text(
              'الرئيسية',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pushNamed(
                  context, '/home'); // الانتقال إلى صفحة الرئيسية
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.green),
            title: const Text(
              'الإعدادات',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pushNamed(
                  context, '/settings'); // الانتقال إلى صفحة الإعدادات
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text(
              'تسجيل الخروج',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              // الانتقال إلى صفحة تسجيل الدخول مع إزالة جميع الصفحات السابقة من المكدس
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login', // صفحة تسجيل الدخول
                (route) => false, // إفراغ المكدس لمنع الرجوع
              );
            },
          ),
        ],
      ),
    );
  }
}
