import 'package:flutter/material.dart';
import 'package:employee_directory/core/theme/app_theme.dart';

class ErrorState extends StatelessWidget {
  final String error;
  const ErrorState({required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 40, color: AppColors.slate),
            const SizedBox(height: 12),
            const Text(
              "Couldn't load the roster",
              style: TextStyle(fontFamily: 'serif', fontSize: 17, color: AppColors.ink),
            ),
            const SizedBox(height: 6),
            Text(
              error,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12.5, color: AppColors.slate),
            ),
            const SizedBox(height: 4),
            const Text(
              'Pull down to try again.',
              style: TextStyle(fontSize: 12.5, color: AppColors.slate),
            ),
          ],
        ),
      ),
    );
  }
}
