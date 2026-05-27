import 'package:flutter/material.dart';
import 'app_theme.dart';

import 'screens/auth/login_screen.dart';
import 'screens/student/student_dashboard.dart';
import 'screens/admin/admin_dashboard.dart';

void main() {
  runApp(const UniTestApp());
}

class UniTestApp extends StatelessWidget {
  const UniTestApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'UniTest Enterprise',

      theme: AppTheme.lightTheme,

      initialRoute: '/',

      routes: {

        '/': (context) =>
        const LoginScreen(),

        '/student-dashboard': (context) =>
        const StudentDashboard(),

        '/admin-dashboard': (context) =>
        const AdminDashboard(),
      },
    );
  }
}