import 'package:flutter/material.dart';
import 'package:employee_directory/core/theme/app_theme.dart';

class EmptyState extends StatelessWidget {
  const EmptyState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.badge_outlined, size: 40, color: AppColors.slate),
            SizedBox(height: 12),
            Text(
              'No one matches this view',
              style: TextStyle(fontFamily: 'serif', fontSize: 17, color: AppColors.ink),
            ),
            SizedBox(height: 6),
            Text(
              'Try a different filter or search term.',
              style: TextStyle(fontSize: 12.5, color: AppColors.slate),
            ),
          ],
        ),
      ),
    );
  }
}
