import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/employees/presentation/screens/employee_list_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Directory',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const EmployeeListScreen(),
    );
  }
}
